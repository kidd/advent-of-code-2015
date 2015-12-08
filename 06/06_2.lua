--[[
This program opens a file and reads and writes
it line by line
]]

-- Open a file for read an test that it worked
fh,err = io.open("input.txt")
if err then print("OOps"); return; end

-- Open a file for write
fho,err = io.open("requests.new","w")

-- line by line

local function init_led(size)
  local t = {}
  for i = 0, size-1 do
    t[i] = {}
    for j = 0, size-1 do
      t[i][j] = 0
    end
  end
  return t
end

local function change(f)
  return function (t, x, y)
    t[x][y] = f(t,x, y)
  end
end

local turn_on = change(function(t,x,y) return t[x][y]+1  end)
local turn_off = change(function(t,x,y) if t[x][y]-1 < 0 then return 0 else return t[x][y]-1 end end)
local toggle = change(function(ta, x, y)  return ta[x][y] +2 end)

local t = init_led(1000)

local do_op = function (op, t, from, to)
  local f_x, f_y = string.match(from, "(%d+),(%d+)")
  local t_x, t_y = string.match(to, "(%d+),(%d+)")
  for i = f_x, t_x do
    for j = f_y, t_y do
      op(t, i, j)
    end
  end
end

while true do
  line = fh:read()
  if line == nil then break end
  local op = nil
  local from,to = string.match(line, "toggle (.*) through (.*)")
  if from then
    op = toggle
  elseif string.match(line, "turn on (.*) through (.*)") then
    from,to = string.match(line, "turn on (.*) through (.*)")
    op = turn_on
  elseif string.match(line, "turn off (.*) through (.*)") then
    from,to = string.match(line, "turn off (.*) through (.*)")
    op = turn_off
  else
  end

  do_op(op, t, from , to)
end

local a = 0
for i = 0, 999 do
  for j = 0, 999 do
     a = a+t[i][j]
  end
end

print(a)


-- Following are good form
fh:close()
fho:close()

-- removes any file called test.bak
print (os.remove("test.bak") and "File removed" or "No action")
