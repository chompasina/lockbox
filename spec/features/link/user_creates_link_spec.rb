require 'rails_helper'

RSpec.feature "user can create link" do
  before(:each) do
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
  end
  
  scenario "user is on links index page" do
    fill_in "Title", with: "New York Times"
    fill_in "URL", with: "http://www.nytimes.com"
    click_button "Add link"
    
    expect(page).to have_content("New York Times")
    expect(page).to have_content("http://www.nytimes.com")
    expect(Link.count).to eq(1)
  end
  
  scenario "link has default status of false" do
    link = create(:link)

    expect(Link.last.read).to eq(false)
  end
  
  scenario "user gives a broken link" do
    fill_in "Title", with: "New York Times"
    fill_in "URL", with: "broken.com"
    click_button "Add link"
    
    expect(page).to have_content("Url is not a valid URL")
    expect(page).to_not have_content("New York Times")
    expect(page).to_not have_content("broken.com")
    expect(Link.count).to eq(0)
  end
end