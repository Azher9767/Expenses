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

  # update transaction will do 3 things: 
  # 1. delete transaction from the old address(old category and old sub category).
  # 2. update category and subcategory of the deleted transaction.
  # 3. move updated transaction to new address(new category and new subcategory).
  # then update the transaction in the database.    
  def update_transaction
    @report = Transaction.find(params[:id])
    report_json = JSON.parse(@report.data)
    
    old_category = params[:old_category]
    old_subcategory = params[:old_subcategory]
    new_category = params[:new_category]
    new_subcategory = params[:new_subcategory]

    new_category_name = Category.find(new_category).name
    new_subcategory_name = Category.find(new_subcategory).name
    
    transactions = report_json[old_category][old_subcategory]  

    index = params[:index].to_i
    deleted = transactions.delete_at(index)
    
    deleted["category"] = new_category_name
    deleted["sub_category"] = new_subcategory_name

    report_json[new_category_name] ||= {} 
    report_json[new_category_name][new_subcategory_name] ||= []
    report_json[new_category_name][new_subcategory_name] << deleted

    @report.update(data: report_json.to_json)

    #transactions/1/change_categories?category=grocery&index=0&sub_category=dudaram <<-- this is query params in URl
    redirect_to change_categories_transaction_path(@report, category: new_category_name, sub_category: new_subcategory_name, index: -1)
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
