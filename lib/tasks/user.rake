require 'faker'

namespace :user do
  desc "TODO"
  task seed_users: :environment do
    Order.destroy_all
    Payment.destroy_all
    User.destroy_all

    adminpassword = Faker::Number.number(digits: 10)
    puts "Please write these cretentials down since you will need them later"
    puts "Emai: Admin@gmail.com"
    puts "Password: " + adminpassword.to_s
    User.create!(
      name: "Admin",
      email: "Admin" + "@gmail.com" ,
      password: adminpassword.to_s,
      password_confirmation: adminpassword.to_s
    )
    puts "Rest of the users"
    20.times do |index|
      myname = Faker::Name.first_name.to_s
      mypassword = Faker::Number.number(digits: 10)
      puts myname + "@gmail.com"
          User.create!(
            name: myname,
            email: myname + "@gmail.com" ,
            password: mypassword.to_s,
            password_confirmation: mypassword.to_s,
            #password_digest: BCrypt::Password.create(mypassword)
          )
        end
  end

  task seed_credit_cards: :environment do
    CreditCard.destroy_all
@users = User.all

@users.each do |user|
  CreditCard.create!(
    number: Faker::Number.number(digits: 16),
    exp_date: Faker::Date.between_except(from: 1.year.from_now, to: 3.year.from_now, excepted: Date.today),
    name_on_card: user.name,
    organisation: "Visa",
    user: user
    )
  puts user.name + "done"
    end
  end

  task seed_addresses: :environment do
    Address.destroy_all
@users = User.all

@users.each do |user|
  Address.create!(
    street:Faker::Address.street_address,
      city:Faker::Address.city,
      postcode:Faker::Address.postcode,
      user: user
    )
  puts user.name + "done"
    end
  end
end
