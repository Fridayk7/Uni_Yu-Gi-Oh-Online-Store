require "http"
class YugiohApiService

def get_yugioh_sets()
  #doesnt work when city name has a space, calls per minute limit reached problem
	response = HTTP.get("http://yugiohprices.com/api/card_sets")
  parsed_response = JSON.parse(response.body)
  if parsed_response == nil
    return "calls per minutes limit reached"
  end

	def get_cards_from_set(setname)
	  #doesnt work when city name has a space, calls per minute limit reached problem
		response = HTTP.get("http://yugiohprices.com/api/set_data/#{setname}")
	  parsed_response = JSON.parse(response.body)
	  if parsed_response["status"] != "success"
	    return "calls per minutes limit reached"
	  end
		parsed_response["data"]["cards"]

end
