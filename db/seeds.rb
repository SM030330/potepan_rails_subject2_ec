# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザー作成
# 19.times do |n|
#   name  = "nameNo#{n+1}"
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

# ルーム作成(東京)
10.times do |n|
  name = "roomNo#{n+1}"
  info = "新宿No#{n+1}"
  value = 30*n
  user = User.find_by_id(n+1)
  room = user.rooms.new(name: name,
                           info: info,
                           value: value,
                           address: "東京")
  room.room_img.attach(io: File.open(Rails.root.join('app/assets/images/default_room_img.jpg')),
                       filename: 'default_room_img.jpg')
  room.save!
end


# ルーム作成(札幌)
10.times do |n|
  name = "roomNo#{n+1}"
  info = "新宿No#{n+1}"
  value = 30*n
  user = User.find_by_id(n+1)
  room = user.rooms.build(name: name,
                           info: info,
                           value: value.to_i,
                           address: "札幌")
  room.room_img.attach(io: File.open(Rails.root.join('app/assets/images/default_room_img.jpg')),
                       filename: 'default_room_img.jpg')
  room.save!
end


# ルーム作成(大阪)
10.times do |n|
  name = "roomNo#{n+1}"
  info = "新宿No#{n+1}"
  value = 30*n
  user = User.find_by_id(n+1)
  room = user.rooms.build(name: name,
                           info: info,
                           value: value,
                           address: "大阪")
  room.room_img.attach(io: File.open(Rails.root.join('app/assets/images/default_room_img.jpg')),
                       filename: 'default_room_img.jpg')
  room.save!
end


# ルーム作成(京都)
10.times do |n|
  name = "roomNo#{n+1}"
  info = "新宿No#{n+1}"
  value = 30*n
  user = User.find_by_id(n+1)
  room = user.rooms.build(name: name,
                           info: info,
                           value: value,
                           address: "京都")
  room.room_img.attach(io: File.open(Rails.root.join('app/assets/images/default_room_img.jpg')),
                       filename: 'default_room_img.jpg')
  room.save!
end


# ルーム作成(札幌)
10.times do |n|
  name = "roomNo#{n+1}"
  info = "新宿No#{n+1}"
  value = 30*n
  user = User.find_by_id(n+1)
  room = user.rooms.new!(name: name,
                           info: info,
                           value: value,
                           address: "札幌")
  room.room_img.attach!(io: File.open(Rails.root.join('app/assets/images/default_room_img.jpg')),
                       filename: 'default_room_img.jpg')
  room.save!
end