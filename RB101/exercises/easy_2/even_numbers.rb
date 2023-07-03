puts(Array(1..99).select { |num| num.even? })

#and

1.upto(99) { |num| puts num if num % 2 == 0 }