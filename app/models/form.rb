class Form < ActiveRecord::Base
  belongs_to :teacher

  validates :name, presence: true
end
