User.destroy_all

admin = User.create!(
              email: 'admin@test.com', 
              password: 'password', 
)