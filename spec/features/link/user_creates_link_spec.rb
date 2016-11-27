require 'rails_helper'

RSpec.feature "user can create link" do
  scenario "user is on links index page" do
    user = create(:user)
    
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "New York Times"
    fill_in "URL", with: "http://www.nytimes.com"
    click_button "Add link"
    
    expect(page).to have_content("New York Times")
    expect(page).to have_content("http://www.nytimes.com")
  end
end