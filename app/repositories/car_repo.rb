class CarRepo < ROM::Repository[:cars]
  def by_id(id)
    cars.by_pk(id).one
  end

  def by_vin(vin)
    cars.where(vin: vin).one!
  end

  def all
    cars.to_a
  end

  def with_services_by_user_id(user_id)
    cars
      .by_user(user_id)
      .combine(:services)
      .to_a
  end
end
