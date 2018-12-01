class CustomerMailer < ApplicationMailer

  def welcome
    mail(to: "oolzpishere@126.com",
      subject: "Welcome Page.")
  end
end
