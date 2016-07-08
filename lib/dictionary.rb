require('pry')

class Dictionary
  attr_reader( :word, :definition)

@@words = []

  define_method(:initialize) do | attributes |
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:find) do |search_word|
    found_definition = nil
    @@words.each() do |dictionary_entry|
      if dictionary_entry.word() == search_word
        found_definition = dictionary_entry.definition()
      end
    end
    found_definition
  end

end
