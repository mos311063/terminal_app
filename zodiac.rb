%w{colorize zodiac httparty io/console tty-prompt}.each { |x| require x }
prompt = TTY::Prompt.new
puts("Enter Date of birth (eg. 23/09/1994)")

user_dob = gets().strip

arr = user_dob.split("/")
arr = arr.map { |x| x = x.to_i }
zodiac = DateTime.new(arr[2], arr[1], arr[0]).zodiac_sign.to_s

chinese = [[1909, "Rooster"], [1910, "Dog"],
           [1911, "Pig"], [1912, "Rat"],
           [1901, "Ox"], [1902, "Tiger"],
           [1903, "Rabbit"], [1904, "Dragon"],
           [1905, "Snake"], [1906, "Horse"],
           [1907, "Goat"], [1908, "Monkey"]]
ch_zodiac = ""
chinese.each { |item|
  result = (item[0] - arr[2].to_i) % 12
  if (result == 0)
    ch_zodiac = item[1]
    break
  end
}
puts("Your Zodiac is " + zodiac.yellow)
puts("\nWould you like to learn about your zodiac")
# puts("Press any key to continue or press \"q\" to exit")
# ch = STDIN.getch
# if (ch == "q")
#   puts("Thank you".red)
#   puts("\n".on_black)
#   exit
# end

url = "https://zodiacal.herokuapp.com/#{zodiac}"
response = HTTParty.get(url)
res = response.parsed_response

# puts(response.parsed_response[0]["famous_people"])

choice = prompt.select("Learn?", %w(famous_people how_to_spot secret_wish))

puts("#{choice} : " + res[0][choice].join(",").green)
