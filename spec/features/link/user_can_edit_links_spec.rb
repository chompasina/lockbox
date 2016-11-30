require 'rails_helper'

RSpec.feature "User can edit links" do
  scenario "user clicks on link to edit" do
    user = create(:user)
    link = user.links.create(title: "my link", url: "http://www.mylink.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    within('#links-list') do
      # find('.title-field').click
      click_link "Edit"
      expect(current_path).to eq(edit_link_path(link))
    end
    
    fill_in "Title", with: "Neu York Times"
    click_button "Submit"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Link has been updated")
    expect(page).to have_content("Neu York Times")
    expect(page).to_not have_content("New York Times")
  end
  
  scenario "User cannot enter bad URL and submit update" do
    user = create(:user)
    link = user.links.create(title: "my link", url: "http://www.mylink.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    within('#links-list') do
      # find('.title-field').click
      click_link "Edit"
    end
    
    fill_in "Url", with: "badlink.com"
    click_button "Submit"
    
    expect(page).to have_content("Url is not a valid URL")
  end
end