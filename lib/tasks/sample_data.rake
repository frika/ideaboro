

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
  require 'faker'
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
		end
		User.all(:limit => 6).each do |user|
          50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5),
								:coreidea => "This is the core idea")
      end
    end
  end
end