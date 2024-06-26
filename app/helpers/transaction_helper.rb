module TransactionHelper 
  def per_category_percentage(categories_amount)
    total = categories_amount.values.sum.to_f
    categories_amount.transform_values { |value| ((value/total) * 100).round(1) }
  end

  def per_subcategory_percentage(categories_with_children)
    categories_with_children.each_with_object({}) do |(category, subcategories_with_amounts), result|
      if category == "others"
        result[category] = subcategories_with_amounts
      else
        result[category] = subcategories_with_amounts.each_with_object({}) do |(sub_category, amount), subcategory_result|
          total_amount_category = subcategories_with_amounts.values.sum.to_f
          subcategory_result[sub_category] = ((amount / total_amount_category) * 100).round(2)
        end
      end
    end
  end

  def string_to_hash  
    @string_to_hash ||= JSON.parse(@transaction.data)
  end

  def per_category_hash
    CategoryAnalyzer.new(string_to_hash).expenses_per_category
  end

  def per_subcategory_hash
    CategoryAnalyzer.new(string_to_hash).expenses_per_subcategory
  end

  def main_categories
    @main_categories ||= Category.main
  end

  def td_id(category, subcategory, index)
    "#{category}_#{subcategory}_#{index}"
  end
end
