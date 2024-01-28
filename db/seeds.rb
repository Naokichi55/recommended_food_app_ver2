user = User.first
Item.create!(name: "熱狂のWebマーケティング", price: 1500, user_id: user.id)
Item.create!(name: "日本歴史全巻セット", price: 1500, user_id: user.id)

User.create!(email: "test@example.com", password: "password")
puts "ユーザーの初期データインポートに成功しました。"
