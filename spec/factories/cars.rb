Factory.define(:car) do |f|
  f.model { fake(:company, :name) }
  f.mark { fake(:company, :name) }
  f.vin { fake(:lorem, :word) }
  f.production_year { Date.current - 10.years }
  f.association(:user)
end
