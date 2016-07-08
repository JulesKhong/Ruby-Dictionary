require('rspec')
require('dictionary')
require('pry')

describe(Dictionary) do
  describe('#initialize') do
    it('takes a word, and returns that word')do
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => "Not sunshine"})
      expect(test_word.word()).to(eq("liquid sunshine"))
      expect(test_word.definition()).to eq("Not sunshine")
    end
  end

  describe('.all') do
    it('returns an empty array for all words') do
      expect(Dictionary.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a word to the list of all definitions') do
    test_word = Dictionary.new({ :word => "liquid sunshine", :definition => "Not sunshine"})
    test_word.save()
    expect(Dictionary.all()).to(eq([test_word]))
    end
  end

end
