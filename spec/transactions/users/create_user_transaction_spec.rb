require 'rails_helper'

RSpec.describe Users::CreateUserTransaction do
  let(:transaction_call) { transaction.call(user_params) }
  let(:transaction) { described_class.new }
  let(:user_params) { {  email: email, name: name } }
  let(:name) { Faker::Name.name }

  context 'when everything goes well' do
    let(:email) { Faker::Internet.email }

    it 'creates a user with proper attributes' do
      expect(transaction_call.success).to include(user_params)
    end

    it 'returns success' do
      expect(transaction_call.success?).to eq(true)
    end
  end

  context 'when email already exists' do
    let(:user) { Factory[:user] }
    let(:email) { user.email }

    it 'fails on create_user step and raises ROM::SQL::UniqueConstraintError' do
      expect(transaction).to fail_on(:create_user)
        .with(user_params).and_raise(ROM::SQL::UniqueConstraintError)
    end
  end
end
