require "rails_helper"

feature "Home page" do
  scenario "user visits home page" do
    visit "/"

    expect(page).to have_content("Class Teacher App")
  end
end
