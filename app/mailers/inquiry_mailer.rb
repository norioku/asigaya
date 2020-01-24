class InquiryMailer < ApplicationMailer

	def send_mail(inquiry)
		@inquiry = inquiry;
		mail(
		subject: "【あしたは阿佐ヶ谷】お問い合わせ回答",
		to: inquiry.email,
		from: "ENV['Email_name']"
		)
	end
end
