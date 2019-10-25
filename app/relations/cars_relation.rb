class CarsRelation < ROM::Relation[:sql]
  schema(:cars, infer: true) do
    associations do
      belongs_to :user
      has_many :services
    end
  end

  dataset { order { id.desc } }

  def by_user(user_id)
    where(user_id: user_id)
  end
end
