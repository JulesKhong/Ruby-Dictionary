require('rspec')
require('dictionary')
require('pry')

describe(Dictionary) do
  before() do
    Dictionary.clear()
  end

  describe('#initialize') do
    it('takes a word, and returns that word')do
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
      expect(test_word.word()).to(eq("liquid sunshine"))
      expect(test_word.definition()).to eq(["Not sunshine"])
    end
  end

  describe('#id') do
    it('returns the id of the word/definition pair') do
      test_entry = Dictionary.new({ :word => "fog", :definition => ["another word for the sky"]})
      test_entry.save
      expect(test_entry.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns an empty array for all words at first') do
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
      expect(Dictionary.find(test_word.id())).to(eq(test_word))
    end
  end


  describe('#add_definition') do
    it('adds an additional definition to a word') do
      Dictionary.clear()
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => ["Not sunshine"]})
      expect((test_word.add_definition("definitely rain")).definition()).to(eq(["Not sunshine", "definitely rain"]))
    end
  end

end
