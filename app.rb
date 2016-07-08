require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary')
require('./lib/word')
require('pry')

get('/') do
  erb(:index)
end
