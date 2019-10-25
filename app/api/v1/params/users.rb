module V1
  module Params
    module Users
      extend Grape::API::Helpers

      params :user do
        requires(:email, type: String, regexp: /.+@.+/)
        requires(:name, type: String)
      end
    end
  end
end
