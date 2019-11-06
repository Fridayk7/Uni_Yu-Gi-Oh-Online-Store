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

end
