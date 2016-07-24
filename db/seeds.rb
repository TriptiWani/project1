# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users seed data
LineItem.destroy_all
Order.destroy_all
User.destroy_all

User.create(:first_name=>"Tripti",:last_name=>"Wani",:email=>"tripti.895@gmail.com",:dob=>"1986-11-15", :gender => "F" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"481254765" , :address => "Sydney" ,:image => "cute_girl.jpg",:admin => true, :currency => "INR")
User.create(:first_name=>"Admin",:last_name=>"",:email=>"tripti@gmail.com",:dob=>"1986-11-1", :gender => "F" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"481254765" , :address => "Canberra")
User.create(:first_name=>"Lori",:last_name=>"Taulbee",:email=>"lori@ga.com",:dob=>"1986-3-2", :gender => "F" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"456456456" , :address => "Dayton")
User.create(:first_name=>"Kym",:last_name=>"",:email=>"kym@ga.com",:dob=>"2008-1-2", :gender => "M" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"145234765" , :address => "Mumbai" )
User.create(:first_name=>"Xinwei",:last_name=>"Xang",:email=>"x@ga.com",:dob=>"1975-3-4", :gender => "M" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"678678678" , :address => "new York" )
User.create(:first_name=>"Pam",:last_name=>"Anderson",:email=>"pamand@ga.com",:dob=>"1995-2-6", :gender => "F" , :password => "chicken" ,:password_confirmation=>"chicken", :phone_number =>"967345876" , :address => "Perth" )



# Products seed data

Product.destroy_all
Product.create(:brand=>"Samsung", :model_num=>"S7 Golden", :price_cents=>"120000.0", :num_of_pieces=>"500", :color=>"Golden", :mfg_date=>"2015-01-01", :image=>"s7_golden.jpg",:category=> "Handset")
Product.create(:brand=>"Samsung", :model_num=>"S7 White", :price_cents=>"120000.0", :num_of_pieces=>"500", :color=>"White", :mfg_date=>"2016-04-01", :image=>"s7_white.jpg",:category=> "Handset")
Product.create(:brand=>"Samsung", :model_num=>"S7 Black", :price_cents=>"120000.0", :num_of_pieces=>"500", :color=>"Black", :mfg_date=>"2016-04-01", :image=>"s7_black.jpg",:category=> "Handset")
Product.create(:brand=>"Samsung", :model_num=>"Tab S2 White", :price_cents=>"44900", :num_of_pieces=>"500", :color=>"White", :mfg_date=>"2016-01-01", :image=>"tab_s2_white.jpg",:category=> "Tablet")
Product.create(:brand=>"Samsung", :model_num=>"Tab S2 Black", :price_cents=>"44900", :num_of_pieces=>"500", :color=>"Black", :mfg_date=>"2016-01-01", :image=>"tab_s2_black.jpg",:category=> "Tablet")
Product.create(:brand=>"Samsung", :model_num=>"Gear-Fit2 Black", :price_cents=>"26900", :num_of_pieces=>"50", :color=>"Black", :mfg_date=>"2016-06-01", :image=>"gear_black.jpg",:category=> "Accessory")
Product.create(:brand=>"Samsung", :model_num=>"Stereo headset White", :price_cents=>"2975.00", :num_of_pieces=>"50", :color=>"White", :mfg_date=>"2015-06-01", :image=>"stereo_headset_white.jpg",:category=> "Accessory")
Product.create(:brand=>"Samsung", :model_num=>"Flash Drive White", :price_cents=>"4500", :num_of_pieces=>"50", :color=>"White", :mfg_date=>"2015-03-01", :image=>"flash_drive_white.jpg",:category=> "Accessory")
