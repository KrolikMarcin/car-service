require 'rails_helper'

RSpec.describe V1::Services::Create do
  subject(:post_action) { post '/api/v1/services', params: params }

  let(:params) do
    {
      vin: vin,
      service: { start_date: start_date }
    }
  end

  before { post_action }

  context 'when params are valid' do
    let(:start_date) { Time.current }

    context 'when everything goes well' do
      let(:car) { Factory[:car] }
      let(:vin) { car.vin }

      it_behaves_like 'Created response'
    end

    context 'when given vin not exists' do
      let(:vin) { Faker::Lorem.word }

      it_behaves_like 'Unprocessable entity response'
    end
  end

  context 'when params are invalid' do
    let(:vin) { Faker::Lorem.word }
    let(:start_date) { Faker::Lorem.word }

    it_behaves_like 'Bad request response'
  end
end
