my $c1 = 0;
my $c2 = 0;

while (chomp($_ = <>)) {
  if (/(.*[aeiou]){3,}/ && /(.)\1/) {
    $c1++ unless /(ab|cd|pq|xy)/ ;
  }
  if (/(..).*\1/ && /(.).\1/) {$c2++;}
}
print("1: $c1\n");
print("2: $c2\n");
