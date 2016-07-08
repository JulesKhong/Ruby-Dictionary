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

post('/') do
  word = params.fetch('word_input')
  definition = params.fetch('definition_input')
  word_entry = Word.new(word)
  word_entry.save()
  definition_entry = Dictionary.new({:word => word, :definition => definition})
  definition_entry.save()
  # @all_words = Word.all_words()
  erb(:index)
end
