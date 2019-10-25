module V1
  module Users
    class Create < Base
      helpers V1::Params::Users

      desc I18n.t('api.v1.users.create.desc') do
        failure(
          [
            { code: 400, message: I18n.t('api.code_400') },
            { code: 422, message: I18n.t('api.code_422') }
          ]
        )
        success(code: 201, message: I18n.t('api.code_201'))
      end

      params { use :user }

      helpers do
        def create_user_transaction
          ::Users::CreateUserTransaction.new
        end
      end

      post do
        create_user_transaction.call(declared_params) do |m|
          m.success { status :created }

          m.failure(:create_user) { |e| error_422!(hint: e) }
        end
      end
    end
  end
end
