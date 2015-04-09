class HomeController < ApplicationController

  def index
    flash[:notice] = ""
    flash[:error] = ""
    render :layout => 'application'
  end

  def send_sms
    summer_phone_number = SummerPhoneNumber.new(:phone_number => params[:phone_no])
    if summer_phone_number.save
      phone_number = "91#{params[:phone_no]}"
      content = SmsContent.first.content
      sms_sent_count = SummerPhoneNumber.where('phone_number = ? and trunc(created_at) = ?', params[:phone_no], Time.zone.today).count
      notice = ""
      if sms_sent_count < 3
        Exotel::Sms.send(:from => Settings.exotel_number, :to => phone_number, :body => content)
        flash[:notice] = "You'll receive a SMS"
      else
        flash[:notice] = "We already sent you an SMS. Try Tomorrow!"
      end
      flash[:error] = ""
      render :action => "index", :notice=> flash[:notice]
    else
      flash[:notice] = ""
      flash[:error] = summer_phone_number.errors.messages[:phone_number]
      render :action => "index", :error => flash[:error]
    end
  end

end
