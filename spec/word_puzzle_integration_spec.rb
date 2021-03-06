require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word_puzzle path', {:type => :feature}) do
  it('processes the user input and redirects to a page with the results displayed') do
    visit('/')
    fill_in('typed_phrase', :with => "Hello, that's a dashing Armani suit!")
    click_button('Submit')
    expect(page).to have_content("H-ll-, th-t's - d-sh-ng -rm-n- s--t!")
  end
  it('processes the user input and redirects to a page with the results displayed') do
    visit('/typed_phrase?typed_phrase=Hello%2C+that%27s+a+dashing+Armani+suit%21&button=')
    click_link('Again?')
    expect(page).to have_content("Let's Play Guess the Phrase!")
  end
end
