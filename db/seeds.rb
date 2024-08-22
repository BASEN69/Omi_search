# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seedの実行を開始"

mike = User.find_or_create_by!(email: "mike@example.com") do |user|
  user.name = "mike"
  user.nick_name = "mike"
  user.password = "password19"
end

taro = User.find_or_create_by!(email: "asasas@exmple.com") do |user|
  user.name = "太郎"
  user.nicl_name = "taro"
  user.password = "asasas1919"
end

Admin.find_or_create_by!(email: "admin@exmple.com") do |admin|
  admin.password = "asasas1969"
end

# 47都道府県を作成
prefectures = [
  "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
  "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
  "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県",
  "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県",
  "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県",
  "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
  "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
]


prefectures.each do |name|
  Genre.find_or_create_by!(name: name)
end


Post.find_or_create_by!(name: "ままどーる") do |post|
  post.introduction = "クリーミーな洋菓子って感じで美味しい！"
  post.category = "会津若松市"
  post.user = mike
  post.genre = Genre.find_by(name: "福島県" )
end

Post.find_or_create_by!(name: "エキソンパイ") do |post|
  post.introduction = "あんこ入りのパイでとても美味しかった！また食べたい"
  post.category = "会津若松市"
  post.user = taro
  post.genre = Genre.find_by(name: "福島県" )
end

puts "Seedの実行が完了"