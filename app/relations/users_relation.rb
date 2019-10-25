class UsersRelation < ROM::Relation[:sql]
  schema(:users, infer: true) do
    associations do
      has_many :cars
    end
  end
end
