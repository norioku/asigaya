ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	address: ENV['Email-address'],
	domain: ENV['Email_domain'],
	port: ENV['Email_port'],
	user_name: ENV['Email_name'],
	password: ENV['Email_passward'],
	authentication: 'plain',
	enable_starttls_auto: true
}