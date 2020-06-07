chase = User.create!(username: 'chase', email: 'chase@chase.com', password: 'password', password_confirmation: 'password')
kate = User.create!(username: 'kate', email: 'kate@kate.com', password: 'password', password_confirmation: 'password')
emilia = User.create!(username: 'emilia', email: 'emilia@emilia.com', password: 'password', password_confirmation: 'password')
x = User.create!(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

chase.posts.create(content: "chase post 1")
kate.posts.create(content: "kate post 1")
emilia.posts.create(content: "emilia post 1")



chase.posts.create(content: "chase post 2")
kate.posts.create(content: "kate post 2")
emilia.posts.create(content: "emilia post 2")

chase.posts.create(content: "chase post 3")
kate.posts.create(content: "kate post 3")
emilia.posts.create(content: "emilia post 3")