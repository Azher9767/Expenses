class CategoryAnalyzer 
  def initialize(data)
    @data = data
  end

  def expenses_per_subcategory
    total = {}
    
    @data.each do |category, sub_categories|
      total[category] = {}
      if category == "others"
        total[category] = sub_categories.sum {|t| t["Debit Amount"].to_f}
      else
        sub_categories.each do |sub_category, transactions|
          next unless transactions
          
          total[category][sub_category] = transactions.sum {|t| t["Debit Amount"].to_f}
        end
      end
    end
    total
  end

  def expenses_per_category
    result = {}
    expenses_per_subcategory.each do |category, sub_categories|
      result[category] = 0.0
      if category == "others"
        result[category] = sub_categories
      else
        result[category] = sub_categories.sum {|(k, v)| v}
      end
    end
    result
  end
end
