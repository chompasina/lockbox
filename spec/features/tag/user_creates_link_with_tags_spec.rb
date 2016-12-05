require 'rails_helper'

RSpec.feature "User creates link with tags" do
  scenario "they write tag in box and see it on the page", js: true do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    
    fill_in "Title", with: "Practice"
    fill_in "URL", with: "http://www.practice.org"
    fill_in "Tag", with: "test"
    click_button "Add link"
    
    wait_for_ajax
    
    expect(Link.count).to eq(1)
    expect(Link.last.tag_list).to eq("test")
    
    within("#links-list") do
      expect(page).to have_content("test")
    end
    
  end
end