module V1
  module Services
    class Base < Root
      namespace :services do
        mount Services::Create
        mount Services::Update
      end
    end
  end
end
