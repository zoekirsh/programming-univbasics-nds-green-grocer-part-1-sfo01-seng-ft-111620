describe "Grocer" do
  # let() is like a global variable for tests
  let(:items) do
    [
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "KALE", :price => 3.00, :clearance => false},
      {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
      {:item => "ALMONDS", :price => 9.00, :clearance => false},
      {:item => "TEMPEH", :price => 3.00, :clearance => true},
      {:item => "CHEESE", :price => 6.50, :clearance => false},
      {:item => "BEER", :price => 13.00, :clearance => false},
      {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
      {:item => "BEETS", :price => 2.50, :clearance => false},
      {:item => "SOY MILK", :price => 4.50, :clearance => true}
    ]
  end

  let(:coupons) do
    [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "BEER", :num => 2, :cost => 20.00},
      {:item => "CHEESE", :num => 3, :cost => 15.00}
    ]
  end

  describe "#find_item_by_name_in_collection takes two arguments: a String and an AoH" do
    let(:test_cart) do
      [
        { :item => "DOG FOOD" },
        { :item => "WINE" },
        { :item => "STRYCHNINE" }
      ]
    end

    describe "and when a contained Hash's :item key matches the String" do
      it "returns the matching Hash" do
        expect(find_item_by_name_in_collection("WINE", test_cart)).to_not be_nil
        expect(find_item_by_name_in_collection("WINE", test_cart)).to eq({ :item => "WINE" })
      end
    end

    describe "but when no contained Hash's :item key matches the String" do
      it "returns the matching nil" do
        expect(find_item_by_name_in_collection("AXLE GREASE", test_cart)).to be_nil
      end
    end
  end

  describe "#consolidate_cart" do
    it "adds a count of one to each item when there are no duplicates" do
      cart = [find_item_by_name_in_collection('TEMPEH', items), find_item_by_name_in_collection('PEANUTBUTTER', items), find_item_by_name_in_collection('ALMONDS', items)]
      consolidated_cart = consolidate_cart(cart)
      i = 0
      while i < consolidated_cart.length do
        expect(consolidated_cart[i][:count]).to eq(1)
        i += 1
      end
    end

    it "increments count when there are multiple items" do
      avocado = find_item_by_name_in_collection('AVOCADO', items)
      cart = [avocado, avocado, find_item_by_name_in_collection('KALE', items)]

      consolidated_cart = consolidate_cart(cart)
      av = find_item_by_name_in_collection("AVOCADO", consolidated_cart)
      expect(av[:price]).to eq(3.00)
      expect(av[:clearance]).to eq(true)
      expect(av[:count]).to eq(2)

      hipster_lettuce = find_item_by_name_in_collection("KALE", consolidated_cart)
      expect(hipster_lettuce[:price]).to eq(3.00)
      expect(hipster_lettuce[:clearance]).to eq(false)
      expect(hipster_lettuce[:count]).to eq(1)
    end
  end

end
