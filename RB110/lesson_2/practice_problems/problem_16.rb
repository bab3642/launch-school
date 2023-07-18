HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def create_random_uuid()
  string = ''
  string << random_hex_char(8)
  string << '-'
  string << random_hex_char(4)
  string << '-'
  string << random_hex_char(4)
  string << '-'
  string << random_hex_char(4)
  string << '-'
  string << random_hex_char(12)
  string
end


def random_hex_char(num)
  chars = ''
  num.times do
    chars << HEX.sample
  end
  chars
end

p create_random_uuid()