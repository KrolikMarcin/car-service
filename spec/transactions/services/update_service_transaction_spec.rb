require 'rails_helper'

RSpec.describe Services::UpdateServiceTransaction do
  let(:transaction_call) { transaction.call(params) }
  let(:transaction) { described_class.new }
  let(:params) { { id: id, service: service_data } }
  let(:service_data) { { price: 1000 } }

  context 'when everything goes well' do
    let(:service) { Factory[:service] }
    let(:id) { service.id }

    it 'updates a service' do
      expect(transaction_call.success).to include(service_data)
    end

    it 'returns success' do
      expect(transaction_call.success?).to eq(true)
    end
  end

  context 'when service with given id not exists' do
    let(:id) { 100 }

    it 'fails on successfull_update? step' do
      expect(transaction).to fail_on(:successfull_update?).with(params)
    end
  end
end
