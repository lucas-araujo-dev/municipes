# frozen_string_literal: true

module ActiveStorageServiceHandler
  extend ActiveSupport::Concern

  included do
    before_action :set_active_storage_host

    def set_active_storage_host
      storage_service = Rails.application.config.active_storage.service
      return if storage_service == :amazon

      ActiveStorage::Current.url_options = {
        protocol: request.protocol,
        host: request.host,
        port: request.port
      }
    end
  end
end
