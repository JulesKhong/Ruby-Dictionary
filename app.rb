require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/dictionary')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @all_words = Dictionary.all()
  erb(:index)
end

post('/definition') do
  @definition = Definition.new({:definition => [params.fetch('definition_input')]})
  @word = Word.new({:word => (params.fetch('word_input')), :definition => @definition})
  erb(:success)
end

get('/definition/:id') do
  @definition = Word.find(params.fetch("id").to_i())
  erb(:definition)
end

# post('/definition/new') do
#   new_definition = params.fetch('new_definition_input')
#   word = Word.find_word(params.fetch('word'))
#   word.add_definition(new_definition)
#   erb(:success)
# end
# post('/definition/new') do
#   @new_definition = params.fetch('new_definition_input')
#   @definition_hash = Dictionary.find_word(params.fetch('word'))
#   (@definition_hash).add_definition(@new_definition)
#   erb(:success)
# end
