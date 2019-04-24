#module.rb
module Zodiac

  ##take date,month,year as arg and return western zodiac(String)
  def self.get_wzodiac(date, month, year)
    zodiac = DateTime.new(year, month, date).zodiac_sign.to_s
    return zodiac
  end

  ##take year as arg and return chinese zodiac(String)
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

  ##prompt user and return date month and year respectively
  def self.get_user_dob(prompt)
    x = true
    while (x)
      begin
        x = false
        user_dob = prompt.ask("Enter Date of birth (eg. 23/09/1994)", convert: :date)
      rescue
        puts("Error".red.bold.underline + " Please Enter valid Date format (eg.01/12/2012)\n\n".light_red)
        x = true
      end
    end
    return user_dob.strftime("%d").to_i, user_dob.strftime("%m").to_i, user_dob.strftime("%Y").to_i
  end

  ##loop system for learn zodiac
  #require api connection
  def self.learn_zodiac(zodiac, prompt)
    get_zodiac_api(zodiac) ? res = get_zodiac_api(zodiac) : return
    choice = ""
    while (choice != "back")
      sel = ["Famous People who have same Zodiac",
             "how_to_spot", "secret_wish", "hates", "good_traits",
             "bad_traits", "favorites", "compatibility", "element", "back"]
      choice = prompt.select("Learn?".blue, sel)
      if (choice == "back")
        break
      elsif (choice == "Famous People who have same Zodiac")
        puts("#{choice} : " + res["famous_people"][0..5].join(",").green + "\n\n")
      else
        if (res[choice].is_a? String)
          puts("#{choice} : " + res[choice].green + "\n\n")
        else
          puts("#{choice} : " + res[choice].join(",").green + "\n\n")
        end
      end
    end
  end

  def self.match_zodiac(zodiac, prompt)
    puts("Enter Partner Zodiac")
    date, month, year = self.get_user_dob(prompt)
    zodiac_partner = Zodiac::get_wzodiac(date, month, year)
    res = get_zodiac_api(zodiac)
    res["compatibility"].each { |zodiac_com|
      if (zodiac_partner == zodiac_com.strip())
        puts("You are compatible!!!".yellow)
        return
      end
    }
    puts("You are not compatible!!!".red)
  end
end

module Utility

  ##take string as arg and return random color of that string
  def self.random_color(string)
    arr = string.split("")
    arr.map! { |str|
      num = Random.rand(1...6)
      case num
      when 1
        str = str.red
      when 2
        str = str.light_blue
      when 3
        str = str.green
      when 4
        str = str.magenta
      when 5
        str = str.yellow
      when 6
        str = str.cyan
      when 7
        str = str.light_green
      end
    }
    return arr.join("")
  end
end
