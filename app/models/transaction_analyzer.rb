class TransactionAnalyzer
  def initialize(result)
    @transactions = result
    @result = {
      petrol: 0,
      restaurant: 0,
      grocery: 0,
      shopping: 0,
      utility: 0,
      medical:  0,
      entertainment: 0,
      others: 0 
    }
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
    result['others'].each do |transaction|
    end
  end

  private 
  
  def categorized_transactions
    @transactions.map do |row| 
      row = row.to_h
      row.merge!(category: nil, sub_category: nil)
      item = row["Narration"].split("-").last
      item = item.downcase
      categories.each do |key, val|
        if key == item 
          row[:category] = item
          row[:sub_category] = "others"
        elsif val.keys.include?(item)
          row[:category] = key
          row[:sub_category] = item
        elsif row[:category].nil? || row[:sub_category].nil?
          row[:category] = key
        end
      end 
      row

    end.group_by do |transaction|
      transaction[:category] 
    end
  end
  
  def categories
    @categories ||= Category.default_response
  end
end
