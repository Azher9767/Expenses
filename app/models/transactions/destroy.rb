module Transactions
  class Destroy
    def initialize(transaction, params)
      @transaction = transaction
      @params = params
    end

    def call
      deleted = transactions.delete_at(index)
      transaction.update(data: report_json.to_json)
    end

    private

    attr_reader :transaction, :params

    delegate :data, to: :transaction

    def index
      params[:index].to_i
    end

    def category
      params[:category]
    end

    def sub_category
      params[:sub_category]
    end

    def transactions
      @transactions ||= if category == "others"
        report_json[category]
      else
        report_json[category][sub_category]  
      end
    end

    def report_json
      @report_json ||= JSON.parse(data)
    end
  end
end
