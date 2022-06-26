# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# active strageを用いている場合、blobを使うと、active strageとpostのidが一致しなくなるため、attachを使用する

end_user1 = EndUser.new(email: 'test1@example.com', nickname: 'Blanca', password: 'password')
end_user1.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-end_user1.jpg"), filename:"sample-end_user1.jpg")
end_user1.save

end_user2 = EndUser.new(email: 'test2@example.com', nickname: 'Lobo', password: 'password')
end_user2.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-end_user2.jpg"), filename:"sample-end_user2.jpg")
end_user2.save

end_user3 = EndUser.new(email: 'test3@example.com', nickname: 'Ernest', password: 'password')
end_user3.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-end_user3.jpg"), filename:"sample-end_user3.jpg")
end_user3.save


#end_user1 = EndUser.find_by(email: 'test1@example.com')
#end_user2 = EndUser.find_by(email: 'test2@example.com')
#end_user3 = EndUser.find_by(email: 'test3@example.com')


Admin.create!(
    email: 'admin@example.com',
    password: 'aaaaaa',
)

post_1 = Post.new(title: '大沢池の景色', body: '季節や時間によって、見える景色が違いそう。次は紅葉の頃に行ってみようか', end_user_id: end_user1.id)
post_1.post_images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
post_1.save!

post_2 = Post.new(title: '旅先の朝ごはん', body: 'ホテルで食べた洋風朝ごはん。スープが美味しい!', end_user_id: end_user2.id)
post_2.post_images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
post_2.save!

post_3 = Post.new(title: '桜並木', body: '旅行先で、運よく満開の桜並木を発見。隠れスポットなのか、あまり人は見当たらなかった。', end_user_id: end_user3.id)
post_3.post_images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
post_3.save!


# 問題のあった旧コード、比較のためこちらに貼り付け
# Endusers = EndUser.create!(
# [
#     {email: 'test1@example.com', nickname: ’Blanca’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-enduser1.jpg"), filename:"sample-end_user1.jpg")},
#     {email: 'test2@example.com', nickname: ’Lobo’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-end_user2.jpg")},
#     {email: 'test3@example.com', name: ‘Ernest’, password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-end_user3.jpg")},
#     {email: 'admin@example.com', nickname: 'Admin', password: 'admin1' }

#   ]
# )

# Post.create!(
#   [
#     {title: '大沢池の景色', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: ‘季節や時間によって、見える景色が違いそう。次は紅葉の頃に行ってみようか’, user_id: users[1].id },
#     {titile: '旅先の朝ごはん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: ‘古き良き日本の朝ごはんのイメージ。鮭の脂が乗ってて美味しい！’, user_id: users[2].id },
#     {title: '桜並木', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: ‘旅行先で、運よく満開の桜並木を発見。隠れスポットなのか、あまり人は見当たらなかった。’, user_id: users[3].id }
#   ]
# )