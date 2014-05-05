require 'sinatra'
require 'json'
require 'mail'
require 'date'

options = { 
		:address	      => "smtp.gmail.com",
		:port		      => 587,
		:domain		      => 'gmail.com',
		:user_name	      => '<username>',
		:password	      => '<password>',
		:authentication       => 'plain',
		:enable_starttls_auto => true
}

Mail.defaults do
  delivery_method :smtp, options
end

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
  Mail.deliver do
    to '<recipient>'
    from '<sender>'
    subject '<subject>'
    body "Your repository \"#{push["repository"]["repo_name"]}\" was pushed by #{push["push_data"]["pusher"]} at #{Time.at(push["push_data"]["pushed_at"]).utc}." 
  end
end
