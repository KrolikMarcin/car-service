module Rescuers
  extend ActiveSupport::Concern

  included do
    rescue_from Grape::Exceptions::ValidationErrors do |e|
      hint = e.full_messages
      error_400!(hint: hint)
    end

    rescue_from :all do |e|
      message = Rails.env.development? ? e.message : I18n.t('api.code_500')
      error!({ errors: [message] }, 500)
    end
  end
end
