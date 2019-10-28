module Services
  class UpdateServiceTransaction < ::BaseTransaction
    map :update_service
    check :successfull_update?

    private

    def update_service(id:, service:)
      rom_env
        .relations[:services]
        .by_pk(id)
        .changeset(:update, service)
        .commit
    end

    def successfull_update?(input)
      input.present?
    end
  end
end
