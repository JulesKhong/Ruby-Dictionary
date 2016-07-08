require('pry')


class Dictionary
  attr_reader( :word, :definition)

  @@dictionary_list = []

  define_method(:initialize) do | attributes |
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:all) do
    @@dictionary_list
  end

  define_method(:save) do
    @@dictionary_list.push(self)
  end

  define_singleton_method(:find) do |search_word|
    found_definition = nil
    @@dictionary_list.each() do |dictionary_entry|
      if dictionary_entry.word() == search_word
        found_definition = dictionary_entry.definition()
      end
    end
    found_definition
  end

  # define_singleton_method(:all_words) do
  #   @@words.clear()
  #   (Dictionary.all()).each() do |dictionary_entry|
  #     @@words.push(dictionary_entry.word())
  #   end
  # end

end
