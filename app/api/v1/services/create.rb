module V1
  module Services
    class Create < Base
      helpers V1::Params::Services

      desc I18n.t('api.v1.services.create.desc') do
        failure(
          [
            { code: 400, message: I18n.t('api.code_400') },
            { code: 422, message: I18n.t('api.code_422') }
          ]
        )
        success(code: 201, message: I18n.t('api.code_201'))
      end

      params { use :vin, :new_service }

      helpers do
        def create_service_transaction
          ::Services::CreateServiceTransaction
            .new
            .with_step_args(
              create_service: [
                service: declared_params[:service]
              ]
            )
        end
      end

      post do
        create_service_transaction.call(declared_params[:vin]) do |m|
          m.success { status :created }

          m.failure(:find_car) { |e| error_422!(hint: e) }
        end
      end
    end
  end
end
