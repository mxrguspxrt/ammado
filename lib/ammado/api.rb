require 'net/http/post/multipart'

module Ammado

  class Api

    class << self
      attr_accessor :default_api_link
    end

    attr_accessor :key,
      :secret,
      :host,
      :default_images_folder

    def initialize(opts)
      @key = opts[:key]
      @secret = opts[:secret]
      @host = opts[:host]
      @default_images_folder = opts[:default_images_folder]
    end

    def post(endpoint, params)
      log('Ammado POST')
      log('Endpoint: ' + endpoint)
      log('Params: ' + params.to_s)

      uri = URI(@host + endpoint)
      response = Net::HTTP.post_form(uri, params)
      log('Got response: ' + response.body)

      return [response.code, ActiveSupport::JSON.decode(response.body)]
    end

    def post_multipart(endpoint, params)
      log('Ammado POST file')
      log('Endpoint: ' + endpoint)
      log('Params: ' + params.to_s)

      uri = URI(@host + endpoint)

      request = Net::HTTP::Post::Multipart.new(uri.path, params)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      log('Got response: ' + response.body)
      return [response.code, ActiveSupport::JSON.decode(response.body)]
    end

    def get(endpoint, params)
      log('Ammado GET')
      log('Endpoint: ' + endpoint)
      log('Params: ' + params.to_s)

      full_url = [@host + endpoint, URI.encode_www_form(params)].compact.join('?')
      uri = URI(full_url)
      response = Net::HTTP.get_response(uri)
      log('Got response: ' + response.body)

      return [response.code, ActiveSupport::JSON.decode(response.body)]
    end

    def log(message)
      Rails.logger.info(message)
    end

  end

end
