module Cars
  class CreateCarTransaction < ::BaseTransaction
    try :create_car, catch: ROM::SQL::UniqueConstraintError

    private

    def create_car(user:, car:)
      rom_env
        .relations[:cars]
        .changeset(:create, car.symbolize_keys)
        .associate(user)
        .commit
    end
  end
end
