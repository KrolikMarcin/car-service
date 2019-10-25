class ServiceRepo < ROM::Repository[:services]
  commands :create, update: :by_pk

  def by_id(id)
    services.by_pk(id).one
  end

  def all
    services.to_a
  end
end
