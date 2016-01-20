files = [
  'api',
  'api_error',
  'api_resource',
  'categories',
  'fundraiser',
  'fundraiser_avatar',
  'fundraiser_cover',
  'fundraiser_moderator',
  'beneficiary',
  'search'
]

AMMADO_FILE_POSTFIX_TO_TYPE = {
  'jpg' => 'image/jpeg',
  'png' => 'image/png'
}

files.map do |file|
  require "ammado/#{file}"
end
