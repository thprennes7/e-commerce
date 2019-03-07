require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:all) do
  @item  = FactoryBot.create(:item)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@item).to be_a(Item)
      expect(@item).to be_valid
    end
  end

end