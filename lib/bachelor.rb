require 'pry'

def get_first_name_of_season_winner(data, season)
  season_data=data[season]
  winner=nil
  season_data.each do|attributes|
    if attributes["status"]== "Winner"
      winner=attributes["name"].split[0]
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  name=nil
  get_all_contestants(data).each do|attributes|
    if attributes["occupation"]==occupation
      name = attributes["name"]
    end
  end
  name
end

def get_all_contestants(data)
  all_contestants=data.values.flatten
end

def count_contestants_by_hometown(data, hometown)
  hometown_count=0
  get_all_contestants(data).each do|attributes|
    if attributes["hometown"]== hometown
      hometown_count += 1
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
  hometown_person = get_all_contestants(data).find{|attributes| attributes["hometown"]==hometown}
  hometown_person["occupation"]
end

def get_average_age_for_season(data, season)
  season_person_data=data[season]
  person_count=season_person_data.length
  total_age=0
  
  season_person_data.each{|attributes| total_age+=attributes["age"].to_f}

  (total_age/person_count).round
end
