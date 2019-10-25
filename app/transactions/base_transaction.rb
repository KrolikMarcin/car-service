class BaseTransaction
  include Dry::Transaction

  def rom_env
    ROM.env
  end
end
