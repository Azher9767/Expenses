module Transactions
  # update transaction will do 3 things:
  # 1. delete transaction from the old address(old category and old sub category).
  # 2. update category and subcategory of the deleted transaction.
  # 3. move updated transaction to new address(new category and new subcategory).
  # then update the transaction in the database.
  class Update
    def initialize(transaction, params, new_category, new_subcategory)
      @transaction = transaction
      @params = params
      @new_category = new_category
      @new_subcategory = new_subcategory
    end

    def call
      deleted = transactions.delete_at(index)
      deleted["category"] = new_category
      deleted["sub_category"] = new_subcategory
      
      report_json[new_category] ||= {}
      report_json[new_category][new_subcategory] ||= []
      report_json[new_category][new_subcategory] << deleted

      transaction.update(data: report_json.to_json)
    end

    private

    attr_reader :transaction, :params, :new_category, :new_subcategory

    delegate :data, to: :transaction

    def old_category
      params[:old_category]
    end

    def old_subcategory
      params[:old_subcategory]
    end

    def index
      params[:index].to_i
    end

    def transactions
      @transactions ||= if old_category == "others"
        report_json[old_category]
      else
        report_json[old_category][old_subcategory]  
      end
    end

    def report_json
      @report_json ||= JSON.parse(data)
    end
  end
end
