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

  def by_vin(vin)
    where(vin: vin)
  end

  def index
    select(
      :id,
      :mark,
      :model,
      :production_year,
      :vin,
      users[:name].as(:owner)
    ).join(users)
  end

  def with_services
    combine(:services)
  end
end
