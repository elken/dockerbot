require 'sinatra'
require 'json'
require 'mail'
require 'date'

# Please change everything in < > and don't complain to me about those errors.

# Options hash table for Mail
options = { 
		:address	      => "<smtp address>",   # This can be localhost if you use a local SMTP server
		:port		      => <port_number>,      # Again, this can be whatever you use
		:domain		      => '<address_domain>', # Domain of your email "gmail.com", "hotmail.co.uk", etc
		:user_name	      => '<username>', 	     # Whatever you use to login to access your mailbox
		:password	      => '<password>',       # The password to said mailbox
		:authentication       => 'plain',            # How your SMTP server authenticicates
		:enable_starttls_auto => true                # Use StartTLS automagically
}

# Assign the options to the object
Mail.defaults do
  delivery_method :smtp, options
end

# Use sinatra to listen for a request
post '<url>' do
  push = JSON.parse(request.body.read)
  
  # Optional line for debugging the request
  # An example reference request is located on the webhooks page
  # puts "#{push.inspect}"
  
  # Compose and send email
  Mail.deliver do
    to '<recipient>'
    from '<sender>'
    subject '<subject>'
    body "Your repository \"#{push["repository"]["repo_name"]}\" was pushed by #{push["push_data"]["pusher"]} at #{Time.at(push["push_data"]["pushed_at"]).utc}." 
  end
end
