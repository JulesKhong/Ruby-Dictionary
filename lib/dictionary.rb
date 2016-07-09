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


#   define_singleton_method(:all_words) do
#     @@dictionary_list.each() do |dictionary_entry|
# binding.pry
#       @@words.push(dictionary_entry.values_at(:word))
#     end
#   end

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
