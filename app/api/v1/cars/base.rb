module V1
  module Cars
    class Base < Root
      namespace :cars do
        mount Cars::Create
      end
    end
  end
end
