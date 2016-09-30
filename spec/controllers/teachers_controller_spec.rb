require "rails_helper"

RSpec.describe TeachersController do
  describe "#index" do
    it "renders the index page" do
      get :index
    end
  end
end