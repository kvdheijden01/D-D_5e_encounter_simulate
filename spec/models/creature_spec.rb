require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "validation tests" do
    let(:creature) { build(:creature) }

    it "tests that factory is valid" do
      creature = build(:creature)
      expect(creature).to be_valid  
    end
  end

  describe "database tests" do
    
  end
end
