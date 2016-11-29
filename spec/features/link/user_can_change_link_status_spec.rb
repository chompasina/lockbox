require 'rails_helper'

RSpec.feature "User can change link status", :js => true do
  scenario "user can click to change status" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    fill_in "Title", with: "New York Times"
    fill_in "URL", with: "http://www.nytimes.com"
    click_button "Add link"
    
    within("#links-list") do
      expect(Link.last.read).to eq(false)
      expect(page).to have_content("Read? false")
      click_button "Mark as Read"
      wait_for_ajax
      
      expect(Link.last.read).to eq(true)
      expect(page).to_not have_content("Read? false")
      expect(page).to have_content("Read? true")
    end
  end
end