require 'erb'
require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

template_letter= File.read "letter_template.html"
erb_template = ERB.new template_letter

def normalize_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def normalize_phone_number(phone_number)
  phone_number = phone_number.to_s
  phone_number.gsub!(/\D/,'')
  return phone_number if phone_number.length == 10
  return phone_number[1..10] if phone_number[0] == 1 && phone_number.length == 11
  return "invalid number"
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_file(id,letter)
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/#{id}.html"

  File.open(filename, 'w') {|file| file.write letter } 
end



contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
registration_times = []
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = normalize_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter= erb_template.result(binding)
  
  registration_times << DateTime.strptime(row[:regdate], "%m/%d/%y %H:%M")


  puts normalize_phone_number(row[:homephone])

  save_file(id, form_letter)
end

stats = {hours: Hash.new(0), weekday: Hash.new(0)}
registration_times.each do |time|
  hour = time.strftime("%H")
  weekday = time.strftime("%A")
  stats[:hours][hour] += 1 
  stats[:weekday][weekday] += 1 
end


hours_stats = stats[:hours].sort_by { |key, value| value}.reverse.to_h
weekday_stats = stats[:weekday].sort_by { |key, value| value}.reverse.to_h

puts "=" * 30
puts "BEST HOURS:"
puts hours_stats
puts "=" * 30
puts "BEST weekdays:"
puts weekday_stats
