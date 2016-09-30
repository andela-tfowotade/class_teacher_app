require "rails_helper"

RSpec.describe TeachersController do
  describe "#index" do
    it "renders the index page" do
      get :index

      expect(response).to render_template :index
    end

    it "list all forms belonging to a teacher" do
      form = create(:Form, name: Form1)
      get :index

      expect(assigns(:forms)).to have_content "Form1"
    end
  end
end