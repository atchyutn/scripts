require 'rubygems'
require 'google_calendar'

# Create an instance of the calendar.
cal = Google::Calendar.new(:client_id     => YOUR_CLIENT_ID,
                           :client_secret => YOUR_CLIENT_SECRET,
                           :calendar      => YOUR_CALENDAR_ID,
                           :redirect_url  => "urn:ietf:wg:oauth:2.0:oob" # this is what Google uses for 'applications'
                           )

=begin
  #for refresh token uncomment below lines

  puts "Visit the following web page in your browser and approve access."
  puts cal.authorize_url
  puts "\nCopy the code that Google returned and paste it here:"
=end

refresh_token = REFRESH_TOKEN_FROM_ABOVE_LINK

cal.login_with_refresh_token(refresh_token)

event = cal.create_event do |e|
  e.title = 'New Event'
  e.start_time = "2018-07-24 00:00:00"
  e.end_time = "2018-07-24 23:59:00"
end





