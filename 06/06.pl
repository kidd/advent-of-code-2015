
while(chomp($_ = <>)) {
  s/,/./g;
  if (m/turn off (.*) through (.*)$/) {}
  elsif (m/turn on (.*) through (,*)$/) {}
  elsif (m/toggle (.*) through (,*)$/) {}
}
