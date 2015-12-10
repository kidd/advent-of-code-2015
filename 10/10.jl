s =  "3113322113"


for r in 1:50
    s = join(map((x) -> string(length(x)) * string(x[1]), matchall(r"(.)\1*", s) ), "")
    # println(s)
    # a = ""
    # for i in matchall(r"(.)\1*", s)
    #     # print("   " , i , "\n")
    #     a = a * join(string(length(i)) * string(i[1]), "")
    # end
    # s = a
    # println(a)
end
println(length(s))
