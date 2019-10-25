module APIHelpers
  module GeneralHelpers
    def declared_params
      declared(params, include_missing: false).symbolize_keys
    end
  end
end
