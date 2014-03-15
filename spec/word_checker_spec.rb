require 'rspec'
require_relative '../lib/word_checker.rb'

describe WordAnalysis
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def word_count
    word_count_hash = {}
    @string.gsub('\n', ' ')split.each do |word|
      if word_count_hash.key?(word) == false
        word_count_hash[word] = 1
      else
        word_count_hash[word] += 1
      end
    end
  end

  def letter_count
    letter_count_hash = {}
    @string.gsub('\n' | ' ', '').split('').each do |letter|

  end


end
