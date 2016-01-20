module Ammado

  # https://api.ammado.com/#BeneficiaryEndpoint
  class Beneficiary < ApiResource

    def self.find(id)
      code, response = api.get('/v1/beneficiary/' + id.to_s, { apiKey: api.key })
      return new(response) if code == '200'
    end

  end

end
