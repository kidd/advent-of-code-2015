local _run = require("runtime")
function parens()
  repeat
    repeat
      io.write('counter = 0')
      io.write("\n")
      repeat
        repeat
          _run.testSTR('(')
          if not _switch then break   end
          io.write('counter = counter+1')
          io.write("\n")
        until true
        if _switch then break end
        repeat
          _run.testSTR(')')
          if not _switch then break   end
          io.write('counter = counter-1')
          io.write("\n")
        until true
      until true
      if not _switch then error() end
      repeat
