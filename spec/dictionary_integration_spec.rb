require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('loads the home page',{ :type => :feature }) do
  it("shows the home page when the site loads") do
    visit('/')
    expect(page).to have_content('Northwest')
  end
end

describe('shows definitions',{ :type => :feature }) do
  it("shows the definition for each word") do
    visit('/')
    fill_in('word_input', :with => 'good vibes')
    fill_in('definition_input', :with => 'the equivalent of grandma prayers')
    click_button('Submit')
    expect(page).to have_content('See all entries')
  end
end
