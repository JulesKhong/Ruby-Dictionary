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

describe('enters a new definition',{ :type => :feature }) do
  it("allows users to enter a new word into the dictionary, and takes them to the success page") do
    visit('/')
    fill_in('word_input', :with => 'good vibes')
    fill_in('definition_input', :with => 'the equivalent of grandma prayers')
    click_button('Submit')
    expect(page).to have_content('See all entries')
  end
end

describe('shows the new entry on the list of words',{ :type => :feature }) do
  it("allows users to return to the homepage and see their word on the page") do
    visit('/')
    fill_in('word_input', :with => 'good vibes')
    fill_in('definition_input', :with => 'the equivalent of grandma prayers')
    click_button('Submit')
    expect(page).to have_content('See all entries')
    click_link('See all entries')
    expect(page).to have_content('good vibes')
  end
end

describe('reveals definitions',{ :type => :feature }) do
  it("allows users to see definitions when they click on a word") do
    visit('/')
    fill_in('word_input', :with => 'great vibes')
    fill_in('definition_input', :with => 'the northwest equivalent of "god bless you"')
    click_button('Submit')
    expect(page).to have_content('See all entries')
    click_link('See all entries')
    expect(page).to have_content('great vibes')
    click_link('great vibes')
    expect(page).to have_content('the northwest equivalent of "god bless you"')
  end
end

describe('adds definition to a word',{ :type => :feature}) do
  it("allows users to add additional definitions to a word") do
    visit('/')
    fill_in('word_input', :with => 'liquid sunshine')
    fill_in('definition_input', :with => 'Not sunshine')
    click_button('Submit')
    expect(page).to have_content('See all entries')
    click_link('See all entries')
    expect(page).to have_content('liquid sunshine')
    click_link('liquid sunshine')
    expect(page).to have_content('Additional Definition')
    fill_in('new_definition_input', :with => 'Definitely rain')
    click_button('Submit')
    expect(page).to have_content('Browse')
  end
end
