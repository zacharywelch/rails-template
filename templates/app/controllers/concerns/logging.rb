module Logging
  extend ActiveSupport::Concern

  private

  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:uuid] = request.uuid
  end
end
