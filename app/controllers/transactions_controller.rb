class TransactionsController < ApplicationController 
  def index
    @transactions = Transaction.all
  end

  def show 
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @transaction.data }
    end
  end

  def edit
    # @category = params[:category]
    @category_name = params[:category]
    @transaction = Transaction.find(params[:id]) 
    parse = JSON.parse(@transaction.data)
    @transaction_data = parse[@category_name]
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

  # def update
  #   @transaction = Transaction.find(params[:id])
  #   if @transaction.update(transaction_params)
  #     redirect_to @transaction, notice: 'Transaction was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  def change_categories
    @transaction = Transaction.find(params[:id])
    category_name = params[:category]
    transaction_json_data = JSON.parse(@transaction.data)
    category = transaction_json_data[category_name]
    sub_category = params[:sub_category]
    sub_category_data = category[sub_category]
    index = params[:index].to_i
    @object_data = sub_category_data[index] 
  end

  private 

  def transaction_params
    params.require(:transaction).permit(:data, :csv_file)
  end
end
