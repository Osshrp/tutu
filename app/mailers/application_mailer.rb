class ApplicationMailer < ActionMailer::Base
  default from: 'tutu_app@heroku.com'
  layout 'mailer'
end
