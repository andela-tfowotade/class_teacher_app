require 'rails_helper' 

feature "Creating Form" do
  before do
    create(:teacher)
    
    visit root_path 
    click_on("Create New Form")
    fill_in("Name", with: "Class 1")
    click_on("Submit")

    click_on("view")
    click_on("Add New Student")
  end

  scenario "user supplies valid data" do
    fill_in("Name", with: "Class 1 Student")
    click_on("Submit")

    expect(page).to have_content("Class 1 Student")
  end

  scenario "user supplies invalid data" do
    click_on("Submit")

    expect(page).to have_content("can't be blank")
  end
end