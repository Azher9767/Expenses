RSpec.describe TransactionAnalyzer do
  # let(:csv_data) do
  #   require 'csv'
  #   result = []
  #   CSV.foreach(('spec/fixtures/expenses_data.csv'), headers: true, col_sep: ",") do |row|
  #     result << row
  #   end
  #   result
  # end

  
  let(:restaurant_transaction) do
    {
      "Date" => "02/11/23",
      "Narration" => "UPI-SAMADHAN BHEL-GPAY-11180273639@OKBIZAXIS-UTIB0000000-330620519772-RESTAURANT",
      "Chq./Ref.No." => "330620519772",
      "Value Dt" => "02/11/23",
      "Withdrawal Amt." => "100",
      "Deposit Amt." => nil
    }
  end

  let(:tea_transaction) do
    {
      "Date" => "01/11/23",
      "Narration" => "UPI SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-TEA",
      "Chq./Ref.No." => "330584993568",
      "Value Dt" => "01/11/23",
      "Withdrawal Amt." => "25",
      "Deposit Amt." => nil
    }
  end

  let(:deposit_transaction) do
    {
      "Date" => "02/11/23",
      "Narration" => "UPI-AHMADHAMZA19@OKAXIS-U330653149714-SAVINGS",
      "Chq./Ref.No." => "330653149714",
      "Value Dt" => "02/11/23",
      "Withdrawal Amt." => nil,
      "Deposit Amt." => "1000"
    }
  end


  let(:uncategorized_transaction) do
    {
      "Date" => "04/11/23",
      "Narration" => "UPI-ANITA HARIDAS KATAKE-PAYTMQRFB8AGGMMP4@PAYTM-PYTM0123456-330892207107-UPI",
      "Chq./Ref.No." => "330892207107",
      "Value Dt" => "04/11/23",
      "Withdrawal Amt." => "40",
      "Deposit Amt." => nil
    }
  end

  # Mocking
  let(:csv_data) do
    require 'csv'
    [
      instance_double(CSV::Row, to_h: tea_transaction),
      instance_double(CSV::Row, to_h: uncategorized_transaction),
      instance_double(CSV::Row, to_h: restaurant_transaction),
      instance_double(CSV::Row, to_h: deposit_transaction)
    ]
     
  end

  let(:response) do
    {
      "restaurant"=>{"jashan"=>[], "swiggy"=>[], "tea"=>[], "zomato"=>[], "others"=>[]},
      "shopping"=>{"amazone"=>[], "flipkart"=>[], "mintra"=>[], "others"=>[]},
      "entertainment"=>{"multiplex"=>[], "hot star"=>[], "netflix"=>[], "others"=>[]},
      "medical"=>{"hospital"=>[], "pharmacy"=>[], "others"=>[]},
      "travel"=>{"irctc"=>[], "air"=>[], "ola"=>[], "ober"=>[], "others"=>[]},
      "utility"=>{"electricity"=>[], "gas"=>[], "maintenance"=>[], "mobile"=>[], "insurance"=>[], "others"=>[]},
      "petrol"=>{"petrol"=>[]},
      "grocery"=>{"fruit"=>[], "dudaram"=>[], "others"=>[]},
      "personal" => {"bike" => [], "insurance" => [], "others" =>[]},
      "project" => {"midjourney"=>[], "digitalocean" => [], "salary" => [],"coworking" =>[], "others" =>[]},
      "others"=>{}
    }
  end

  # before do
  #   category = Category.create(name: "restaurant")
  #   Category.create(name: "jashan", parent_id: category.id)
  #   Category.create(name: "swiggy", parent_id: category.id)
  #   Category.create(name: "tea", parent_id: category.id)
  #   Category.create(name: "zomato", parent_id: category.id)
  #   Category.create(name: "others", parent_id: category.id)

  #   category = Category.create(name: "others")
  # end

  # Stubbing
  before do
    allow(Category).to receive(:default_response).and_return(response)
  end

  xit "read csv data and verify category and sub category" do
    analyzer = described_class.new(csv_data)
    expect(analyzer.process).to eq(
      "others" => [uncategorized_transaction.merge!(:category=>"others", :sub_category=>nil)],
      "restaurant" => {
        "tea"=>[tea_transaction.merge!(:category=>"restaurant",:sub_category=>"tea")],
        'others' => [restaurant_transaction.merge!(:category=>"restaurant",:sub_category=> "others")]
      }
    )
  end

  xit "expenses per sub_category" do 
    analyzer = described_class.new(csv_data)
    expect(analyzer.expenses_sub_category).to eq({"others"=>{nil=>40.0}, "restaurant"=>{"others"=>100.0, "tea"=>25.0}})
  end

  it "expenses per category" do 
    analyzer = described_class.new(csv_data)
    expect(analyzer.expenses_category).to eq({"others"=>40, "restaurant"=>125})
  end
end
