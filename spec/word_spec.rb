require('word')
require('rspec')
require('pry')

describe Word do
  describe('#initialize') do
    it('takes a word, and returns that word') do
    new_word = Word.new("Timbers Army")
    expect(new_word.word()).to(eq("Timbers Army"))
    end
  end

  describe('.all_words') do
    it('returns a list of all words in the dictionary') do
      new_word = Word.new("Timbers Army")
      new_word2 = Word.new("Rubinator")
      new_word.save()
      new_word2.save()
      expect(Word.all_words()).to(eq(["Timbers Army", "Rubinator"]))
    end
  end
#
#   describe('.save') do
#     it('saves a new word to the list of words') do
#       new_word = Word.new("Timbers Army")
#       new_word.save()
#       expect(Word.all_words()).to(eq["Timbers Army"])
#     end
#   end

end
