class CarRepo < ROM::Repository[:cars]
  def by_id(id)
    cars
      .by_pk(id)
      .one
  end

  def by_vin(vin)
    cars
      .by_vin(vin)
      .index
      .one!
  end

  def overview(filter: {}, sort: [])
    filter.reduce(cars.with_services.index) do |memo, (attr, value)|
      if value.is_a?(Hash)
        value.reduce(memo) do |m, (a, v)|
          services = ROM.env.relations[attr]
          m.left_join(services).where(services[a].is(v))
        end
      else
        memo.where(memo[attr].is(value))
      end
    end.order(*sort).to_a
  end
end
