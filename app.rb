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
  word = params.fetch('word_input')
  definition = params.fetch('definition_input')
  dictionary_entry = Dictionary.new({:word => word, :definition => definition})
  dictionary_entry.save()
  erb(:success)
end

get('/definition/:id') do
  @definition = Dictionary.find(params.fetch("id").to_i())
  erb(:vehicle)
end
