class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id"
  accepts_nested_attributes_for :subcategories
  validates :name, presence: true

  scope :main, -> {where(parent_id: nil)}

  def self.default_response 
    response = {}
    main.each do |parent|
      response[parent.name] = {}
      parent.subcategories.each do |sub_category|
        response[parent.name][sub_category.name] = []
      end 
    end
    response
  end
end
