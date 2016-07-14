require('pry')

class Definition
  attr_reader( :definition )

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @definition = [@definition]
  end

  define_method(:add_definition) do |new_definition|
    self.definition().push(new_definition)
    end

end
