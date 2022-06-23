# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Endusers = EndUser.create!(
[
    {email: 'test1@example.com', nickname: ’Blanca’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-enduser1.jpg"), filename:"sample-end_user1.jpg")},
    {email: 'test2@example.com', nickname: ’Lobo’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-end_user2.jpg")},
    {email: 'test3@example.com', name: ‘Ernest’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-end_user3.jpg")},
    {email: 'admin@example.com', nickname: 'Admin', password: 'admin1' }

  ]
)

Post.create!(
  [
    {title: '大沢池の景色', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: ‘季節や時間によって、見える景色が違いそう。次は紅葉の頃に行ってみようか’, user_id: users[1].id },
    {titile: '旅先の朝ごはん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: ‘古き良き日本の朝ごはんのイメージ。鮭の脂が乗ってて美味しい！’, user_id: users[2].id },
    {title: '桜並木', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: ‘旅行先で、運よく満開の桜並木を発見。隠れスポットなのか、あまり人は見当たらなかった。’, user_id: users[3].id }
  ]
)
