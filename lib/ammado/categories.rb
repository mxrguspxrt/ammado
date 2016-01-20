module Ammado

  # https://api.ammado.com/#CategoriesEndpoint
  class Categories < ApiResource

    def self.all
      api.get('/v1/categories', { apiKey: api.key })[1]
    end

  end

end
