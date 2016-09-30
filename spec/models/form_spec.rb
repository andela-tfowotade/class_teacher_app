require 'rails_helper'

RSpec.describe Form, type: :model do
  it { should belong_to(:teacher) }
end
