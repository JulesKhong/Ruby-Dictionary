require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#initialize') do
    it('takes a word, and returns that word')do
      test_word = Word.new({ :word => "liquid sunshine"})
      expect(test_word.word()).to(eq("liquid sunshine"))
    end
  end

  describe('#id') do
    it('returns the id of the instance of the word object') do
      definition = Definition.new({:definition => "another name for the sky"})
      test_entry = Word.new({ :word => "fog", :definition => definition})
      test_entry.save
      expect(test_entry.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns an empty array for all words at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a word to the list of all words') do
    test_word = Word.new({ :word => "liquid sunshine", :definition => (Definition.new({:definition => "Not sunshine"}))})
    test_word.save()
    expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.find') do
    it('returns a definition for a word') do
      Word.clear()
      test_word = Word.new({ :word => "liquid sunshine", :definition => (Definition.new({:definition => "Not sunshine"}))})
      test_word.save()
      test_word_two = Word.new({ :word => "swoosh life", :definition => (Definition.new({:definition => "Working a lot in cool shoes"}))})
      test_word_two.save()
      expect(Word.find(1)).to(eq(test_word))
    end
  end

  describe('#add_def') do
    it('adds a definition to a word') do
      test_word = Word.new({ :word => "liquid sunshine"})
      definition = Definition.new({:definition => "Not sunshine"})
      definition2 = Definition.new({:definition => "Definitely rain"})
      test_word.save()
      test_word.add_def(definition)
      test_word.add_def(definition2)
      expect(test_word.definition).to(eq([definition, definition2]))
    end
  end

end
