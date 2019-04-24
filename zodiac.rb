#Zodiac.rb
%w{colorize zodiac httparty tty-prompt ./api.rb ./module.rb}.each { |x| require x }

prompt = TTY::Prompt.new    #initiate tty-prompt class

date, month, year = Zodiac::get_user_dob(prompt) # this method prompt user and return date,month,year resp.

zodiac = Zodiac::get_wzodiac(date, month, year)
puts(Utility::random_color("\nYour Zodiac is ") + Utility::random_color(zodiac).underline.bold)

choice = ""

while (choice != "quit")
  choice = prompt.select("\nWhat whould you like to know about your " +
                         "#{zodiac}".green + "\nPlease select?".blue,
                         %w( Learn MatchZodiac Horoscope ChineseZodiac quit ))
  case choice
  when "Learn"
    Zodiac::learn_zodiac(zodiac, prompt)
  when "MatchZodiac"
    Zodiac::match_zodiac(zodiac, prompt)
  when "Horoscope"
    puts("Coming Soon")
  when "ChineseZodiac"
    puts("Chinese Zodiac : " + Zodiac::get_czodiac(year).yellow)
  when "quit"
    break
  end
end
