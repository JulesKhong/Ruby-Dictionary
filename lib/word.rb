require('pry')
require('dictionary')

class Word
  @@words = []

  define_method(:initialize) do |word|
    @word = word
  end

  define_method(:word) do
    @word
  end

  define_method(:save) do
    @@words.push(self.word())
  end

  define_singleton_method(:all_words) do
    @@words
  end

end
