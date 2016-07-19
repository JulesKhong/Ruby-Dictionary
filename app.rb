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
  @word = Word.find(params.fetch("id").to_i())
  erb(:definition)
end

post('/definition/new') do
  new_definition = params.fetch('new_definition_input')
  word_id = params.fetch('word').to_i
  @word = Word.find(word_id)
  @word.add_def(new_definition)
  @all_words = Word.all()
  erb(:index)
end
