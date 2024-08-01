# API calls for Invite object
module Discordrb::API::Invite
  module_function

  # Resolve an invite
  # https://discord.com/developers/docs/resources/invite#get-invite
  def resolve(token, invite_code, counts = true)
    Discordrb::API.request(
      :invite_code,
      nil,
      :get,
      "#{Discordrb::API.api_base}/invites/#{invite_code}#{counts ? "?with_counts=true" : ""}",
      authorization: token
    )
  end

  # Delete an invite by code
  # https://discord.com/developers/docs/resources/invite#delete-invite
  def delete(token, code, reason = nil)
    Discordrb::API.request(
      :invites_code,
      nil,
      :delete,
      "#{Discordrb::API.api_base}/invites/#{code}",
      authorization: token,
      x_audit_log_reason: reason
    )
  end

  # Join a server using an invite
  # https://discord.com/developers/docs/resources/invite#accept-invite
  def accept(token, invite_code)
    Discordrb::API.request(
      :invite_code,
      nil,
      :post,
      "#{Discordrb::API.api_base}/invites/#{invite_code}",
      nil,
      authorization: token
    )
  end
end
