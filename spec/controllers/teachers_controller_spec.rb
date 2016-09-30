require "rails_helper"

RSpec.describe TeachersController do
  let(:teacher) { create(:teacher, name: "Teacher1") }
  let(:form) { create(:form, name: "Form1") }

  describe "#index" do
    it "renders the index page" do
      get :index

      expect(response).to render_template :index
    end

    it "list all forms belonging to a teacher" do
      teacher.forms << form
      get :index

      expect(assigns(:forms)).to have_content "Form1"
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new

      expect(response).to render_template :new
    end

    it "assigns the data" do
      get :new
      
      expect(assigns(:form)).to be_a_new(Form)
    end
  end

  describe "#create" do
    context "with valid data" do
      it "redirects to the root path" do
        post :create, form: attributes_for(:form, name: "Form3")

        expect(response).to redirect_to root_path
      end

      it "creates a new form in the database" do
        expect{
          post :create, form: attributes_for(:form, name: "Form3")
        }.to change(Form, :count).by 1
      end
    end

    context "with invalid data" do
      it "renders the new template" do
        post :create, form: attributes_for(:form, name: "")

        expect(response).to render_template :new
      end

      it "does not create a new form in the database" do
        expect{
          post :create, form: attributes_for(:form, name: "")
        }.not_to change(Form, :count)
      end
    end
  end
end