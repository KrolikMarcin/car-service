module V1
  module Cars
    class Base < Root
      namespace :cars do
        mount Cars::Create
        mount Cars::Index
      end
    end
  end
end
