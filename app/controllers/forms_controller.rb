class FormsController < ApplicationController
  def index
    @forms = @teacher.forms
  end

  def new
    @form = @teacher.forms.new
  end

  def create
    @form = @teacher.forms.new(form_params)

    if @form.save
      redirect_to root_path, notice: "Class Created Successfully!"
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:form).permit(:name)
  end
end