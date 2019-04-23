%w{colorize zodiac}.each { |x| require x }

puts("Enter Date of birth (eg. 23/09/1994)")
user_dob = gets().strip

arr = user_dob.split("/")
# arr.map { |x| x = x.to_i }
#1901 +
puts(DateTime.new(arr[2].to_i, arr[1].to_i, arr[0].to_i).zodiac_sign.to_s)

chinese = [[1909, "Rooster"], [1910, "Dog"],
           [1911, "Pig"], [1912, "Rat"],
           [1901, "Ox"], [1902, "Tiger"],
           [1903, "Rabbit"], [1904, "Dragon"],
           [1905, "Snake"], [1906, "Horse"],
           [1907, "Goat"], [1908, "Monkey"]]

chinese.each { |item|
  result = (item[0] - arr[2].to_i) % 12
  if (result == 0)
    puts(item[1])
  end
}
