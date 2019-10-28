module V1
  class Root < Grape::API
    version 'v1', using: :path

    mount V1::Users::Base
    mount V1::Cars::Base
    mount V1::Services::Base
  end
end
