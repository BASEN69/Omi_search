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
  user.nick_name = "taro"
  user.password = "asasas1919"
end

taku = User.find_or_create_by!(email: "asas@exmple.com") do |user|
  user.name = "たくや"
  user.nick_name = "taku"
  user.password = "asasas1919"
end

Admin.find_or_create_by!(email: "admin@exmple.com") do |admin|
  admin.password = "asasas1969"
end

# 47都道府県を作成
genres = [
  { name: '北海道', latitude: 43.06417, longitude: 141.34694 },
  { name: '青森県', latitude: 40.82444, longitude: 140.74 },
  { name: '岩手県', latitude: 39.70361, longitude: 141.1525 },
  { name: '宮城県', latitude: 38.26889, longitude: 140.87194 },
  { name: '秋田県', latitude: 39.71861, longitude: 140.1025 },
  { name: '山形県', latitude: 38.24056, longitude: 140.36333 },
  { name: '福島県', latitude: 37.75, longitude: 140.46778 },
  { name: '茨城県', latitude: 36.34139, longitude: 140.44667 },
  { name: '栃木県', latitude: 36.56583, longitude: 139.88361 },
  { name: '群馬県', latitude: 36.39111, longitude: 139.06083 },
  { name: '埼玉県', latitude: 35.85694, longitude: 139.64889 },
  { name: '千葉県', latitude: 35.60472, longitude: 140.12333 },
  { name: '東京都', latitude: 35.68944, longitude: 139.69167 },
  { name: '神奈川県', latitude: 35.44778, longitude: 139.6425 },
  { name: '新潟県', latitude: 37.90222, longitude: 139.02361 },
  { name: '富山県', latitude: 36.69528, longitude: 137.21139 },
  { name: '石川県', latitude: 36.59444, longitude: 136.62556 },
  { name: '福井県', latitude: 36.06528, longitude: 136.22194 },
  { name: '山梨県', latitude: 35.66389, longitude: 138.56833 },
  { name: '長野県', latitude: 36.65139, longitude: 138.18111 },
  { name: '岐阜県', latitude: 35.39111, longitude: 136.72222 },
  { name: '静岡県', latitude: 34.97694, longitude: 138.38306 },
  { name: '愛知県', latitude: 35.18028, longitude: 136.90667 },
  { name: '三重県', latitude: 34.73028, longitude: 136.50861 },
  { name: '滋賀県', latitude: 35.00444, longitude: 135.86833 },
  { name: '京都府', latitude: 35.02139, longitude: 135.75556 },
  { name: '大阪府', latitude: 34.68639, longitude: 135.52 },
  { name: '兵庫県', latitude: 34.69139, longitude: 135.18306 },
  { name: '奈良県', latitude: 34.68528, longitude: 135.83278 },
  { name: '和歌山県', latitude: 34.22611, longitude: 135.1675 },
  { name: '鳥取県', latitude: 35.50361, longitude: 134.23833 },
  { name: '島根県', latitude: 35.47222, longitude: 133.05056 },
  { name: '岡山県', latitude: 34.66167, longitude: 133.935 },
  { name: '広島県', latitude: 34.39639, longitude: 132.45944 },
  { name: '山口県', latitude: 34.18583, longitude: 131.47139 },
  { name: '徳島県', latitude: 34.06583, longitude: 134.55944 },
  { name: '香川県', latitude: 34.34028, longitude: 134.04333 },
  { name: '愛媛県', latitude: 33.84167, longitude: 132.76611 },
  { name: '高知県', latitude: 33.55972, longitude: 133.53111 },
  { name: '福岡県', latitude: 33.60639, longitude: 130.41806 },
  { name: '佐賀県', latitude: 33.24944, longitude: 130.29889 },
  { name: '長崎県', latitude: 32.74472, longitude: 129.87361 },
  { name: '熊本県', latitude: 32.78972, longitude: 130.74167 },
  { name: '大分県', latitude: 33.23806, longitude: 131.6125 },
  { name: '宮崎県', latitude: 31.91111, longitude: 131.42389 },
  { name: '鹿児島県', latitude: 31.56028, longitude: 130.55806 },
  { name: '沖縄県', latitude: 26.2125, longitude: 127.68111 }
]


genres.each do |genre|
  Genre.find_or_create_by!(genre)
end


Post.find_or_create_by!(name: "ままどーる") do |post|
  post.introduction = "クリーミーな洋菓子って感じで美味しい！"
  post.category = "会津若松市"
  post.user = mike
  post.genre = Genre.find_by(name: "福島県" )
  post.star = "5"
  post.address = "福島県会津若松市"
  post.latitude = 37.488041733652715
  post.longitude = 139.92967979049072
end

Post.find_or_create_by!(name: "エキソンパイ") do |post|
  post.introduction = "あんこ入りのパイでとても美味しかった！また食べたい"
  post.category = "会津若松市"
  post.user = taro
  post.genre = Genre.find_by(name: "福島県" )
  post.star = "4"
  post.address = "福島県会津若松市"
  post.latitude = 37.488041733652715
  post.longitude = 139.92967979049072
  post.images.attach(
    ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_7415.jpg"), filename: "IMG_7415.jpg"),
  )
end

Post.find_or_create_by!(name: "揚げパン") do |post|
  post.introduction = "市役所の近くで種類も豊富で何回も行きたい！"
  post.category = "川越市"
  post.user = taku
  post.genre = Genre.find_by(name: "埼玉県" )
  post.star = "4"
  post.address = "埼玉県川越市"
  post.latitude = 35.92468606449596
  post.longitude = 139.48520874959868
end

Post.find_or_create_by!(name: "かりんとう") do |post|
  post.introduction = "三種類の味がって好みの味でぱくぱく食べれる！"
  post.category = "川越市"
  post.user = taku
  post.genre = Genre.find_by(name: "埼玉県" )
  post.star = "4"
  post.address = "埼玉県川越市"
  post.latitude = 35.923627462494
  post.longitude = 139.4830612048935
  post.images.attach(
    ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_7416.jpg"), filename: "IMG_7416.jpg"),
  )
end

Post.find_or_create_by!(name: "あかべこ") do |post|
  post.introduction = "赤い牛って意味らしいです！首が上下に揺れて可愛い"
  post.category = "会津若松市"
  post.user = taro
  post.genre = Genre.find_by(name: "福島県" )
  post.star = "4"
  post.address = "福島県会津若松市"
  post.latitude = 37.488041733652715
  post.longitude = 139.92967979049072
  post.images.attach(
    ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/akabeko.png"), filename: "akabeko.png"),
  )
end

Post.find_or_create_by!(name: "喜多方ラーメン") do |post|
  post.introduction = "あっさり醤油で美味しい！持ち帰りの生麵あるから家でも楽しめる"
  post.category = "会津若松市"
  post.user = taro
  post.genre = Genre.find_by(name: "福島県" )
  post.star = "4"
  post.address = "福島県会津若松市城西町"
  post.latitude = 37.482493660396756
  post.longitude = 139.91690130793458
end

puts "Seedの実行が完了"