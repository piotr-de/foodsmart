# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

path = File.join(Rails.root, "static/recipes")
files = []

puts "Opening #{path}..."

i = 1

Dir.foreach(path) do |file|
  next unless file.include?(".json")
  files << file
  print "#{i}..."
  i += 1
end

puts "\nFiles read"

files.sort!

puts "Files sorted"

files.each_with_index do |file, index|
  puts "#{index + 1}. Parsing #{file}..."
  json = File.read(File.join(path, file))
  hits = JSON.parse(json)["hits"]
  hits.each do |hit|
    recipe_created = Recipe.create(name: hit["recipe"]["label"], url: hit["recipe"]["url"], data: hit)
    if recipe_created.save
      puts "Recipe \"#{recipe_created.name}\" created"
    else
      "Recipe skipped"
    end
  end
end
