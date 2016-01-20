module Ammado

  # https://api.ammado.com/#FundraiserEndpoint
  class Fundraiser < ApiResource

    def resource_create_path
      '/v1/fundraiser'
    end

    def created?
      !!permalink
    end

    def calculate_signature
      Rails.logger.info('Calculate signature for ' + @params.to_s)
      signature_parts = []
      signature_parts << beneficiary_id
      signature_parts << Base64.strict_encode64(fundraiser_title)
      signature_parts << api.secret
      plain_signature = signature_parts.flatten.join('.')
      Rails.logger.info('Plain signature is ' + plain_signature)
      return Digest::SHA1.hexdigest(plain_signature).upcase
    end

  end

end
