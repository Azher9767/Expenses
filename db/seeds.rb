# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
category = Category.create(name: "restaurant")
Category.create(name: "jashan", parent_id: category.id)
Category.create(name: "swiggy", parent_id: category.id)
Category.create(name: "tea", parent_id: category.id)
Category.create(name: "zomato", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "shopping")
Category.create(name: "amazone", parent_id: category.id)
Category.create(name: "flipkart", parent_id: category.id)
Category.create(name: "mintra", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "entertainment")
Category.create(name: "multiplex", parent_id: category.id)
Category.create(name: "hot star", parent_id: category.id)
Category.create(name: "netflix", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "medical")
Category.create(name: "hospital", parent_id: category.id)
Category.create(name: "pharmacy", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)


category = Category.create(name: "travel")
Category.create(name: "irctc", parent_id: category.id)
Category.create(name: "air", parent_id: category.id)
Category.create(name: "ola", parent_id: category.id)
Category.create(name: "ober", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "utility")
Category.create(name: "electricity", parent_id: category.id)
Category.create(name: "gas", parent_id: category.id)
Category.create(name: "maintenance", parent_id: category.id)
Category.create(name: "mobile", parent_id: category.id)
Category.create(name: "insurance", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "petrol")
Category.create(name: "petrol", parent_id: category.id)

category = Category.create(name: "grocery")
Category.create(name: "fruit", parent_id: category.id)
Category.create(name: "dudaram", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "personal")
Category.create(name: "bike", parent_id: category.id)
Category.create(name: "insurance", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "project")
Category.create(name: "midjourney", parent_id: category.id)
Category.create(name: "digitalocean", parent_id: category.id)
Category.create(name: "salary", parent_id: category.id)
Category.create(name: "coworking", parent_id: category.id)
Category.create(name: "others", parent_id: category.id)

category = Category.create(name: "others")





