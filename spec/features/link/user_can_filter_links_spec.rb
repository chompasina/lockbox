require 'rails_helper'

RSpec.feature "User can filter links" do
  scenario "user searches by title and irrelevant links disappear", js: true do
    user = create(:user)
    searched_link = create(:link, user: user, title: "All mine", url: "http://www.mylink.com")
    non_searched_link = create(:link, user: user, title: "Irrelevant", url: "http://www.notmylink.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    expect(page).to have_content("All mine") 
    expect(page).to have_content("Irrelevant")
    
    fill_in "search-bar", with: "All mine" 
    
    expect(page).to have_content("All mine")
    expect(page).to_not have_content("Irrelevant")
  end
  
  scenario "user searches by url and irrelevant links disappear", js: true do
    user = create(:user)
    searched_link = create(:link, user: user, title: "All mine", url: "http://www.gimme.com")
    non_searched_link = create(:link, user: user, title: "Irrelevant", url: "http://www.irrelevant.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    expect(page).to have_content("http://www.gimme.com") 
    expect(page).to have_content("http://www.irrelevant.com")
    
    fill_in "search-bar", with: "gimme" 
    
    expect(page).to have_content("http://www.gimme.com")
    expect(page).to_not have_content("http://www.irrelevant.com")
  end
end