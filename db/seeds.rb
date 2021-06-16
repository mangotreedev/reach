require 'open-uri'

puts "Clearing DB 🗑"
Survey.destroy_all
User.destroy_all

puts "Creating Users 🤠"
User.create!(username: "Sy", email: "sy@mangotree.dev", password: "password", agree_terms: true, admin: true)
print "."
User.create!(username: "Nico", email: "nico@mangotree.dev", password: "password", agree_terms: true, admin: true)
print ".\n"
User.create!(username: "Karl", email: "karl.sofinowski@gmail.com", password: "password", agree_terms: true, admin: true)
print ".\n"

puts "Created #{User.count} users"
puts "---\n"

puts "Creating Surveys 📸"

file  = File.open(File.join(Rails.root,'app/assets/images/sample.jpg'))
survey = Survey.new(style: 0, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file  = File.open(File.join(Rails.root,'app/assets/images/about__photo_two.jpg'))
survey = Survey.new(style: 0, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://media1.popsugar-assets.com/files/thumbor/84dbkmI1AmRVi4QZg-Sbq0106P0/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2016/08/30/971/n/1922398/aea3cb8bcccf0391_GettyImages-511760970/i/Sacha-Baron-Cohen-Isla-Fisher.jpg")
survey = Survey.new(style: 0, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://i.pinimg.com/originals/9e/22/68/9e22683119fb0a250dd508712a99bc63.png")
survey = Survey.new(style: 0, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.png', content_type: 'image/png')
survey.save!
print '.'

file = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/tom-holland-and-zendays-pose-at-the-after-party-for-the-news-photo-1158553780-1562171416.jpg")
survey = Survey.new(style: 0, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://external-preview.redd.it/LUEpTAqgJE64IKeOWUs42CJqJmIiSGcBQo_o1DE2n5Q.jpg?auto=webp&s=3aa54b9302f29df902035efcb8d72aaa7e806640")
survey = Survey.new(style: 1, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://media.pitchfork.com/photos/5b0c19c6854e0425f159fee3/2:1/w_2560%2Cc_limit/Lonely-Island.jpg")
survey = Survey.new(style: 1, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://cdn.vox-cdn.com/thumbor/u8UXeCOdIEKn3QTk_yKgQGvtGzs=/524x615:2091x1625/1200x800/filters:focal(1169x1027:1537x1395)/cdn.vox-cdn.com/uploads/chorus_image/image/66699188/NUP_134212_1129.0.jpg")
survey = Survey.new(style: 1, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://www.nme.com/wp-content/uploads/2020/06/brooklyn-nine-nine.jpg")
survey = Survey.new(style: 1, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print '.'

file = URI.open("https://media.glamour.com/photos/5ebd7bfdff61267e6b09e86c/1:1/w_1217,h_1217,c_limit/friends.jpg")
survey = Survey.new(style: 1, published: true, user: User.first)
survey.photo.attach(io: file, filename: 'temp.jpg', content_type: 'image/jpg')
survey.save!
print ".\n"

puts "Created #{Survey.count} surveys"
puts "---\n"
