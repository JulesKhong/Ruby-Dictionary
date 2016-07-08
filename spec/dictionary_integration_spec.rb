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

# describe('takes and posts a new word',{ :type => :feature}) do
#   it("takes a user's word, and adds it to the dictionary") do
#     visit('/')
#     fill_in('word_input', :with => "First Thursday")
#     fill_in('definition_input', :with => "Art, wine and people watching")
#     click_button('Submit')
#     expect(page).to have_content("First Thursday")
#   end
# end

# describe('loads the list of words in the dictionary',{ :type => :feature}) do
#   it("shows the user the list of words on the home page") do
#     visit('/')
#     expect(page).to have_content("liquid sunshine")
#   end
# end
