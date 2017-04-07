class Form < ActiveRecord::Base
  belongs_to :teacher
  has_many :students

  validates :name, presence: true
end
