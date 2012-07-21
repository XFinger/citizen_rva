ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "citizen.rva.com",
  :user_name            => "xfinger",
  :password             => "nextfinger",
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :content_type => "text/html"
}
 