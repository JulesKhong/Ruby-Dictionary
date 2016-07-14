require('pry')

class Definition
  attr_reader( :definition )

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @definition = [@definition]
  end
end
