require 'csv'
namespace :cards do
  desc "TODO"
  task seed_cards: :environment do
    Card.destroy_all

   CSV.foreach("lib/assets/card_data.csv", :headers =>true) do |row |
     puts row.inspect #just so that we know the file's being read

     #create new model instances with the data
     Card.create!(
     name: row[0].to_s,
     card_type: row[1].to_s,
     level: row[2].to_i,
     race:row[3].to_s,
     card_attribute: row[4].to_s,
     atk:row[5].to_i,
     def:row[6].to_i
   )
   end
 end

   task seed_sets: :environment do
    YugiohSet.destroy_all

    CSV.foreach("lib/assets/Yugioh_sets.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      YugiohSet.create!(
      name: row[0].to_s,
      code: row[1].to_s,
      year: row[2].to_i,
    )
    end
  end


  task seed_stock: :environment do
    Stock.destroy_all

    CSV.foreach("lib/assets/backupStocks.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      Stock.create!(
      card: Card.find_by(id: row[0]),
      yugioh_set: YugiohSet.find_by(id: row[1]),
      print_tag: row[2],
      price: row[3],
      quantity: rand(100),
    )
  end

#@sets = YugiohSet.all
#hash = YugiohApiService.new

#@sets.each do |set|
#@set_holder = hash.get_cards_from_set(set.name)
#n=1
#while @set_holder[n] != nil do
#  if Card.find_by(name: @set_holder[n]["name"])
#   Stock.create!(
#   card: Card.find_by(name: @set_holder[n]["name"]),
#   yugioh_set: YugiohSet.find_by(name: set.name),
#   print_tag: @set_holder[n]["numbers"][0]["print_tag"],
#   price: ( @set_holder[n]["numbers"][0]["price_data"]["data"]["prices"]["average"]  if (@set_holder[n]["numbers"][0]["price_data"]["status"] == "success") ) ,
#   quantity: rand(100),
 #)
  #    end
  #    puts  @set_holder[n]["name"] + "created"
  #     n +=1
  #    end
  #  end
  #end
end
