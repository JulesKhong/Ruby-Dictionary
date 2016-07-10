require('pry')


class Dictionary
  attr_reader( :word, :definition)

  @@dictionary_list = []
  # @@words = []

  define_method(:initialize) do | attributes |
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@dictionary_list.length().+(1)
  end

  define_singleton_method(:all) do
    @@dictionary_list
  end

  define_method(:save) do
    @@dictionary_list.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:clear) do
    @@dictionary_list = []
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@dictionary_list.each() do |dictionary_entry|
      if dictionary_entry.id().eql?(id)
      found_definition = dictionary_entry
      end
    end
    found_definition
  end

  define_singleton_method(:find_word)do |definition|
    found_word = nil
    @@dictionary_list.each() do |dictionary_entry|
      if dictionary_entry.definition().eql?(definition)
        found_word = dictionary_entry.word()
      end
    end
    found_word
  end

  define_method(:add_definition) do |new_definition|
    self.definition().push(new_definition)
    self
    end

end
