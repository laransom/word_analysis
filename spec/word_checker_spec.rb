require 'rspec'
require_relative '../lib/word_checker.rb'

describe WordAnalysis do
   let(:paragraph) {WordAnalysis.new("Simple simple. Are those the same, the same.
    Symbols and numbers & $54 2 99.99%. Can't, won't stop.")}

  it 'Is a proper string that is input' do
    expect(paragraph.string.class).to eq(String)
  end

  describe 'word_count' do

    it 'Counts the words properly even if they have capitals or punctuation' do
      expect(paragraph.word_count['simple']).to eq(2)
    end

    it 'Does not count numbers as words' do
      expect(paragraph.word_count['54']).to eq(nil)
    end

    it 'Does not count symbols as words' do
      expect(paragraph.word_count['&']).to eq(nil)
    end

  end

  describe 'letter_count' do

    it 'Counts letters properly' do
      expect(paragraph.letter_count['s']).to eq(9)
    end

    it 'Does not count non letters' do
      expect(paragraph.letter_count['9']).to eq(nil)
    end

  end

  describe 'symbol_count' do

    it 'Counts symbols properly' do
      expect(paragraph.symbol_count['$']).to eq(1)
    end

    it 'Does not count letters as symbols' do
      expect(paragraph.symbol_count['a']).to eq(nil)
    end

  end

  describe 'common_words' do

    it 'returns an array of the top three most commons words' do
      expect(paragraph.common_words).to eq(['simple','the','same'])
    end

  describe 'common_letters' do

    it 'returns an array of the top three most common letters' do
      expect(paragraph.common_letters).to eq(['s', 'e', 'm'])
    end

  end

  describe 'single_use_words' do
    let(:paragraph_two) {WordAnalysis.new("Some some words words. Are only used once")}

    it 'returns an array of all words only used once' do
      expect(paragraph_two.single_use_words).to eq(['are', 'only', 'used', 'once'])
    end

  end

  describe 'omitted_letters' do
    let(:paragraph_three) {WordAnalysis.new("Abc, D'ef. Hijklm nop qrstuv. WX!! Yz.")}

    it 'returns an array of all omitted words' do
      expect(paragraph_three.omitted_letters).to eq(['g'])
    end

  end
end


















end
