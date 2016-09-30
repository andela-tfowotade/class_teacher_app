class Teacher < ActiveRecord::Base
  has_many :forms

  validates :name, presence: true
end
