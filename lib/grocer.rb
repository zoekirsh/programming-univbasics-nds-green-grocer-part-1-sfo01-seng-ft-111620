def find_item_by_name_in_collection(name, collection)
  index = 0

  while index < collection.length do
    return collection[index] if collection[index][:item] === name 
    index += 1
  end
end

## Alternative Solution with Enumerables

# def find_item_by_name_in_collection(name, collection)
#   index = 0
#
#   collection.each do |grocery_item|
#     return grocery_item if grocery_item[:item] === name 
#     index += 1
#   end
# end

def consolidate_cart(cart)
  index = 0
  new_cart = []
  
  while index < cart.length do
    item = find_item_by_name_in_collection(cart[index][:item], new_cart)
    if item
      new_cart_index = 0
      while new_cart_index < new_cart.length do
        if new_cart[new_cart_index][:item] === item[:item]
          new_cart[new_cart_index][:count] += 1
        end
        new_cart_index += 1
      end
    else
      cart[index][:count] = 1
      new_cart << cart[index]
    end
    index += 1
  end
  new_cart
end

## Alternative Solution with Enumerables

# def consolidate_cart(cart)
#   index = 0
#   new_cart = []
#  
#   cart.each do |grocery_item|
#     current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
#     if current_item
#       new_cart_index = 0
#       new_cart.each do |new_cart_item|
#         if new_cart_item[:item] === current_item[:item]
#           new_cart_item[:count] += 1
#         end
#         new_cart_index += 1
#       end
#     else
#       grocery_item[:count] = 1
#       new_cart << grocery_item
#     end
#     index += 1
#   end
#   new_cart
# aend
  
