require "rails_helper"

feature "Listing forms" do
  before do
    create(:teacher) 
    visit root_path
  end

  context "when teacher has no form" do
    scenario "notifies teacher of no form" do
      expect(page).to have_content "No forms added yet!"
    end
  end

  context "when teacher has forms" do
    scenario "list all forms" do
      click_on("Create New Form")
      fill_in("Name", with: "another form")
      click_on("Submit")

      expect(page).to have_content "another form"
    end
  end
end
