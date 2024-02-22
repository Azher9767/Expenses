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
    analyzer do |category, sub_categories, total|
      sub_categories.each do |sub_category, transactions|
        next unless transactions

        total[category] = transactions.sum {|t| t["Withdrawal Amt."].to_f}
      end
    end
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
