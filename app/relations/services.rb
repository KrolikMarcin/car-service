class Services < ROM::Relation[:sql]
  schema(infer: true) do
    associations do
      belongs_to :car
    end
  end
end
