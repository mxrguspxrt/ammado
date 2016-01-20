AMMADO_ERRORS = {
  '1101' => ['beneficiaryId', 'Beneficiary is invalid'],
  '1102' => ['beneficiaryId', 'Beneficiary does not accept donations'],
  '1105' => ['beneficiaryId', 'Limit reached'],
  '1107' => ['beneficiaryId', 'Multiple beneficiaries from the same country'],
  '1804' => ['fundraiserAim', 'Fundraiser aim is too long (max 200 characters)'],
  '1801' => ['fundraiserDescription', 'Description field can have max 1000 characters'],
  '1701' => ['fundraiserTitle', 'Please enter a title for your fundraiser'],
  '1702' => ['fundraiserTitle', 'Name must be between 2 and 200 characters in length'],
  '2101' => ['fundraiserType', 'Invalid fundraiser type'],
  '2301' => ['isSearchable', 'Invalid parameter value'],
  '2701' => ['partnerCode', 'Invalid parameter value'],
  '1304' => ['targetAmount', 'Target amount must be a number'],
  '1305' => ['targetAmount', 'The target amount must be greater'],
  '1306' => ['targetAmount', 'The target amount must be smaller'],
  '1201' => ['targetCurrencyCode', 'Unsupported currency'],
  '1803' => ['thankYouMessage', 'Thank you message field can have max 1000 characters'],
  '1901' => ['signature', 'Invalid signature'],
  '1401' => ['email', 'You must provide a valid email addres'],
  '1402' => ['email', 'Email address must be formatted correctly (for example jsmith@example.com)'],
  '1403' => ['email', 'Email provided was too long (max 100 characters)'],
  '1404' => ['email', 'Invite already sent'],
  '1501' => ['firstName', 'Sorry, the first name you entered does not seem to be valid. Please enter a name between 1 and 100'],
  '1502' => ['firstName', 'First name too long (max 100 characters)'],
  '1601' => ['lastName', 'Sorry, the last name you entered does not seem to be valid. Please enter a name between 1 and 100 characters long. Some characters may not be valid'],
  '1602' => ['lastName', 'Last name too long (max 100 characters)'],
  '2801' => ['avatar', 'File upload failed'],
  '2802' => ['avatar', 'File size is too big. Maximum allowed is 5MB'],
  '2803' => ['avatar', 'File format is not valid. Accepted file types are: gif, png, bmp, jpeg, jpg'],
  '2804' => ['avatar', 'File not found'],
  '2801' => ['coverImage', 'File upload failed'],
  '2802' => ['coverImage', 'File size is too big. Maximum allowed is 5MB'],
  '2803' => ['coverImage', 'File format is not valid. Accepted file types are: gif, png, bmp, jpeg, jpg'],
  '2804' => ['coverImage', 'File not found']
}

module Ammado

  class ApiError

    attr_reader :code

    def initialize(code)
      @code = code
    end

    def param_name
      AMMADO_ERRORS[code.to_s][0]
    end

    def message
      AMMADO_ERRORS[code.to_s][1]
    end

  end

end
