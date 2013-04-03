ActionMailer::Base.smtp_settings = {
  :address              => "outgoing.verizon.net",
  :port                 => 587,
  :domain               => "citizenrva.com",
  :user_name            => "citizenrva@verizon.net",
  :password             => "Biteme69",
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :content_type => "text/html"
}
 