RSpec.describe CategoryAnalyzer do
  let(:input) do 
    {
      "restaurant" => {
        "tea" => [{
            "Date" => "01/11/23",
            "Narration" => "UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-330584993568-TEA",
            "Chq./Ref.No." => "330584993568",
            "Value Dt" => "01/11/23",
            "Withdrawal Amt." => "25",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "tea"
          },
          {
            "Date" => "02/11/23",
            "Narration" => "UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-330620254417-TEA",
            "Chq./Ref.No." => "330620254417",
            "Value Dt" => "02/11/23",
            "Withdrawal Amt." => "25",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "tea"
          }
        ],
        "others" => [{
            "Date" => "02/11/23",
            "Narration" => "UPI-SAMADHAN BHEL-GPAY-11180273639@OKBIZAXIS-UTIB0000000-330620519772-RESTAURANT",
            "Chq./Ref.No." => "330620519772",
            "Value Dt" => "02/11/23",
            "Withdrawal Amt." => "100",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "others"
          },
          {
            "Date" => "03/11/23",
            "Narration" => "UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-330756276221-RESTAURANT",
            "Chq./Ref.No." => "330756276221",
            "Value Dt" => "03/11/23",
            "Withdrawal Amt." => "105",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "others"
          }
        ],
        "swiggy" => [{
            "Date" => "06/11/23",
            "Narration" => "UPI-SWIGGY-SWIGGY@YESPAY-YESB0YESUPI-367685733156-DEBIT MONEY USING",
            "Chq./Ref.No." => "367685733156",
            "Value Dt" => "06/11/23",
            "Withdrawal Amt." => "285",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "swiggy"
          },
          {
            "Date" => "13/11/23",
            "Narration" => "UPI-SWIGGY-UPISWIGGY@ICICI-ICIC0DC0099-331733033435-PAYMENT FOR SWIGGY",
            "Chq./Ref.No." => "331733033435",
            "Value Dt" => "13/11/23",
            "Withdrawal Amt." => "291",
            "Deposit Amt." => nil,
            "category" => "restaurant",
            "sub_category" => "swiggy"
          }
        ]
      },
      "grocery" => {
        "dudaram" => [{
            "Date" => "01/11/23",
            "Narration" => "UPI-GANPATLAL DUDARAM-Q717392103@YBL-YESB0YBLUPI-330585209333-GROCERY",
            "Chq./Ref.No." => "330585209333",
            "Value Dt" => "01/11/23",
            "Withdrawal Amt." => "30",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "dudaram"
          },
          {
            "Date" => "03/11/23",
            "Narration" => "UPI-GANPATLAL DUDARAM-Q717392103@YBL-YESB0YBLUPI-330738545532-GROCERY",
            "Chq./Ref.No." => "330738545532",
            "Value Dt" => "03/11/23",
            "Withdrawal Amt." => "175",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "dudaram"
          }
        ],
        "others" => [{
            "Date" => "10/11/23",
            "Narration" => "UPI-VEGETABLE-GPAY-11223079753@OKBIZAXIS-UTIB0000000-331494567730-GROCERY",
            "Chq./Ref.No." => "331494567730",
            "Value Dt" => "10/11/23",
            "Withdrawal Amt." => "640",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "others"
          },
          {
            "Date" => "10/11/23",
            "Narration" => "UPI-SALIMUDDIN SEIKH-PAYTMQR2810050501011PS8D2NKXJ3E@PAYTM-PYTM0123456-331495050580-GROCERY",
            "Chq./Ref.No." => "331495050580",
            "Value Dt" => "10/11/23",
            "Withdrawal Amt." => "180",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "others"
          }
        ],
        "fruit" => [{
            "Date" => "10/11/23",
            "Narration" => "UPI-IMAM BAIG FRUIT-GPAY-11208108357@OKBIZAXIS-UTIB0000000-331405047915-GROCERY",
            "Chq./Ref.No." => "331405047915",
            "Value Dt" => "10/11/23",
            "Withdrawal Amt." => "100",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "fruit"
          },
          {
            "Date" => "17/11/23",
            "Narration" => "UPI-USMAN  FRUIT SHOP-GPAY-11186230051@OKBIZAXIS-UTIB0000000-332143400063-GROCERY",
            "Chq./Ref.No." => "332143400063",
            "Value Dt" => "17/11/23",
            "Withdrawal Amt." => "50",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "fruit"
          },
          {
            "Date" => "17/11/23",
            "Narration" => "UPI-MOHSIN FRUITS CENTRE-GPAY-11230137501@OKBIZAXIS-UTIB0000000-332143703814-GROCERY",
            "Chq./Ref.No." => "332143703814",
            "Value Dt" => "17/11/23",
            "Withdrawal Amt." => "1200",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "fruit"
          },
          {
            "Date" => "24/11/23",
            "Narration" => "UPI-USMAN  FRUIT SHOP-GPAY-11186230051@OKBIZAXIS-UTIB0000000-332875193793-GROCERY",
            "Chq./Ref.No." => "332875193793",
            "Value Dt" => "24/11/23",
            "Withdrawal Amt." => "100",
            "Deposit Amt." => nil,
            "category" => "grocery",
            "sub_category" => "fruit"
          }
        ]
      },
      "entertainment" => {
        "netflix" => [{
          "Date" => "02/11/23",
          "Narration" => "UPI-NETFLIX COM-NETFLIXUPI.PAYU@HDFCBANK-HDFC0000499-330696229236-MONTHLY AUTOPAY. C",
          "Chq./Ref.No." => "330696229236",
          "Value Dt" => "02/11/23",
          "Withdrawal Amt." => "649",
          "Deposit Amt." => nil,
          "category" => "entertainment",
          "sub_category" => "netflix"
        }]
      },
      "project" => {
        "digitalocean" => [{
          "Date" => "03/11/23",
          "Narration" => "POS 403875XXXXXX8164 DIGITALOCEAN.COM",
          "Chq./Ref.No." => "330705033749",
          "Value Dt" => "03/11/23",
          "Withdrawal Amt." => "5897.05",
          "Deposit Amt." => nil,
          "category" => "project",
          "sub_category" => "digitalocean"
        }],
        "midjourney" => [{
          "Date" => "03/11/23",
          "Narration" => "ME DC SI 403875XXXXXX8164 MIDJOURNEY INC.",
          "Chq./Ref.No." => "330710161228",
          "Value Dt" => "03/11/23",
          "Withdrawal Amt." => "832.92",
          "Deposit Amt." => nil,
          "category" => "project",
          "sub_category" => "midjourney"
        }],
        "coworking" => [{
          "Date" => "04/11/23",
          "Narration" => "UPI-XXXXXX0210-ICIC0000321-330897344611-COWORKING SPACE",
          "Chq./Ref.No." => "330897344611",
          "Value Dt" => "04/11/23",
          "Withdrawal Amt." => "4900",
          "Deposit Amt." => nil,
          "category" => "project",
          "sub_category" => "coworking"
        }]
      },
      "others" => [{
          "Date" => "03/11/23",
          "Narration" => "UPI-MASJIDAFATIMAQABRAST-9923628866@MAHB-MAHB0000175-330750506796-DONATION",
          "Chq./Ref.No." => "330750506796",
          "Value Dt" => "03/11/23",
          "Withdrawal Amt." => "500",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "03/11/23",
          "Narration" => "JULSEP23 INSTAALERTCHG 6 SMS 031023-CDT2330519988477",
          "Chq./Ref.No." => "CDT2330519988477",
          "Value Dt" => "03/11/23",
          "Withdrawal Amt." => "1.42",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "04/11/23",
          "Narration" => "UPI-AMAZON PAY-AMAZONUPI@APL-UTIB0000100-330875665041-YOU ARE PAYING FOR",
          "Chq./Ref.No." => "330875665041",
          "Value Dt" => "04/11/23",
          "Withdrawal Amt." => "1609",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "04/11/23",
          "Narration" => "UPI-ANITA HARIDAS KATAKE-PAYTMQRFB8AGGMMP4@PAYTM-PYTM0123456-330892207107-UPI",
          "Chq./Ref.No." => "330892207107",
          "Value Dt" => "04/11/23",
          "Withdrawal Amt." => "40",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "05/11/23",
          "Narration" => "UPI-KISHOR DNYNESHWAR GA-Q004346609@YBL-YESB0YBLUPI-330907399678-UPI",
          "Chq./Ref.No." => "330907399678",
          "Value Dt" => "05/11/23",
          "Withdrawal Amt." => "10",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "05/11/23",
          "Narration" => "UPI-ALYSSUM DEVELOPERS P-MAB.037322018930359@AXISBANK-UTIB0000100-330937608465-UPI",
          "Chq./Ref.No." => "330937608465",
          "Value Dt" => "05/11/23",
          "Withdrawal Amt." => "50",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "07/11/23",
          "Narration" => ".DC INTL POS TXN MARKUP+ST 121023 141023-CDT2330720043891",
          "Chq./Ref.No." => "CDT2330720043891",
          "Value Dt" => "07/11/23",
          "Withdrawal Amt." => "27.51",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "08/11/23",
          "Narration" => "UPI-MR SACHIN BALU APTE-SACHINAPTE2611@OKICICI-MAHB0001210-331250250010-WASHING",
          "Chq./Ref.No." => "331250250010",
          "Value Dt" => "08/11/23",
          "Withdrawal Amt." => "600",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "10/11/23",
          "Narration" => "UPI-JAVED ISMILE SHAIKH-BHARATPE.90067628366@FBPE-FDRL0001382-331404880910-PAY TO BHARATPE ME",
          "Chq./Ref.No." => "331404880910",
          "Value Dt" => "10/11/23",
          "Withdrawal Amt." => "100",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "11/11/23",
          "Narration" => "ME DC SI 403875XXXXXX8164 SLACK TP0GFSS03",
          "Chq./Ref.No." => "331511162736",
          "Value Dt" => "11/11/23",
          "Withdrawal Amt." => "786",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "11/11/23",
          "Narration" => "UPI-MD SAQIB-7666094679@AXL-PYTM0123456-331553456678-DONATION",
          "Chq./Ref.No." => "331553456678",
          "Value Dt" => "11/11/23",
          "Withdrawal Amt." => "100",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "11/11/23",
          "Narration" => "ME DC SI 403875XXXXXX8164 WWW.DRIFTINGRUBY.COM",
          "Chq./Ref.No." => "331513042566",
          "Value Dt" => "11/11/23",
          "Withdrawal Amt." => "751.6",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "12/11/23",
          "Narration" => "UPI-MINAL AMOL SHAH JT-BHARATPE.90055406184@FBPE-FDRL0001382-331674308152-PAY TO BHARATPE ME",
          "Chq./Ref.No." => "331674308152",
          "Value Dt" => "12/11/23",
          "Withdrawal Amt." => "242",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "12/11/23",
          "Narration" => "UPI-KRIPASHANKAR AWDHESH-PAYTMQR281005050101NDFC307ESJRB@PAYTM-PYTM0123456-331674470704-UPI",
          "Chq./Ref.No." => "331674470704",
          "Value Dt" => "12/11/23",
          "Withdrawal Amt." => "5",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "15/11/23",
          "Narration" => "UPI-MOHAMMAD FAYAZ HASHA-SFAYAZ12@OKSBI-SBIN0016380-331976851820-UPI",
          "Chq./Ref.No." => "331976851820",
          "Value Dt" => "15/11/23",
          "Withdrawal Amt." => "100",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "15/11/23",
          "Narration" => "UPI-NOVI DIGITAL ENTERTA-NOVIDIGITALENTE120.RZP@ICICI-ICIC0DC0099-331940390061-PAY VIA RAZORPAY",
          "Chq./Ref.No." => "331940390061",
          "Value Dt" => "15/11/23",
          "Withdrawal Amt." => "299",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "17/11/23",
          "Narration" => "UPI-IMPSP2APHONEPE PRIV-Q925451845@YBL-YESB0YBLUPI-332143084356-DONATION",
          "Chq./Ref.No." => "332143084356",
          "Value Dt" => "17/11/23",
          "Withdrawal Amt." => "500",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "17/11/23",
          "Narration" => "UPI-ABDULLATIF ABUTAHER-CHALISA4775-1@OKSBI-RATN0000000-332145871232-SERVICE",
          "Chq./Ref.No." => "332145871232",
          "Value Dt" => "17/11/23",
          "Withdrawal Amt." => "4000",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "20/11/23",
          "Narration" => "UPI-FARMAN   KHAN-BHARATPE90726951094@YESBANKLTD-YESB0YESUPI-332445021528-PAY TO BHARATPE ME",
          "Chq./Ref.No." => "332445021528",
          "Value Dt" => "20/11/23",
          "Withdrawal Amt." => "50",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "22/11/23",
          "Narration" => "UPI-AUDIO PALACE-EAZYPAY.574483404@ICICI-ICIC0DC0099-332608648162-HARDISK",
          "Chq./Ref.No." => "332608648162",
          "Value Dt" => "22/11/23",
          "Withdrawal Amt." => "9000",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "22/11/23",
          "Narration" => "UPI-RAJAN  SABHAMANI  SH-Q978671202@YBL-YESB0YBLUPI-332608771122-UPI",
          "Chq./Ref.No." => "332608771122",
          "Value Dt" => "22/11/23",
          "Withdrawal Amt." => "5",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "23/11/23",
          "Narration" => "UPI-RADHAKRSHNAN PARAMES-Q330010575@YBL-YESB0YBLUPI-332746022011-UPI",
          "Chq./Ref.No." => "332746022011",
          "Value Dt" => "23/11/23",
          "Withdrawal Amt." => "10",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "24/11/23",
          "Narration" => "UPI-ABDULKARIM RAJU SAYY-9665012424@YBL-UBIN0532266-332874879256-DONATION",
          "Chq./Ref.No." => "332874879256",
          "Value Dt" => "24/11/23",
          "Withdrawal Amt." => "500",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "24/11/23",
          "Narration" => "UPI-ARSHAD JAKIR BAGWAN-BHARATPE.90068312507@FBPE-FDRL0001382-332875277612-PAY TO BHARATPE ME",
          "Chq./Ref.No." => "332875277612",
          "Value Dt" => "24/11/23",
          "Withdrawal Amt." => "50",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "26/11/23",
          "Narration" => "UPI-MINAL AMOL SHAH JT1-BHARATPE07915794719@YESBANKLTD-YESB0YESUPI-333040156396-PAY TO P N SHAH HO",
          "Chq./Ref.No." => "333040156396",
          "Value Dt" => "26/11/23",
          "Withdrawal Amt." => "662",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "26/11/23",
          "Narration" => "UPI-TRILOKNATH THAKUR-KK7667387450@OKHDFCBANK-IPOS0000001-333046177073-UPI",
          "Chq./Ref.No." => "333046177073",
          "Value Dt" => "26/11/23",
          "Withdrawal Amt." => "10",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "27/11/23",
          "Narration" => "UPI-INDIAN OIL CORPORATI-INDIANOILCORPORATION.76020356@HDFCBANK-HDFC0000001-333154812600-COLLECT",
          "Chq./Ref.No." => "333154812600",
          "Value Dt" => "27/11/23",
          "Withdrawal Amt." => "905.5",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "29/11/23",
          "Narration" => ".DC INTL POS TXN MARKUP+ST 031123 041123-CDT2330720043891",
          "Chq./Ref.No." => "CDT2330720043891",
          "Value Dt" => "29/11/23",
          "Withdrawal Amt." => "243.56",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        },
        {
          "Date" => "29/11/23",
          "Narration" => ".DC INTL POS TXN MARKUP+ST 031123 051123-CDT2330720043891",
          "Chq./Ref.No." => "CDT2330720043891",
          "Value Dt" => "29/11/23",
          "Withdrawal Amt." => "34.39",
          "Deposit Amt." => nil,
          "category" => "others",
          "sub_category" => nil
        }
      ],
      "shopping" => {
        "others" => [{
            "Date" => "05/11/23",
            "Narration" => "UPI-RD EYE PERCEPTION PH-PAYTMQR281005050101L61H3EWYDAPV@PAYTM-PYTM0123456-330932924171-SHOPPING",
            "Chq./Ref.No." => "330932924171",
            "Value Dt" => "05/11/23",
            "Withdrawal Amt." => "15190",
            "Deposit Amt." => nil,
            "category" => "shopping",
            "sub_category" => "others"
          },
          {
            "Date" => "30/11/23",
            "Narration" => "UPI-XPRESSBEES-PAYTM-58493@PAYTM-PYTM0123456-333473462380-SHOPPING",
            "Chq./Ref.No." => "333473462380",
            "Value Dt" => "30/11/23",
            "Withdrawal Amt." => "1260.51",
            "Deposit Amt." => nil,
            "category" => "shopping",
            "sub_category" => "others"
          }
        ]
      },
      "utility" => {
        "electricity" => [{
          "Date" => "18/11/23",
          "Narration" => "UPI-BILLDESKTEZ-BILLDESK.ELECTRICITY@ICICI-ICIC0DC0099-332275274348-UPI",
          "Chq./Ref.No." => "332275274348",
          "Value Dt" => "18/11/23",
          "Withdrawal Amt." => "1020",
          "Deposit Amt." => nil,
          "category" => "utility",
          "sub_category" => "electricity"
        }]
      }
    }
  end

  let(:output_per_category) do
    {
      "restaurant"=>576.0, "grocery"=>1450.0, "entertainment"=>649.0, "project"=>4900.0, "shopping"=>16450.51, "utility"=>1020.0
    }
  end


  let(:output_per_subcategory) do
    {
      "restaurant"=>{"tea"=>50.0, "others"=>205.0, "swiggy"=>576.0},
      "grocery"=>{"dudaram"=>205.0, "others"=>820.0, "fruit"=>1450.0},
      "entertainment"=>{"netflix"=>649.0},
      "project"=>{"digitalocean"=>5897.05, "midjourney"=>832.92, "coworking"=>4900.0},
      "others"=>{},
      "shopping"=>{"others"=>16450.51},
      "utility"=>{"electricity"=>1020.0}
    }
  end


  it "displays expenses per category and subcategory" do 
    category_analyzer = CategoryAnalyzer.new(input)
    expect(category_analyzer.expenses_per_subcategory).to eq(output_per_subcategory)
    expect(category_analyzer.expenses_per_category).to eq(output_per_category)
  end
end

