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

# # LET'S THINK THROUGH THIS AFTER LUNCH
#   define_method(:add) do |new_definition|
#     word = new_definition.shift()
#     definition= new_definition.pop()
#     rejected = @@dictionary_list.shift()
#     @@dictionary_list.each() do
#       if word = self.word()
#       self.definition().push(definition)
#       self
#       end
#     end
#   end
end
