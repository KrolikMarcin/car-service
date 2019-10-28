require 'rails_helper'

RSpec.describe V1::Services::Update do
  subject(:patch_action) { patch '/api/v1/services', params: params }

  let(:params) do
    {
      id: id,
      service: { price: price }
    }
  end

  before { patch_action }

  context 'when params are valid' do
    let(:price) { 1000 }

    context 'when everything goes well' do
      let(:service) { Factory[:service] }
      let(:id) { service.id }

      it_behaves_like 'Success response'

      it 'returns updated service' do
        expect(parsed_response['price']).to eq(price)
      end
    end

    context 'when given id not exists' do
      let(:id) { 1000 }

      it_behaves_like 'Unprocessable entity response'
    end
  end

  context 'when params are invalid' do
    let(:id) { Faker::Lorem.word }
    let(:price) { Faker::Lorem.word }

    it_behaves_like 'Bad request response'
  end
end
