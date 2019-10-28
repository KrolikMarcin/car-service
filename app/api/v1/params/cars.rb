module V1
  module Params
    module Cars
      extend Grape::API::Helpers

      params :car do
        group(:car, type: Hash) do
          requires(:mark, type: String)
          requires(:model, type: String)
          requires(:vin, type: String)
          requires(:production_year, type: Date)
        end
      end

      params :filter do
        optional(:filter, type: Hash)
      end

      params :sort do
        optional(:sort, type: Array)
      end
    end
  end
end
