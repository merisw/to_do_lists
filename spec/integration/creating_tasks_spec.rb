require 'spec_helper'

feature 'Creating Tasks' do
  scenario "can create a task" do
    visit '/'
    click_link 'New List'
    fill_in 'Name', with: "Home"
    fill_in "Items", with: "1"
    click_button "Create List"
    click_link "New Task"
    fill_in "Name", with: "Laundry"
    click_button "Create Task"
    page.should have_content("Task has been created.")
  end
end


