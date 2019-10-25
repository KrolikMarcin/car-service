module V1
  module Users
    class Base < Root
      namespace :users do
        mount Users::Create
      end
    end
  end
end
