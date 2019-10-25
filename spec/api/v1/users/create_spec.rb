require 'rails_helper'

RSpec.describe V1::Users::Create do
  subject(:post_action) { post '/api/v1/users', params: params }

  let(:params) { { email: email, name: Faker::Name.name } }

  before { post_action }

  context 'when params are valid' do
    context 'when given email not exists' do
      let(:email) { Faker::Internet.email }

      it_behaves_like 'Created response'
    end

    context 'when email alredy exists' do
      let(:user) { Factory[:user] }
      let(:email) { user.email }

      it_behaves_like 'Unprocessable entity response'
    end
  end

  context 'when params are invalid' do
    let(:email) { 'invalid_email' }

    it_behaves_like 'Bad request response'
  end
end
