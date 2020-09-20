# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    @event = Event.find(params[:id])
    UserMailer.welcome
    user = User.first
    UserMailer.with(user: user).welcome
  end

end
