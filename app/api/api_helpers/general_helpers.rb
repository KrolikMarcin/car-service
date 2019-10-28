module APIHelpers
  module GeneralHelpers
    def declared_params
      declared(params, include_missing: false).deep_symbolize_keys
    end
  end
end
