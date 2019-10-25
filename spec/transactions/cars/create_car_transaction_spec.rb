require 'rails_helper'

RSpec.describe Cars::CreateCarTransaction do
  let(:transaction_call) { transaction.call(params) }
  let(:transaction) { described_class.new }
  let(:params) { { user: user, car: car } }
  let(:user) { Factory.structs[:user] }
  let(:car) do
    {
      vin: vin,
      model: Faker::Company.name,
      mark: Faker::Company.name,
      production_year: Date.new(2018, 10, 10)
    }
  end

  context 'when everything goes well' do
    let(:vin) { Faker::Lorem.word }

    it 'creates a car with proper attributes', :aggregate_failures do
      expect(transaction_call.success[:user_id]).to eq(user.id)
      expect(transaction_call.success).to include(car)
    end

    it 'returns success' do
      expect(transaction_call.success?).to eq(true)
    end
  end

  context 'when given vin exists' do
    let(:existed_car) { Factory[:car] }
    let(:vin) { existed_car.vin }

    it 'fails on create_car step and raises ROM::TupleCountMismatchError' do
      expect(transaction).to fail_on(:create_car)
        .with(params).and_raise(ROM::SQL::UniqueConstraintError)
    end
  end
end
