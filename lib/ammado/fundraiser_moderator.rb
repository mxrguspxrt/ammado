module Ammado

  # https://api.ammado.com/#FundraiserModeratorEndpoint
  class FundraiserModerator < ApiResource

    def resource_create_path
      "/v1/fundraiser/#{fundraiser_id}/moderators"
    end

    def calculate_signature
      Rails.logger.info('Calculate signature for ' + @params.to_s)
      signature_parts = []
      signature_parts << fundraiser_id
      signature_parts << email
      signature_parts << api.secret
      plain_signature = signature_parts.flatten.join('.')
      Rails.logger.info('Plain signature is ' + plain_signature)
      return Digest::SHA1.hexdigest(plain_signature).upcase
    end

  end

end
