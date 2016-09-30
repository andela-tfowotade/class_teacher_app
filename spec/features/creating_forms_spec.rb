require 'rails_helper' 

feature "Creating Form" do
  before do
   visit root_path 
   click_on "New Form"
 end

  scenario "user supplies valid data" do
    fill_in("Name", with: "My Form 1")
    click_on("Submit")

    expect(page).to have_content("My Form 1")
  end

  scenario "user supplies invalid data" do
     click_on("Submit")

     expect(page).to have_content("can't be blank")
  end
end