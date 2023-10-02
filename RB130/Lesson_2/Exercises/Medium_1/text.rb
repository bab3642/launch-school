require 'minitest/autorun'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end



# class TextTest < Minitest::Test
#   def setup
#     @file = File.open('more_sample_text.txt', 'r')
#     @text = Text.new(@file.read)
#     @short_text = Text.new(@file.readchar)
#   end

#   def test_swap
#     assert_equal("Lorep imsup", @short_text.swap('m', 'p'))
#   end

#   def teardown
#     @file.close
#   end
# end


# require 'minitest/autorun'
# require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./more_sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def test_word_count
    word_count = Text.new(@file.read).word_count
    assert_equal(72, word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end