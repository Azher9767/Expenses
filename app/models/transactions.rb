module Transactions
  module_function

  def update(transaction, params, new_category_name, new_subcategory_name)
    Update.new(transaction, params, new_category_name, new_subcategory_name).call
  end
end
