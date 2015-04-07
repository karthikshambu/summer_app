class HomeController < ApplicationController

  def index
    render :layout => 'application'
  end

  def send_sms
    phone_number = "91#{params[:phone_no]}"
    content = "Checkout our Mobile App for Justbooks"
    Exotel::Sms.send(:from => Settings.exotel_number, :to => phone_number, :body => content)
    render :action => "index"
  end

end
