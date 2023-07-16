require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'has valid factory' do
      expect(build :user).to be_valid
    end

    [:username, :email, :password].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end
end
