# Generate the regex string with
# pos=`ruby -e "puts ('a'..'z').map(&:to_s).join.scan(/(?=(...))/).join('\|')"`
# perl -e '$_="hxbxwxba" ; print("$_\n") while $_++;' | grep -v 'l\|i\|o' | grep '\(.\)\1.*\(.\)\2' | grep "'$pos'"

perl -e '$_="hxbxwxba" ; print("$_\n") while $_++;' | grep -v 'l\|i\|o' | grep '\(.\)\1.*\(.\)\2' | grep 'abc\|bcd\|cde\|def\|efg\|fgh\|ghi\|hij\|ijk\|jkl\|klm\|lmn\|mno\|nop\|opq\|pqr\|qrs\|rst\|stu\|tuv\|uvw\|vwx\|wxy\|xyz'
