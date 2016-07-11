require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('visit index path', {:type => :feature}) do
  it('allows user to see a welcome page that includes two links') do
    visit('/')
    expect(page).to have_content('Add a List')
  end
end

describe('add a list', {:type => :feature}) do
  it('allows user to add a list') do
    visit('/')
    click_link('Add a List')
    expect(page).to have_content('Create a list!')
    fill_in('list_name', :with => "test description")
    click_button('Create')
    expect(page).to have_content('List successfully created!')
  end
end
