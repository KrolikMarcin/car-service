module Cars
  class CarsOverviewTransaction < ::BaseTransaction
    try :fetch_cars_details, catch: [KeyError, Sequel::DatabaseError]

    private

    def fetch_cars_details(filter: {}, sort: [])
      CarRepo
        .new(rom_env)
        .overview(filter: filter, sort: sort)
    end
  end
end
