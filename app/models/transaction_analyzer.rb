class TransactionAnalyzer
  def initialize(result)
    @transactions = result
  end

  def process
    result = {}
    categorized_transactions.each do |key, value|
      if key == "others"
        result[key] = value
      else
        result[key] = value.group_by { |v1| v1[:sub_category] }
      end
    end
    result
  end

  private

  def categorized_transactions
    @transactions.map do |row|
      row = row.to_h
      next if !row['Deposit Amt.'].nil? && row['Withdrawal Amt.'].nil?

      categories.except('others').each do |category, sub_categories|
        subs = sub_categories.keys.map(&:upcase).join('|')
        if subs.present?
          final_regex = "#{category.upcase}|#{subs}"
        else
          final_regex = "#{category.upcase}"
        end

        if row['Narration'].match?(%r{#{final_regex}})
          row[:category] = category
          row[:sub_category] = get_sub_category(row['Narration'], sub_categories) || 'others'
        elsif row[:category].nil?
          row[:category] = 'others'
          row[:sub_category] = nil
        end
      end
  
      row
    end.compact!.group_by do |t|
      t[:category]
    end
  end 

  def get_sub_category(narration, sub_categories)
    sub_categories.keys.find { |sub| narration.match?(%r{#{sub.upcase}}) }
  end
  
  def categories
    @categories ||= Category.default_response
  end
end
