#api.rb
def get_zodiac_api(zodiac)
  url = "https://zodiacal.herokuapp.com/#{zodiac}"
  response = HTTParty.get(url)
  res = response.parsed_response
  return res
end
