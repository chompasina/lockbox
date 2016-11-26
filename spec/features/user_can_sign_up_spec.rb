require 'rails_helper'

RSpec.feature "user can sign up" do
  scenario "user is added when they sign up" do
    visit root_path
    expect(current_path).to eq(login_path)
    
    click_link "Sign Up"
    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content("Welcome, Tommasina")
    expect(page).to_not have_content("Logout")
    
    fill_in "Username", with: "Tommasina"
    fill_in "Password", with: "password"
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Welcome, Tommasina")
    expect(page).to have_button("Logout")
  end
end