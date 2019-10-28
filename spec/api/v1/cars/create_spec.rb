require 'rails_helper'

RSpec.describe V1::Cars::Create do
  subject(:post_action) { post '/api/v1/cars', params: params }

  let(:params) do
    {
      car: {
        mark: Faker::Company.name,
        model: Faker::Company.name,
        production_year: production_year,
        vin: vin
      },
      user_id: user.id
    }
  end
  let(:user) { Factory[:user] }

  before { post_action }

  context 'when params are valid' do
    let(:production_year) { Date.new(2010, 10, 10) }

    context 'when given vin not exists' do
      let(:vin) { Faker::Lorem.word }

      it_behaves_like 'Created response'
    end

    context 'when vin alredy exists' do
      let(:car) { Factory[:car] }
      let(:vin) { car.vin }

      it_behaves_like 'Unprocessable entity response'
    end
  end

  context 'when params are invalid' do
    let(:vin) { Faker::Lorem.word }
    let(:production_year) { Faker::Lorem.word }

    it_behaves_like 'Bad request response'
  end
end
