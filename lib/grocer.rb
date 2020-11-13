require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Iterates thru collection and returns the full hash for an item matching name. 
  #If no match, returns nil 
  collection.each do |itemHash|
   if itemHash[:item] == name 
     return itemHash
    end
  end
  return nil
end

def consolidate_cart(cart)
  # REMEMBER: This returns a new Array that represents the cart.
  #Iterate thru the cart and add new items to new cart array with a count. If redundant, increase the count.
   scanned_cart = []
   cart.each do |item|
     scanned_cart << item[:count] = 1
      
   end
  
  
end


  