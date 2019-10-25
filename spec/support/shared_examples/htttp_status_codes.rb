require 'rails_helper'

shared_examples 'Success response' do
  it 'returns success response' do
    expect(response).to have_http_status(:ok)
  end
end

shared_examples 'Unprocessable entity response' do
  it 'returns unprocessable entity response' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end

shared_examples 'Bad request response' do
  it 'returns 400 response' do
    expect(response).to have_http_status(:bad_request)
  end
end

shared_examples 'Created response' do
  it 'returns 201 response' do
    expect(response).to have_http_status(:created)
  end
end
