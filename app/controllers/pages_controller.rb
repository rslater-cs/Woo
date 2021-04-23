class PagesController < ApplicationController
  def home
  end

  def about_us
  end

  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    
    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      # Send an email
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    redirect_to root_path
  end

end
