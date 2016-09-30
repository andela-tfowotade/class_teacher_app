require "rails_helper"

feature "Listing formes" do
  before { visit root_path }

  context "when teacher has forms" do
    let(:form) { create(:form, name: "Form1") }

    scenario "list all forms" do
      visit root_path

      expect(page).to have_content "Form1"
    end
  end

  context "when teacher has no form" do
    scenario "notifies teacher of no form" do
      visit root_path

      expect(page).to have_content "No forms created yet!"
    end
  end
end
