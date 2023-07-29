# stack and register
# n - place a value in the register, no stack modification
# PUSH - push register value ONTO the stack. Leave value in register
# ADD - pops a value from the stack and ADDS it to the register value, stores result in the register
# SUB - pops a value from the stack and subtracts it from the register value,, storing result in register
# MULT - pop, multiply, store result
# DIV - pop, divide, store result
# MOD - pop, remainder, store result
# POP, remove and place in register
# PRINT - print register value


# ALL are integer operations
# Programs are supplied to klanguage via a string 

# All programs are correct (no edge cases)

# INITIALIZE REGISTER TO ZERO
require 'pry'

NUMBERS = %w(1 2 3 4 5 6 7 8 9 0 -1 -2 -3 -4 -5 -6 -7 -8 -9)


def minilang(string)
  register = 0
  stack = []
  commands = string.split
  commands.each do |command|
    if NUMBERS.include?(command)
      register = command.to_i 
    elsif command ==  'PUSH'
      stack << register 
    elsif command == 'PRINT'
      display(register) 
    elsif stack.empty?
      display("Error stack empty")
    else
      case command
      when "POP"  then register = stack.pop
      when "MULT" then register = register * stack.pop
      when "ADD"  then register = register + stack.pop
      when "DIV"  then register = register / stack.pop
      when "MOD"  then register = register % stack.pop
      when "SUB"  then register = register - stack.pop
      else             display("Error invalid token")
      end
    end
  end
  nil
end

def push!(register, stack)
end

def display(register)
  puts "#{register}"
end



minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


# (nothing printed; no PRINT commands)

# Data structure : I will use arrays for the register and for the stack
# Algorithm: 

# INITIALIZE stack and register arrays, setting default value of register to 0 and stack is empty
# Break down string into words
# IF the string is an integer, store it
# IF the string is a command, execute that command on the corresponsing element
# Finish
