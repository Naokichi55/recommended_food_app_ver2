email = "test@example.com"
password = "password"

ActiveRecord::Base.connection.execute <<~SQL.squish
  TRUNCATE TABLE users RESTART IDENTITY CASCADE;
SQL

user1 = User.create!(email: "satou@exaple.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

Food.create!(name: "うなぎ丼", comment: "うなぎの蒲焼をご飯の上に乗せた食事です。", user_id: user3.id)
Food.create!(name: "キャベツの千切り胡麻ドレッシングで", comment: "キャベツの千切りに胡麻ドレッシングただかけただけ", user_id: user3.id)
Food.create!(name: "赤だし", comment: "ネギの赤だし", user_id: user1.id)
Food.create!(name: "寿司", comment: "マグロ、いか", user_id: user2.id)

User.create!(email:, password:)

puts "ユーザーの初期データインポートに成功しました。"
