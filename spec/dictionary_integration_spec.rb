require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('loads the home page',{ :type => :feature}) do
  it("shows the home page when the site loads") do
    visit('/')
    expect(page).to have_content('Northwest')
  end
end



# describe('loads the list of words in the dictionary',{ :type => :feature}) do
#   it("shows the user the list of words on the home page") do
#     visit('/')
#     expect(page).to have_content("liquid sunshine")
#   end
# end
