require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/dictionary')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @all_words = Word.all_words()
  erb(:index)
end

post('/') do
  word = params.fetch('word_input')
  definition = params.fetch('definition_input')
  Word.new(word).save()
  Dictionary.new({:word => word, :definition => definition}).save()
  @all_words = Word.all_words()
  erb(:index)
  # @words = Words.all_entries()
end
