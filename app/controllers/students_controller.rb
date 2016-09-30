class StudentsController < ApplicationController
  before_action :set_form

  def index
    @students = @form.students
  end

  def new
    @student = @form.students.new
  end

  def create
    @student = @form.students.new(student_params)
    
    if @student.save
      redirect_to form_students_path, notice: "Student added successfully!"
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_form
    @form = @teacher.forms.find_by(params[:form_id])
  end
end