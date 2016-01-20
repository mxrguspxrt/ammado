module Ammado

  # https://api.ammado.com/#FundraiserAvatarEndpoint
  class FundraiserAvatar < ApiResource

    def create
       File.open(api.default_images_folder + file_name) do |file|
        file_postfix = file_name.split('.').last
        upload_io_file = UploadIO.new(file, AMMADO_FILE_POSTFIX_TO_TYPE[file_postfix], file_name)
        code, response = api.post_multipart(resource_create_path, params.merge(avatar: upload_io_file, signature: calculate_signature, apiKey: api.key))
        @params.merge!(response)
        return code == '201'
      end
    end

    def resource_create_path
      "/v1/fundraiser/#{fundraiser_id}/avatar"
    end

    def calculate_signature
      Rails.logger.info('Calculate signature for ' + @params.to_s)
      signature_parts = []
      signature_parts << fundraiser_id
      signature_parts << Base64.strict_encode64(file_name)
      signature_parts << api.secret
      plain_signature = signature_parts.flatten.join('.')
      Rails.logger.info('Plain signature is ' + plain_signature)
      return Digest::SHA1.hexdigest(plain_signature).upcase
    end

  end

end
