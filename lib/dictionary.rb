require('pry')

class Dictionary
  attr_reader( :word, :definition)

@@words = []

  define_method(:initialize) do | attributes |
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end

  define_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end
end
