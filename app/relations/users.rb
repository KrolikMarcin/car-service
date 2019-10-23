class Users < ROM::Relation[:sql]
  schema(infer: true) do
    associations do
      has_many :cars
    end
  end
end
