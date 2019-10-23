class Cars < ROM::Relation[:sql]
  schema(infer: true) do
    associations do
      belongs_to :user
      has_many :services
    end
  end
end
