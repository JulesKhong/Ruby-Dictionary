require('rspec')
require('word')
require('definition')
require('pry')

describe(Definition) do

  describe('#initialize') do
    it('takes a definition, and returns that definition')do
      test_def = Definition.new({ :definition => "Not sunshine"})
      expect(test_def.definition()).to eq(["Not sunshine"])
    end
  end

  describe('#add_definition') do
    it('adds an additional definition to a definition') do
      test_definition = Definition.new({ :definition => "liquid sunshine"})
      expect(test_definition.add_definition("definitely rain")).to(eq(["liquid sunshine", "definitely rain"]))
    end
  end

end
