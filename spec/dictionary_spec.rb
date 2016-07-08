require('rspec')
require('dictionary')
require('pry')

describe(Dictionary) do
  describe('#initialize') do
    it('returns the name and definition of a word')do
      test_word = Dictionary.new({ :word => "liquid sunshine", :definition => "Not sunshine"})
      expect(test_word.word()).to(eq("liquid sunshine"))
      # expect(test_word.definition()).to eq("A term for rain used when clouds only have grey linings--not silver")
    end
  end

end
