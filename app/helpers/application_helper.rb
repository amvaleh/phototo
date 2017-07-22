module ApplicationHelper

  require "uri"
	require 'net/http'

  def send_sms(to,message)
    # if Rails.env.production?
    pass = "smspanel810190501"
    # differentiate hamrAhe avval and others :
    paramz = {}
    reciept = to
    if reciept[0] == "0"
      reciept.slice(0)
    end
    isdn = '+98' + reciept.to_s
    # encoded = URI.encode("https://bulksms.vsms.net/eapi/submission/send_sms/2/2.0?username=amvaleh&password=bulksms810190501&message=#{message}&msisdn=#{isdn}")
    # result = Net::HTTP.post_form(URI.parse(encoded),paramz)
    #
    # if Rails.env.production?
      result = Net::HTTP.get(URI.parse(URI.encode("http://smspanel.Trez.ir/SendMessageWithUrl.ashx?Username=arcasimap&Password=#{pass}&PhoneNumber=9830008632000014&MessageBody=#{message}&RecNumber=#{to}&Smsclass=1")))
    # end

    # soon, sending notifs through telegram
    # telegram_result = send_telegram_msg(isdn,message)
    return result
    # end
  end
end
