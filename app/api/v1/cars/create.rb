module V1
  module Cars
    class Create < Base
      helpers V1::Params::Cars

      desc I18n.t('api.v1.cars.create.desc') do
        failure(
          [
            { code: 400, message: I18n.t('api.code_400') },
            { code: 422, message: I18n.t('api.code_422') }
          ]
        )
        success(code: 201, message: I18n.t('api.code_201'))
      end

      params { use :car }

      helpers do
        def create_car_transaction
          ::Cars::CreateCarTransaction.new
        end

        def user
          # TODO: implement user authentication
          { user: UserRepo.new(ROM.env).by_id(1) }
        end
      end

      post do
        create_car_transaction.call(declared_params.merge(user)) do |m|
          m.success { status :created }

          m.failure(:create_car) { |e| error_422!(hint: e) }
        end
      end
    end
  end
end
