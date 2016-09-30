require "rails_helper"

RSpec.describe FormsController do
  after(:all) { Form.destroy_all }

  describe "#index" do
    before do
      teacher = create(:teacher)
      create(:form, name: "Form1", teacher_id: 1)
    end

    it "renders the index page" do
      get :index

      expect(response).to render_template :index
    end

    it "list all forms belonging to a teacher" do
      get :index
      
      expect((assigns(:forms)).first.name).to include "Form1"
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
      let(:valid_data) { attributes_for(:form, name: "Form3") }

      it "redirects to the root path" do
        post :create, form: valid_data
        expect(response).to redirect_to root_path
      end

      it "creates a new form in the database" do
        expect{
          post :create, form: valid_data
        }.to change(Form, :count).by 1
      end
    end

    context "with invalid data" do
      let(:invalid_data) { attributes_for(:form, name: "") }

      it "renders the new template" do
        post :create, form: invalid_data

        expect(response).to render_template :new
      end

      it "does not create a new form in the database" do
        expect{
          post :create, form: invalid_data
        }.not_to change(Form, :count)
      end
    end
  end
end
