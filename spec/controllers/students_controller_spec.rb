require "rails_helper"

RSpec.describe StudentsController do
  let(:teacher) { create(:teacher) }
  let(:form) { create(:form, teacher_id: teacher.id) }

  describe "#index" do
    it "renders the index page" do
      get :index, form_id: form.id
      
      expect(response).to render_template :index
    end

    it "list all students belonging to a form" do
      create(:student, name: "student1", form_id: form.id) 

      get :index, form_id: form.id
      
      expect((assigns(:students)).first.name).to include "student1"
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new, form_id: form.id

      expect(response).to render_template :new
    end

    it "assigns the data" do
      get :new, form_id: form.id
      
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe "#create" do
    context "with valid data" do
      let(:valid_data) { attributes_for(:student, name: "student3") }

      it "redirects to the students#index path" do
        post :create, student: valid_data, form_id: form.id
        expect(response).to redirect_to form_students_path
      end

      it "creates a new student in the database" do
        expect{
          post :create, student: valid_data, form_id: form.id
        }.to change(Student, :count).by 1
      end
    end

    context "with invalid data" do
      let(:invalid_data) { attributes_for(:student, name: "") }

      it "renders the new template" do
        post :create, student: invalid_data, form_id: form.id

        expect(response).to render_template :new
      end

      it "does not create a new student in the database" do
        expect{
          post :create, student: invalid_data, form_id: form.id
        }.not_to change(Student, :count)
      end
    end
  end
end
