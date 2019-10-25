class UserRepo < ROM::Repository[:users]
  commands :create, update: :by_pk

  def by_id(id)
    users.by_pk(id).one
  end

  def all
    users.to_a
  end
end
