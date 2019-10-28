module V1
  module Params
    module Services
      extend Grape::API::Helpers

      params :new_service do
        group(:service, type: Hash) do
          requires(:start_date, type: DateTime)
        end
      end

      params :update_service do
        group(:service, type: Hash) do
          optional(:end_date, type: String)
          optional(:price, type: Integer)
        end
      end

      params(:vin) { requires(:vin, type: String) }
      params(:id) { requires(:id, type: Integer) }
    end
  end
end
