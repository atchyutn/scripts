require 'rubygems'
require 'json'
require 'google_calendar'

content = File.read('credentials.json')

parsed = JSON.parse(content)

client_id = parsed['client_id']
client_secret = parsed['client_secret']
calendar = parsed['calendar']
refresh_token = parsed['refresh_token']

# Create an instance of the calendar.
cal = Google::Calendar.new(:client_id     => client_id,
                           :client_secret => client_secret,
                           :calendar      => calendar,
                           :redirect_url  => "urn:ietf:wg:oauth:2.0:oob" # this is what Google uses for 'applications'
                           )

=begin

#for refresh token uncomment below lines

puts "Visit the following web page in your browser and approve access."
puts cal.authorize_url
puts "\nCopy the code that Google returned and paste it here:"
=end

cal.login_with_refresh_token(refresh_token)

event = cal.create_event do |e|
  e.title = 'A Cool Event'
  e.location = 'Adroitent'
  e.description = ''
  e.start_time = Time.now
  e.end_time = Time.now + (60 * 60 * 60)
end

puts event