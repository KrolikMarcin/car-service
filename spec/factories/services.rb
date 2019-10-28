Factory.define(:service) do |f|
  f.start_date { Time.current }
  f.association(:car)
end
