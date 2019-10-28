module V1
  module Services
    class Update < Base
      helpers V1::Params::Services

      desc I18n.t('api.v1.services.update.desc') do
        failure(
          [
            { code: 400, message: I18n.t('api.code_400') },
            { code: 422, message: I18n.t('api.code_422') }
          ]
        )
        success(code: 200, message: I18n.t('api.code_200'))
      end

      params { use :id, :update_service }

      helpers do
        def update_service_transaction
          ::Services::UpdateServiceTransaction.new
        end
      end

      patch do
        update_service_transaction.call(declared_params) do |m|
          m.success(&:as_json)

          m.failure(:successfull_update?) { error_422! }
        end
      end
    end
  end
end
