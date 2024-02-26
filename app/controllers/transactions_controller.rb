class TransactionsController < ApplicationController 
  def index
    @transactions = Transaction.all
  end

  def show 
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    csv_data = CsvProcessor.new.call(params[:csv_file])
    transaction_analyzer = TransactionAnalyzer.new(csv_data).process
    transaction = Transaction.new(data: transaction_analyzer.to_json)
    if transaction.save
      redirect_to transaction
    end
  end

  private 

  def transaction_params
    params.require(:transaction).permit(:data, :csv_file)
  end
end
