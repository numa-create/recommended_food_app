# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テーブルを再生成
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE foods RESTART IDENTITY CASCADE")

user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

Food.create!(name: "オムライス", comment: "オムライスtesttesttest", user_id: user2.id)
Food.create!(name: "チャーハン", comment: "チャーハンtest", user_id: user3.id)
Food.create!(name: "焼きそば", comment: "焼きそばtest", user_id: user3.id)

puts "初期データの投入に成功しました！"
