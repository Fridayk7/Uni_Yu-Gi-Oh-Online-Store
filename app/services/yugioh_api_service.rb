require "http"
class YugiohApiService

def get_yugioh_sets()
	response = HTTP.get("http://yugiohprices.com/api/card_sets")
  parsed_response = JSON.parse(response.body)
  if parsed_response == nil
    return "calls per minutes limit reached"
  end
end

	def get_cards_from_set(setname)
		response = HTTP.get("http://yugiohprices.com/api/set_data/#{setname}")
	  parsed_response = JSON.parse(response.body)
	  if parsed_response["status"] != "success"
	    return "calls per minutes limit reached"
	  end
		parsed_response["data"]["cards"]

	end
end
