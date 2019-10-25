Factory.define(:car) do |f|
  f.model { fake(:company, :name) }
  f.mark { fake(:company, :name) }
  f.vin { fake(:lorem, :word) }
  f.association(:user)
end
