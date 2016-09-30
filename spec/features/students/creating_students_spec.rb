require 'rails_helper' 

feature "Creating student" do
  let(:teacher) { create(:teacher) }
  let(:form) { create(:form, teacher_id: teacher.id) }

  before do
    visit "/forms/#{form.id}/students"
    click_on("Add New Student")
  end

  scenario "user supplies valid data" do
    fill_in("Name", with: "New Student")
    click_on("Submit")

    expect(page).to have_content("New Student")
  end

  scenario "user supplies invalid data" do
    fill_in("Name", with: "")
    click_on("Submit")

    expect(page).to have_content("can't be blank")
  end
end
