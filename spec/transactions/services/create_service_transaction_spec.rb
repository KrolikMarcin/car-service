require 'rails_helper'

RSpec.describe Services::CreateServiceTransaction do
  let(:transaction_call) { transaction.call(vin) }
  let(:transaction) do
    described_class
      .new
      .with_step_args(
        create_service: [
          service: service
        ]
      )
  end
  let(:service) { { start_date: Time.current } }

  context 'when everything goes well' do
    let(:car) { Factory[:car] }
    let(:vin) { car.vin }
    let(:services_relation) { ROM.env.relations[:services] }

    it 'creates service' do
      expect { transaction_call }.to change(services_relation, :count).by(1)
    end

    it 'returns success' do
      expect(transaction_call.success?).to eq(true)
    end
  end

  context 'when car is not found' do
    let(:vin) { Faker::Lorem.word }

    it 'fails on find_car step and raises ROM::TupleCountMismatchError' do
      expect(transaction).to fail_on(:find_car).with(vin).and_raise(ROM::TupleCountMismatchError)
    end
  end
end
