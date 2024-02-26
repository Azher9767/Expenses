class CategoryAnalyzer 
  def initialize(data)
    @data = data
  end

  def expenses_per_subcategory
    analyzer do |category, sub_categories, total|
      total[category] = {}
      sub_categories.each do |sub_category, transactions|
        next unless transactions

        total[category][sub_category] = transactions.sum {|t| t["Withdrawal Amt."].to_f}
      end
    end
  end

  def expenses_per_category
    result = {}
    expenses_per_subcategory.each do |category, sub_categories|
      result[category] = 0.0
      result[category] = sub_categories.sum {|(k, v)| v}
    end
    result
  end

  private

  def analyzer
    total = {}
    
    @data.each do |category, sub_categories|
      yield(category, sub_categories, total)
    end
    total
  end
end
