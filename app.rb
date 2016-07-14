require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

post('/definition') do
  @definition = Definition.new({:definition => (params.fetch('definition_input'))})
  @word = Word.new({:word => (params.fetch('word_input')), :definition => @definition})
  @word.save()
  erb(:success)
end

get('/definition/:id') do
  word = Word.find(params.fetch("id").to_i())
  @word = params.fetch("word")
  @definition = params.fetch("definition")
  erb(:definition)
end

# post('/definition/new') do
#   new_definition = params.fetch('new_definition_input')
#   word = Word.find_word(params.fetch('word'))
#   new_word = word.definition.add_definition(new_definition)
#   binding.pry
#   erb(:success)
# end

# post('/definition/new') do
#   @new_definition = params.fetch('new_definition_input')
#   @definition_hash = Dictionary.find_word(params.fetch('word'))
#   (@definition_hash).add_definition(@new_definition)
#   erb(:success)
# end
