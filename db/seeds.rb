# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users seed data
#User.destroy_all
User.create(:first_name=>"Admin",:last_name=>"",:email=>"admin.895.com",:dob=>"1986-11-15", :gender => "F" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"481254765" , :address => "Canberra" ,:image => "cute_girl.jpg",:admin => true)

#
# User.create("first_name"=>"Tripti","last_name"=>"Wani","email"=>"tripti.895.com","dob"=>"1986-11-15", "gender" => "F" , "password_digest" => "chicken" , "phone_number" =>"481254765" , "address" => "Sydney" ,"image" => "cute_girl.jpg","admin" => true)
# User.create("first_name"=>"Lori","last_name"=>"Taulbee","email"=>"lori@ga.com","dob"=>"1986-3-2", "gender" => "F" , "password_digest" => "chicken" , "phone_number" =>"456456456" , "address" => "Dayton" ,"image" => "")
# User.create("first_name"=>"Kym","last_name"=>"","email"=>"kym@ga.com","dob"=>"2008-1-2", "gender" => "M" , "password_digest" => "chicken" , "phone_number" =>"145234765" , "address" => "Sydney" ,"image" => "")
# User.create("first_name"=>"Xinwei","last_name"=>"Xang","email"=>"x@ga.com","dob"=>"1975-3-4", "gender" => "M" , "password_digest" => "chicken" , "phone_number" =>"678678678" , "address" => "new York" ,"image" => "")
# User.create("first_name"=>"Pam","last_name"=>"Anderson","email"=>"pamand@ga.com","dob"=>"1995-2-6", "gender" => "F" , "password_digest" => "chicken" , "phone_number" =>"967345876" , "address" => "" ,"image" => "")
#
#
#
# # Products seed data
#
# Product.destroy_all
# Product.create("brand"=>"Samsung", "model_num"=>"S7", "price"=>"1200.0", "num_of_pieces"=>"500", "color"=>"Golden", "mfg_date"=>"2015-01-01", "image"=>"s7_golden.jpg","category"=> "Handset")
# Product.create("brand"=>"Samsung", "model_num"=>"S7", "price"=>"1200.0", "num_of_pieces"=>"500", "color"=>"White", "mfg_date"=>"2016-04-01", "image"=>"s7_white.jpg","category"=> "Handset")
# Product.create("brand"=>"Samsung", "model_num"=>"S7", "price"=>"1200.0", "num_of_pieces"=>"500", "color"=>"Black", "mfg_date"=>"2016-04-01", "image"=>"s7_black.jpg","category"=> "Handset")
# Product.create("brand"=>"Samsung", "model_num"=>"Tab S2", "price"=>"449", "num_of_pieces"=>"500", "color"=>"White", "mfg_date"=>"2016-01-01", "image"=>"tab_s2_white.jpg","category"=> "Tablet")
# Product.create("brand"=>"Samsung", "model_num"=>"Tab S2", "price"=>"449", "num_of_pieces"=>"500", "color"=>"Black", "mfg_date"=>"2016-01-01", "image"=>"tab_s2_black.jpg","category"=> "Tablet")
# Product.create("brand"=>"Samsung", "model_num"=>"Gear-Fit2", "price"=>"269", "num_of_pieces"=>"50", "color"=>"Black", "mfg_date"=>"2016-06-01", "image"=>"gear_black.jpg","category"=> "Accessory")
# Product.create("brand"=>"Samsung", "model_num"=>"Stereo headset", "price"=>"29.75", "num_of_pieces"=>"50", "color"=>"White", "mfg_date"=>"2015-06-01", "image"=>"stereo_headset_white.jpg","category"=> "Accessory")
# Product.create("brand"=>"Samsung", "model_num"=>"Flash Drive", "price"=>"45", "num_of_pieces"=>"50", "color"=>"White", "mfg_date"=>"2015-03-01", "image"=>"flash_drive_white.jpg","category"=> "Accessory")
