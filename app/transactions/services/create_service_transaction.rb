module Services
  class CreateServiceTransaction < ::BaseTransaction
    try :find_car, catch: ROM::TupleCountMismatchError
    map :create_service

    private

    def find_car(vin)
      CarRepo
        .new(rom_env)
        .by_vin(vin)
    end

    def create_service(car, service:)
      rom_env
        .relations[:services]
        .changeset(:create, service)
        .associate(car)
        .commit
    end
  end
end
