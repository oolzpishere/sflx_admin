class CustomerMailer < ApplicationMailer

  def crequest(attributes)
    @attributes = attributes
    mail(to: "oolzpishere@126.com",
      subject: "sflx.com.cn: \'#{attributes['name']}\'发来新需求")
  end
end
