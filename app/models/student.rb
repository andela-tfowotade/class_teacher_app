class Student < ActiveRecord::Base
  belongs_to :form

  validates :name, presence: true
end
