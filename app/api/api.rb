class API < Grape::API
  content_type :json, 'application/json'
  default_format :json
  format :json

  helpers APIHelpers::ErrorHelpers
  helpers APIHelpers::GeneralHelpers
  include Rescuers

  mount V1::Root

  route :any, '*path' do
    error_404!
  end
end
