require('rspec')
require('dictionary')
require('pry')

describe(Dictionary) do
  describe('#initialize') do
    it('takes a word, and returns that word')do
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
      expect(test_word.word()).to(eq("liquid sunshine"))
      expect(test_word.definition()).to eq(["Not sunshine"])
    end
  end

  describe('.all') do
    it('returns an empty array for all words') do
      expect(Dictionary.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a word to the list of all definitions') do
    test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
    test_word.save()
    expect(Dictionary.all()).to(eq([test_word]))
    end
  end

  describe('.find') do
    it('returns a definition for a word') do
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
      test_word.save()
      test_word2 = Dictionary.new({ :word => "swoosh life", :definition => ["I work all the time, but my company makes me think it's cool"]})
      test_word2.save()
      expect(Dictionary.find("swoosh life")).to(eq(["I work all the time, but my company makes me think it's cool"]))
    end
  end

  describe('#add') do
    it('adds an additional definition to a word') do
      # Dictionary.clear()
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
      test_comparison = Dictionary.new({:word => "liquid sunshine", :definition => ["Not sunshine", "definitely rain"]})
      expect(test_word.add("liquid sunshine", "definitely rain")).to(eq(test_comparison))
    end
  end

  # describe('.all_words') do
  #   it('returns a list of all defined words') do
  #     test_word = Dictionary.new({ :word => "liquid sunshine", :definition => "Not sunshine"})
  #     test_word2 = Dictionary.new({ :word => "pour over", :definition => "sweet sweet nectar of the gods"})
  #     expect(Dictionary.all_words()).to(eq(["liquid sunshine", "pour over"]))
  #   end
  # end

end
