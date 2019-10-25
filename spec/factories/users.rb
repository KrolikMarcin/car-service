Factory.define(:user) do |f|
  f.name { fake(:name) }
  f.email { fake(:internet, :email) }
end
