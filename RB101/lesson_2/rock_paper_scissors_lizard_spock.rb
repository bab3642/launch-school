VALID_CHOICES = %w(r p sc l sp)

MOVES = {
  r: %w(sc l),
  p: %w(r sp),
  sc: %w(p l),
  sp: %w(sc r),
  l: %w(sp p)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  MOVES[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def count_wins(player, computer)
  if win?(player[:choice], computer[:choice])
    player[:wins] += 1
  elsif win?(computer[:choice], player[:choice])
    computer[:wins] += 1
  end
end

opening_prompt = <<-MSG
=>Welcome to Rock Paper Scissors Lizard Spock!

We will play three rounds!
Rock = r
Paper = p
Scissors = sc
Lizard = l
Spock = sp

MSG
prompt(opening_prompt)

loop do
  round = 1
  computer = { wins: 0 }
  player = { wins: 0 }
  loop do
    prompt("Round #{round}:")

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      player[:choice] = Kernel.gets().chomp()

      if VALID_CHOICES.include?(player[:choice])
        break
      else
        prompt("That's not a valid chocie.")
      end
    end

    computer[:choice] = VALID_CHOICES.sample

    prompt("You chose: #{player[:choice]}; Computer chose
    : #{computer[:choice]}")

    display_results(player[:choice], computer[:choice])
    count_wins(player, computer)
    round += 1

    if computer[:wins] == 3
      prompt("The computer wins the match!")
      break
    elsif player[:wins] == 3
      prompt("The player wins the match!")
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!\n")
