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

	def get_card_image(name)
		response = HTTP.get("http://yugiohprices.com/api/card_image/#{name}")
	  parsed_response = JSON.parse(response.body)
	  if parsed_response["status"] != "success"
	    return "calls per minutes limit reached"
	  end
	end

	def get_card_price(tag)
		response = HTTP.get("http://yugiohprices.com/api/price_for_print_tag/#{tag}")
	  parsed_response = JSON.parse(response.body)
	  if parsed_response["status"] != "success"
	    return "calls per minutes limit reached"
	  end
		if 	parsed_response["data"]["price_data"]["price_data"]["status"] != "success"
			return "No price available at the moment"
		end

		parsed_response["data"]["price_data"]["price_data"]["data"]["prices"]["average"]
	end

end
