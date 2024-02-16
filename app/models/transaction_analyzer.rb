
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

  CATEGORY = {
    petrol: {},
    restaurant: {tea: [], swiggy: [], zomato: [], others: []},
    grocery: {},
    shopping: {amazone: [], flipkart: [], mintra: [], others: []},
    entertainment: {netflix: [], others: []},
    utility: { electricity: [], maintenance: [], mobile: [], gas: [], others: []},
    medical: {hospital: [], pharmacy: [], others: []},
    others: {}
  }

  def process
    categorized_transactions
  end

  # def total_amount
  #   categorized_transactions.group_by do |transaction|
  #     if transaction[:category] || transaction[:sub_category]
  #       key = transaction[:category].to_s   
  #       @result[key.to_sym] += transaction["Withdrawal Amt."].to_f
  #     # elsif !transaction[:category].nil?
  #     #   @result[:others] += transaction["Withdrawal Amt."].to_f
  #     end
  #   end
  #   @result
  # end

  private 
  
  def categorized_transactions
    @transactions.map do |row| 
      row = row.to_h
      row.merge!(category: nil, sub_category: nil)
     
      item = row["Narration"].split("-").last
      item = item.downcase.to_sym
      CATEGORY.each do |key, val|
        if key == item 
          row[:category] = item
          row[:sub_category] = "others"
        elsif val.keys.include?(item)
          row[:category] = key
          row[:sub_category] = item
        end
      end 
      row
    end.group_by do |transaction|
      transaction[:category] 
    end
  end
end