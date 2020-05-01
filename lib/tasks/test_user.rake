namespace :test_user do
  task create: :environment do
    ActiveRecord::Base.transaction do
      user = User.create!(name: "tester", email: "a@gmail.com", password: "password")
      Status.create(automation: 10, imagination: 9, humor: 8, enhancement: 7, user_id: user.id)
      Avatar.create(filename: "default-avatar.png", image: File.read("#{Rails.root}/app/assets/images/avatars/default-avatar.png"), filetype: "image/png", user_id: user.id)
      20.times do |i|
        Command.create(title: "test_command#{i}", description: "thisistest#{i}", user_id: user.id, genre_id: Genre.first.id, command_type_id: CommandType.first.id)
      end
    end
      puts "test user successfully created"
    rescue => e
      puts e.message
      puts "[failed] closing ..."
  end
end
