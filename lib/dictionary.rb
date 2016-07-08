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

  define_singleton_method(:clear) do
    @@dictionary_list = []
  end

# LET'S THINK THROUGH THIS AFTER LUNCH
  define_method(:add) do |word, new_definition|
    new_entry = {}
    @@dictionary_list.each() do |entry|
      if word = entry.word()
        new_entry = Dictionary.new({ :word => word, :definition => entry.definition().push(new_definition)})
      end
    end
    @@dictionary_list.each() do |entry|
      if new_entry.word() == entry.word()
      entry.definition() == new_entry.definition()
      end
    end
binding.pry()
end
end
  # define_singleton_method(:all_words) do
  #   @@words.clear()
  #   (Dictionary.all()).each() do |dictionary_entry|
  #     @@words.push(dictionary_entry.word())
  #   end
  # end
