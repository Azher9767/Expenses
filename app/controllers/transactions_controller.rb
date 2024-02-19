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
    require 'csv'
    @result = []
    CSV.foreach((params[:csv_file]), headers: true, col_sep: ",") do |row|
      @result << row
    end
    transaction_analyzer = TransactionAnalyzer.new(@result).process
    transaction = Transaction.new(data: transaction_analyzer.to_json)
   
    if  transaction.save
      redirect_to transaction
    end
  #  else
  #   render :new
  end

  private 

  def transaction_params
    params.require(:transaction).permit(:data, :csv_file)
  end
end