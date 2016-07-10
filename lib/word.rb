require('pry')

class Word

  attr_reader(:word_input)

  @@words = []

  define_method(:initialize) do |input|
    @word_input = input
    @id = @@words.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_method(:word) do
    @word_input
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all_words) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

end
