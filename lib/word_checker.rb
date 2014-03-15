require 'pry'

class WordAnalysis
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def word_count
    word_count_hash = {}
    @string.gsub('\n', ' ').scan(/\w[\w\'\-]*/).each do |word|
      if word =~ /[A-z]/
        if word_count_hash.key?(word.downcase) == false
          word_count_hash[word.downcase] = 1
        else
          word_count_hash[word.downcase] += 1
        end
      end
    end
    word_count_hash
  end

  def letter_count
    letter_count_hash = {}
    @string.gsub(' ', '').gsub('\n', '').split('').each do |letter|
      if letter =~ /[A-z]/
        if letter_count_hash.key?(letter.downcase) == false
          letter_count_hash[letter.downcase] = 1
        else
          letter_count_hash[letter.downcase] += 1
        end
      end
    end
    letter_count_hash
  end

  def symbol_count
    symbol_count_hash = {}
    @string.gsub(' ', '').gsub('\n', '').split('').each do |symbol|
      if symbol =~ /\W/
        if symbol_count_hash.key?(symbol) == false
          symbol_count_hash[symbol] = 1
        else
          symbol_count_hash[symbol] += 1
        end
      end
    end
    symbol_count_hash
  end

  def common_words
    sorted_words = word_count.sort_by { |word, amt| amt}
    [sorted_words[-1][0], sorted_words[-2][0], sorted_words[-3][0]]
  end

  def common_letters
    sorted_letters = letter_count.sort_by { |letter, amt| amt}
    [sorted_letters[-1][0], sorted_letters[-2][0], sorted_letters[-3][0]]
  end

  def single_use_words
    single_hash = word_count
    single_hash.each do |letter, amt|
      if amt > 1
        single_hash.delete(letter)
      end
    end
    single_hash.keys
  end

  def omitted_letters
    all_letters = [*('a'..'z')]
    used_letters_hash = letter_count
    omitted_letters = []
    all_letters.each do |letter|
      if used_letters_hash.key?(letter.downcase) == false
        omitted_letters << letter
      end
    end
    omitted_letters
  end

end








