require 'rails_helper'

RSpec.describe Form, type: :model do
  it { should belong_to(:teacher) }
  it { should have_many(:students) }
  it { should validate_presence_of(:name) }
end
