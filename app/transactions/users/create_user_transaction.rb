module Users
  class CreateUserTransaction < ::BaseTransaction
    try :create_user, catch: ROM::SQL::UniqueConstraintError

    private

    def create_user(email:, name:)
      rom_env
        .relations[:users]
        .changeset(:create, email: email, name: name)
        .commit
    end
  end
end
