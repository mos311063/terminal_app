#Zodiac.rb
%w{colorize zodiac httparty tty-prompt ./api.rb ./module.rb}.each { |x| require x }
prompt = TTY::Prompt.new

date, month, year = Zodiac::get_user_dob()

zodiac = Zodiac::get_wzodiac(date, month, year)
puts("Your Zodiac is " + zclodiac)
puts("\nWhat whould you like to learn about your zodiac")

res = get_zodiac_api(zodiac)
choice = ""

while (choice != "quit")
  choice = prompt.select("Learn?".blue, %w(famous_people how_to_spot secret_wish chinese_zodiac quit))
  if (choice == "chinese_zodiac")
    result = Zodiac::get_czodiac(year)
    puts("\n#{choice} : " + result.yellow)
  elsif (choice == "quit")
    break
  else
    puts("\n#{choice} : " + res[0][choice].join(",").green)
  end
end
