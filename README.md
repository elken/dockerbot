dockerbot
=========

A (very) small ruby app that I designed to email you RE: docker pushes, but it can easily be used to just email you any form of JSON. My knowledge of Ruby is EXTREMELY minimal, and as such, this is very hacked together. Nevertheless, it works. Feel free to submit pull requests to make it better.

Setup:

1. Well, obviously, you need a place to capture the hooks. If you don't have one already, I recommend [Digital Ocean](https://www.digitalocean.com/?refcode=065a2af49fd4), very fast & very cheap rates, even hourly.

2. Download and unzip [ngrok](https://dl.ngrok.com/linux_386/ngrok.zip)

3. Run `<path_to_ngrok>/ngrok 4567` in a screen/tmux session

4. Note down the "\*.ngrok.com" url you get

5. Fill in your details in dockerbot.rb

6. `bundle install`

7. `ruby dockerbot.rb`

8. Go to `https://index.docker.io/u/<user_name>/<repo_name>/settings/webhooks/` and add your *.ngrok.com address with `/payload`, or whatever you changed in dockerbot.rb

9. Click "Test" to have a test request sent

10. Profit.
