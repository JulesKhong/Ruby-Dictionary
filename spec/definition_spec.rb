require('rspec')
require('word')
require('definition')
require('pry')

describe(Definition) do
  # before() do
  #   Definition.clear()
  # end

  describe('#initialize') do
    it('takes a definition, and returns that definition')do
      test_def = Definition.new({ :definition => "Not sunshine"})
      expect(test_def.definition()).to eq(["Not sunshine"])
    end
  end



end
