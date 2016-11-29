require 'rails_helper'

RSpec.feature "User can sort links" do
  scenario "user clicks to sort by status", js: true do
    user = create(:user)
    link = create(:link, user: user, url: "http://www.read.com", read: true)
    link2 = create(:link, user: user, url: "http://www.unknown.com", read: false)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    expect(page).to have_content("http://www.read.com")
    expect(page).to have_content("http://www.unknown.com")

    click_button "Read"
    expect(page).to have_content("http://www.read.com")
    expect(page).to_not have_content("http://www.unknown.com")
    
    click_button "Unread"
    expect(page).to_not have_content("http://www.read.com")
    expect(page).to have_content("http://www.unknown.com")
  end
end