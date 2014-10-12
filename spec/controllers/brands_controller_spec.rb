require 'spec_helper'

RSpec.describe BrandsController, :type => :controller do
  it "is invalid without a name" do
    get :index
    expect(response).to be_success
  end
end
