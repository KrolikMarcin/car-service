module APIHelpers
  module ErrorHelpers
    def error_400!(hint: nil)
      handle_error(I18n.t('api.code_400'), 400, hint)
    end

    def error_404!(hint: nil)
      handle_error(I18n.t('api.code_404'), 404, hint)
    end

    def error_422!(hint: nil)
      dev_hint = hint if Rails.env.development?
      handle_error(I18n.t('api.code_422'), 422, dev_hint)
    end

    private

    def handle_error(errors, code, hint = nil)
      error!(
        payload(errors, hint),
        code
      )
    end

    def payload(errors, hint = nil)
      {
        errors: Array(errors),
        hint: hint
      }.compact
    end
  end
end
