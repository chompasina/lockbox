require 'rails_helper'

RSpec.feature "User can edit links" do
  scenario "user clicks on link to edit" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    fill_in "Title", with: "New York Times"
    fill_in "URL", with: "http://www.nytimes.com"
    click_button "Add link"
    
    within('.links-list') do
      find('.title-field').click
      fill_in with: "Neu York Times"
      save_and_open_page
    end
  end
end