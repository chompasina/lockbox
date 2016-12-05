require 'rails_helper'

RSpec.feature "User can delete a tag from a link" do
  scenario "they click edit on link and delete tag", js: true do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    
    visit root_path
    
    fill_in "Title", with: "Practice"
    fill_in "URL", with: "http://www.practice.org"
    fill_in "Tag", with: "important"
    click_button "Add link"
    
    within("#links-list") do
      expect(page).to have_content("important")
    end
    
    click_on("Edit")
    fill_in "Tag list", with: "save for later"
    click_button "Submit"
    
    expect(current_path).to eq(links_path)
    within("#links-list") do
      expect(page).to have_content("save for later")
      expect(page).to_not have_content("important")
    end
  end
  
  scenario "User clicks 'X' to delete tag from link", js: true do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "Title", with: "Practice"
    fill_in "URL", with: "http://www.practice.org"
    fill_in "Tag list", with: "important"
    click_button "Add link"
    
    expect(LinkTag.count).to eq(1)

    within("#links-list") do
      expect(page).to have_content("important")
    end
    
    click_on('X')
    wait_for_ajax

    expect(LinkTag.count).to eq(0)
    
    expect(current_path).to eq(links_path)
    within("#links-list") do
      expect(page).to_not have_content("important")
    end
  end
end