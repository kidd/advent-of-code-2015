dist = Hash.new
dist['AlphaCentauri to Snowdin'] =  66
dist['AlphaCentauri to Tambi'] =  28
dist['AlphaCentauri to Faerun'] =  60
dist['AlphaCentauri to Norrath'] =  34
dist['AlphaCentauri to Straylight'] =  34
dist['AlphaCentauri to Tristram'] =  3
dist['AlphaCentauri to Arbre'] =  108
dist['Snowdin to Tambi'] =  22
dist['Snowdin to Faerun'] =  12
dist['Snowdin to Norrath'] =  91
dist['Snowdin to Straylight'] =  121
dist['Snowdin to Tristram'] =  111
dist['Snowdin to Arbre'] =  71
dist['Tambi to Faerun'] =  39
dist['Tambi to Norrath'] =  113
dist['Tambi to Straylight'] =  130
dist['Tambi to Tristram'] =  35
dist['Tambi to Arbre'] =  40
dist['Faerun to Norrath'] =  63
dist['Faerun to Straylight'] =  21
dist['Faerun to Tristram'] =  57
dist['Faerun to Arbre'] =  83
dist['Norrath to Straylight'] =  9
dist['Norrath to Tristram'] =  50
dist['Norrath to Arbre'] =  60
dist['Straylight to Tristram'] =  27
dist['Straylight to Arbre'] =  81
dist['Tristram to Arbre'] =  90

cities = ['AlphaCentauri', 'Snowdin', 'Tambi', 'Faerun', 'Norrath', 'Straylight', 'Arbre', 'Tristram']

def km_for(l, dist)
  a = 0
  l.each_with_index do |e,i|
    if i == l.size-1
       break
    end
    str = "#{e} to #{l[i+1]}"
    or_str = "#{l[i+1]} to #{e}"
    a += (dist[str] || dist[or_str])
  end
  # puts "#{l.to_s},  => #{a}"
  return a
end


puts cities.permutation.to_a.map { |i| km_for(i.flatten, dist) }.minmax


# cities.permutation(cities.size) do |per|
#   # (0..per.size-2).each do |pos|
#   #   dist = dist["#{pers[pos]} to #{pers[pos+1]}"]
#   calc_dist(per)
#   # end
# end
