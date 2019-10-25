require 'rails_helper'

RSpec.describe Services::CreateServiceTransaction do
  let(:transaction_call) { transaction.call(params) }
  let(:transaction) { described_class.new }
  let(:params) { { vin: vin, service: service } }
  let(:service) { { start_date: Time.current } }

  context 'when everything goes well' do
    let(:car) { Factory[:car] }
    let(:vin) { car.vin }

    it 'creates a car service with proper attributes', :aggregate_failures do
      expect(transaction_call.success[:car_id]).to eq(car.id)
      expect(transaction_call.success[:start_date]).to eq(service[:start_date])
    end

    it 'returns success' do
      expect(transaction_call.success?).to eq(true)
    end
  end

  context 'when car is not found' do
    let(:vin) { Faker::Lorem.word }

    it 'fails on find_car step and raises ROM::TupleCountMismatchError' do
      expect(transaction).to fail_on(:find_car).with(params).and_raise(ROM::TupleCountMismatchError)
    end
  end
end
