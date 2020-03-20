require 'rest-client'
require 'json'

path = "recipes"
query = "burger"

m = 0
n = 99

url = "https://www.edamam.com/search?q=#{query}&health=vegan&from=#{m}&to=#{n}"
data = RestClient.get(url)
count = JSON.parse(data)["count"]

puts "No. of recipes: #{count}"

File.open(File.join(__dir__, path, "#{query}_#{m}_to_#{n}.json"), "w+") do |f|
  f.write(data)
  puts "Saved file #{f.path}"
end

if count > 99
  m += 100
  n += 100
  while m < count
    url = "https://www.edamam.com/search?q=#{query}&health=vegan&from=#{m}&to=#{n}"
    data = RestClient.get(url)
    File.open(File.join(__dir__, path, "#{query}_#{m}_to_#{n}.json"), "w+") do |f|
      f.write(data)
      puts "Saved file #{f.path}"
    end
    m += 100
    n += 100
  end
end
