class CategoryAnalyzer 
  def initialize(data)
    @data = data
  end

  def expenses_per_subcategory
    total = {}
    
    @data.each do |category, sub_categories|
      total[category] = {}
      if category == "others"
        total[category] = sub_categories.sum {|t| t["Debit Amount"].to_f}.round(2)
      else
        sub_categories.each do |sub_category, transactions|
          next unless transactions
          
          total[category][sub_category] = transactions.sum {|t| t["Debit Amount"].to_f}.round(2)
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
        result[category] = sub_categories.sum {|(k, v)| v}.round(2)
      end
    end
    result.sort_by {|k, v| v}.reverse.to_h
  end
end
