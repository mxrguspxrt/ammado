module Ammado

  # https://api.ammado.com/#SearchEndpoint
  class Search < ApiResource

    def self.where(params)
      api.get('/v1/search', params.merge({ apiKey: api.key }))[1]
    end

  end

end
