require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Iterates thru collection and returns the full hash for an item matching name. 
  #If no match, returns nil 
  collection.find { |itemHash| itemHash[:item] == name }
end

def consolidate_cart(cart)
  # REMEMBER: This returns a new Array that represents the cart.
  #Iterate thru the cart and add each item to new cart array with a count IF not already in the cart.
  #IF in cart, increment count.
   scanned_cart = []
   cart.each do |itemHash|
    if find_item_by_name_in_collection(itemHash[:item], scanned_cart)
      itemHash[:count] += 1 
    else scanned_cart << itemHash
      scanned_cart.last[:count] = 1 
    end
  end
  return scanned_cart 
end


  