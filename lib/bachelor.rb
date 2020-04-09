require 'pry'

def get_first_name_of_season_winner data, season
  contestants = data[season]
  winning_contestant = find_winner contestants
  winning_contestant["name"].split[0]
end

def get_contestant_name data, occupation
  contestants = get_all_contestants(data)
  matching_contestant = find_contestant_by_attribute contestants, "occupation", occupation
  matching_contestant["name"]
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

def find_winner contestants
  find_contestant_by_attribute contestants, "status", "Winner"
end

def find_contestant_by_attribute contestants, key, value
  contestants.find do |contestant|
    contestant[key] == value
  end
end

def get_all_contestants data
  data.values.flatten
end
