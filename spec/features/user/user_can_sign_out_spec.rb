require 'rails_helper'

RSpec.feature "user can sign out" do
  scenario "User clicks logout" do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_link("Logout")
    
    click_link "Logout"

    expect(page).to have_button("Login")
  end
end