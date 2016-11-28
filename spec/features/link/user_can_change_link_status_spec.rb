require 'rails_helper'

RSpec.feature "User can change link status" do
  scenario "user can click to change status" do
    user = create(:user)
    link = create(:link)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    within(".links-list") do
      expect(Link.last.read).to eq(false)
      click_button "Mark as Read"
      expect(Link.last.read).to eq(true)
    end
  end
end