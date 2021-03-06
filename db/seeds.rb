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
  json = JSON.parse(File.read(File.join(path, file)))
  hits = json["hits"]
  category = json["q"]
  hits.each_with_index do |hit, index|
    recipe_hash = {
      name: hit["recipe"]["label"],
      category: category,
      url: hit["recipe"]["url"],
      energy: hit.dig("recipe", "totalNutrients", "ENERC_KCAL", "quantity"),
      carbs: hit.dig("recipe", "totalNutrients", "CHOCDF", "quantity"),
      fat: hit.dig("recipe", "totalNutrients", "FAT", "quantity"),
      protein: hit.dig("recipe", "totalNutrients", "PROCNT", "quantity"),
      data: hit
    }
    recipe_created = Recipe.create(recipe_hash)
    if recipe_created.save
      puts "#{index + 1}. Recipe \"#{recipe_created.name}\" created"
    else
      puts "#{index + 1}. Recipe \"#{recipe_created.name}\" skipped"
    end
  end
end
