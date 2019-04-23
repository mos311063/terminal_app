module Zodiac
  def self.get_czodiac(year)
    chinese = [[1909, "Rooster"], [1910, "Dog"],
               [1911, "Pig"], [1912, "Rat"],
               [1901, "Ox"], [1902, "Tiger"],
               [1903, "Rabbit"], [1904, "Dragon"],
               [1905, "Snake"], [1906, "Horse"],
               [1907, "Goat"], [1908, "Monkey"]]
    ch_zodiac = ""
    chinese.each { |item|
      result = (item[0] - year) % 12
      if (result == 0)
        ch_zodiac = item[1]
        return ch_zodiac
      end
    }
  end

  def self.get_user_dob()
    puts("Enter Date of birth (eg. 23/09/1994)")
    user_dob = gets().strip
    arr = user_dob.split("/")
    arr = arr.map { |x| x = x.to_i }
    return arr[0], arr[1], arr[2]
  end

  def self.get_wzodiac(year)
    zodiac = DateTime.new(year, month, date).zodiac_sign.to_s
    return zodiac
  end
end
