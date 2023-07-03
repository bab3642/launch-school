
def multiply(num1, num2)
  num1 * num2
end

def square(num, power = num)
    multiply(num, 1) ** power 
end


p square(2, 3)
p square(5)
p square(5, 5)