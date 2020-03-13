# Green Grocer

## Learning Goals

- Translate data from AoH to AoH

## Introduction

Over the last several lessons, we've explored nested data structures and how
they can model complex real-world situations. Now, in this lab and the next,
we're going to take everything we've learned and use it to program a grocery
store checkout process.

You're going to have to integrate everything you've learned to this point,
repetition, conditional flow control, analyzing NDS, processing NDS, producing
_insights_. On the other side of this challenge you're going to _know_ that you
_know_ how to construct and write procedural style programs in Ruby.

In fact, and we're hesitant to say it, you're going to be irritated with us.
"Why is there so much boilerplate code, why are there so many
`while...do...end`s?" That's exactly where we want you to be. In the coming
lessons, we'll show you refinements to clunky work that will make you and your
tired fingers so happy...but you'll appreciate them and what they do _in light
of_ this one last challenge.

So let's get to it!

## Shopping

Think for a moment about what it's like to shop at a grocery store. As you walk
through the store, you put the items you want to buy into your cart. Your cart,
then, becomes a _collection_ of grocery items. Every one of those grocery items
has specific _attributes_: for example, its price and whether or not it's on
clearance. You can also have multiples of the same item in your cart, and
chances are they will be all mixed in no particular order or structure.

> **Stop and Reflect**: When you read the paragraph above, did you hear the
> suggestion of an `Array` for a collection? Did the word _attributes_ suggest to
> you an attribute/value pair, like a `Hash`? If that's not happening for you
> at this moment, you should go back and review the first 4 lessons of this
> section.

When you pay for all your items at the checkout, you expect to get a
"consolidated" receipt that:

* lists all of the items you bought
* lists how many of each item you bought
* accounts for any coupons or discounts per item
* applies any "total price" discounts

> **Stop and Reflect**: You should recognize that there's a transformation
> happening between the NDS that represents "things in the cart" to the NDS
> that represents a "consolidated" receipt." You should be thinking about Steps
> 2, 3, and 4 of the NDS process we taught you. If that's not sounding
> familiar, review the lessons where we practice transforming NDS. Make sure
> your foundational skills are ready for this challenge!

In this lab and the next, your task is to write a set of methods to handle the
different pieces of the checkout process. For this first lab, we'll focus on two
methods first - `find_item_by_name_in_collection` and `consolidate_cart`.

## `find_item_by_name_in_collection`

The first method, `find_item_by_name_in_collection`, simulates the act of adding
items to your shopping cart. Again, if we think of grocery items as having
_attributes_ like a Hash, a shelf in a grocery store might contain a collection
of various items. We could represent this as an `Array` of `Hash`es:

```rb
grocery_shelf = [
  { :item => "CANNED BEANS", :price => 3.00, :clearance => true },
  { :item => "CANNED CORN", :price => 2.50, :clearance => false },
  { :item => "SALSA", :price => 1.50, :clearance => false },
  { :item => "TORTILLAS", :price => 2.00, :clearance => false },
  { :item => "HOT SAUCE", :price => 1.75, :clearance => false }
]
```

`find_item_by_name_in_collection` should be able to take the string name of a
particular item and a collection of items like we have above. It should then
iterate over the collection and check the value of `:item` in each nested hash.
If a match is found, the method should return that entire hash. For instance, if
we ran:

```rb
find_item_by_name_in_collection("CANNED CORN", grocery_shelf)
```

We would expect the following in return:

```rb
{ :item => "CANNED CORN", :price => 2.50, :clearance => false}
```

If an item is _not_ found, `find_item_by_name_in_collection` should return `nil`.

```rb
find_item_by_name_in_collection("CHOLULA", grocery_shelf)
 # => nil
```

Get this method passing before moving on - the later tests use this method to
build example carts for testing.

## `consolidate_cart`

Imagine you've arrived at the checkout stand with your cart - the first thing
your cashier will do (or _you will do_ in a self-checkout) is take items one at
a time and scan them. Every item you select and scan an item, it will be added
to a record that will eventually be your receipt.

Regardless of the order of items you scan, the checkout machine will tally up
the total count of each item, displaying a quantity alongside the item
information. The `consolidate_cart` method should do something similar - it
should take in a 'cart', an array of hashes of individual items and return a new
array of hashes, but with each item containing a quantity. So, for example,
given the following cart:

```rb
unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]
```

If we passed this into `consolidate_cart`:

```rb
consolidate_cart(unconsolidated_cart)
```

We should expect the following in return:

```rb
[
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 2},
  {:item => "KALE", :price => 3.00, :clearance => false, :count => 1}
]
```

Notice that instead of listing the Avocado hash twice, we now have a single hash
for Avocado with a `:count` set to `2`. Since we only had one Kale hash, it has
a `:count` set to `1`.

**Hint:** The `find_item_by_name_in_collection` can be used to check if items
exist in any array of hashes, whether it be a 'grocery shelf' or the _cart_ your
are in the process of consolidating.

Check in with tests often to make sure your method is on track.

> **Note:** If you want to run the tests about `consolidate_cart`, you can run
> them by invoking `rspec spec/grocer_spec.rb:27`. If you look at the
> `spec/grocer_spec.rb` file, you'll see that all the `consolidate_cart` tests
> are in a `describe` block starting on line 27. This can help your output come
> out in a digestible form.

## Conclusion

With these two methods, `find_item_by_name_in_collection` and
`consolidate_cart`, we have designed the first half our program. Already, it can
do some neat things - we can use `find_item_by_name_in_collection` to build out
an array from existing hash data, and then use `consolidate_cart` to restructure
that data into a more useful format.

With our carts consolidated, we can move on to part two. In the second Green
Grocer lab, we will be implementng functionality to apply coupons and clearance,
and finally to tally up a total cost.

## Resources

- [Nested Data Structures to Insights](https://github.com/learn-co-curriculum/programming-univbasics-nds-nds-to-insights)
