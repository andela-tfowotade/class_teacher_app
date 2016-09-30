class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_teacher

  private 

  def set_teacher
    @teacher = Teacher.find(1)
  end
end
