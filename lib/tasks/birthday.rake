require 'date'
desc "Print birthdays"
task birthday: :environment do
  byebug
  #@user = c.email
  #puts current_user.email 
  # @user = User.last.email
  # byebug
  # puts @user
  @users = User.where(birthday: Date.today.strftime())
   @users.each do |user|
    byebug
    UserMailer.welcome_email(user.id).deliver_now
    puts "today is my birthday"
    puts user.email 
   end   
  #Rake::Task["apple"].execute
end


