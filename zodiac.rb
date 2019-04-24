#Zodiac.rb
%w{colorize zodiac httparty tty-prompt ./api.rb ./module.rb}.each { |x| require x }

prompt = TTY::Prompt.new    #initiate tty-prompt class

date, month, year = Zodiac::get_user_dob(prompt) # this method prompt user and return date,month,year resp.

zodiac = Zodiac::get_wzodiac(date, month, year)
puts(Utility::random_color("\nYour Zodiac is ") + Utility::random_color(zodiac).underline.bold)

puts("\nWhat whould you like to know about your zodiac")
choice = ""
while (choice != "quit")
  choice = prompt.select("\nPlease Select?".yellow, %w( Learn Horoscope quit ))
  case choice
  when "Learn"
    Zodiac::learn_zodiac(zodiac, prompt)
  when "quit"
    break
  end
end
