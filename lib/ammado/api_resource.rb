module Ammado

  class ApiResource

    def self.create(params)
      resource = new(params)
      resource.create
      return resource
    end


    attr_accessor :params

    def create
      code, response = api.post(resource_create_path, params.merge(signature: calculate_signature, apiKey: api.key))
      @params.merge!(response)
      return code == '201'
    end

    def initialize(params)
      @params = {}
      params.each do |k, v|
        send("#{k}=", v)
      end
    end

    def method_missing(m, value=nil)
      meth = m.to_s
      if meth.last == '='
        assign_meth = meth[0..-2]
        params[assign_meth.underscore] = params[assign_meth.camelize(:lower)] = value
      else
        return params[meth.underscore] || params[meth.camelize(:lower)]
      end
    end

    def self.api
      Ammado::Api.default_api_link
    end

    def api
      Ammado::Api.default_api_link
    end

    def errors
      if error_codes
        error_codes.map {|code| Ammado::ApiError.new(code) }
      else
        []
      end
    end

  end

end
