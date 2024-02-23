RSpec.describe TransactionHelper do 
  let(:input_percategory) do 
    {
      "restaurant"=>300,
      "grocery"=>200,
      "entertainment"=>50, 
      "project"=>100.0,
      "petrol"=>100.0,
      "shopping"=>50,
      "utility"=>200.0
    }
  end

  let(:output_percatgory) do
    {
      "restaurant"=> 30,
      "grocery"=> 20,
      "entertainment"=> 5,
      "project"=> 10,
      "petrol"=> 10,
      "shopping"=> 5,
      "utility"=> 20
    }
  end

  let(:input_subcategory) do 
    {
      "restaurant"=>{"tea"=>100.0, "others"=>100.0, "swiggy"=>100.0},
      "grocery"=>{"dudaram"=>100.0, "others"=>50.0, "fruit"=>50.0},
      "entertainment"=>{"netflix"=>50.0},
      "project"=>{"digitalocean"=>60, "midjourney"=>20,"coworking"=>20},
      "others"=>{},
      "petrol"=>{"petrol"=>100},
      "shopping"=>{"others"=>50},
      "utility"=>{"electricity"=>200.0}
    }
  end

  let(:output_subcategory) do 
    {
    "restaurant"=>{"tea"=> 33.33, "others"=> 33.33, "swiggy"=> 33.33},
      "grocery"=>{"dudaram"=> 50.0, "others"=> 25.0, "fruit"=> 25.0},
      "entertainment"=>{"netflix"=>100.0}, 
      "project"=>{"digitalocean"=>60.0, "midjourney"=>20.0, "coworking"=>20.0},
      "others"=>{},
      "petrol"=>{"petrol"=>100.0},
      "shopping"=>{"others"=>100.0},
      "utility"=>{"electricity"=>100.0}
    }
  end

  context "Calling Transaction Helper Module" do 
    it "find percentage of categories and subcategories" do 
      expect(per_category_percentage(input_percategory)).to eq(output_percatgory)
    end

    it "find percentage of subcategories" do 
      expect( per_subcategory_percentage(input_subcategory)).to eq(output_subcategory)
    end
  end
end