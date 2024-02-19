class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id"
  
  def self.default_response 
    response = {}
    where(parent_id: nil).each do |parent|
      response[parent.name] = {}
      parent.subcategories.each do |sub_category|
        response[parent.name][sub_category.name] = []
      end 
    end
    response
  end
end

