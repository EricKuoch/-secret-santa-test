class ApplicationMailer < ActionMailer::Base
  @event = Event.find(params[:id])
  default from: @event.user.email
  layout 'mailer'
end
