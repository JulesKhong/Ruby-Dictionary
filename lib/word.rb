require('pry')

class Word
  attr_reader( :id, :word, :definition)

  @@words = []

  define_method(:initialize) do | attributes |
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@words.length().+(1)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id)
      found_word = word
      end
    end
    found_word
  end

  define_singleton_method(:find_word) do |word|
    word_found = nil
    @@words.each() do |dictionary_entry|
      if dictionary_entry.word().eql?(word)
        word_found = dictionary_entry
      end
    end
    word_found
  end
end
