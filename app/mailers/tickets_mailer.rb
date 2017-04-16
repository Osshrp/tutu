class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: default_i18n_subject)
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: default_i18n_subject)
  end
end
