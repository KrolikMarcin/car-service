module V1
  module Cars
    class Index < Base
      helpers V1::Params::Cars

      desc I18n.t('api.v1.cars.index.desc') do
        failure(
          [
            { code: 400, message: I18n.t('api.code_400') },
            { code: 422, message: I18n.t('api.code_422') }
          ]
        )
        success(code: 200, message: I18n.t('api.code_200'))
      end

      params { use :filter, :sort }

      helpers do
        def cars_overview_transaction
          ::Cars::CarsOverviewTransaction.new
        end
      end

      get do
        cars_overview_transaction.call(declared_params) do |m|
          m.success(&:as_json)
          m.failure(:fetch_cars_details) { |e| error_422!(hint: e) }
        end
      end
    end
  end
end
