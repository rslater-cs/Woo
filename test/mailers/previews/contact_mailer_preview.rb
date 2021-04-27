# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email("matthew@me.com","Matthew Casey", "1234567890", @message = "Hello")
  end

end
