require "rails_helper"

feature "Listing students" do
  let(:teacher) { create(:teacher) }
  let(:form) { create(:form, teacher_id: teacher.id) }

  context "when teacher has no student" do
    scenario "notifies teacher of no student" do
      visit "/forms/#{form.id}/students"

      expect(page).to have_content "No Student added yet!"
    end
  end

  context "when teacher has students" do
    scenario "list all students" do
      create(:student, name: "Another student", form_id: form.id)

      visit "/forms/#{form.id}/students"

      expect(page).to have_content "Another student"
    end
  end
end
