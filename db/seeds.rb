require 'date'

u1a = User.create(first_name: "Greg", last_name: "Benjamin", username:"gb23", password: "g", email:"g@gmail.com")
u1b = User.create(first_name: "Allison", last_name: "Benjamin", username:"asKey", password: "g", email:"askey@gmail.com")
f1 = Fridge.create(name: "kitchen fridge")
f2 = Fridge.create(name: "garage fridge")
f3 = Fridge.create(name: "beverage fridge")

u1a.fridges << f1 << f2 << f3
u1b.fridges << f1 << f2 << f3

# i1k = Item.create(name: "Veggie Enchiladas", category: "Frozen Meal", note: "2 enchiladas with black beans and tofu", date_sell_by: DateTime.new(2017,8,26) , date_expires: DateTime.new(2017,11,15), grams: 270)
# i2k = Item.create(name: "Power Greens", category: "Salad", note: "spinach and baby kale", date_sell_by: DateTime.new(2017,8,20) , date_expires: DateTime.new(2017,8,30), grams: 100)
# i3k = Item.create(name: "Peanut Butter", category: "Spread", note: "chunky organic", date_sell_by: DateTime.new(2017,9,23) , date_expires: DateTime.new(2017,11,1), grams: 230)
# i4k = Item.create(name: "Jelly", category: "Spread", note: "raspberry, reduced sugar", date_sell_by: DateTime.new(2017,9,14) , date_expires: DateTime.new(2017,10,31), grams: 270)
# i5k = Item.create(name: "Almond Milk", category: "Beverage", note: nil, date_sell_by: DateTime.new(2017,11,30) , date_expires: DateTime.new(2017,12,15), grams: 310)
# i6k = Item.create(name: "Apple", category: "Fruit", note: "Gala", date_sell_by: nil , date_expires: nil, grams: 100.5)
# i8k = Item.create(name: "Banana", category: "Fruit", note: nil, date_sell_by: nil , date_expires: nil, grams: 205)
# i9k = Item.create(name: "Avocado", category: "Vegetable", note: nil, date_sell_by: nil, date_expires: nil, grams: 240)
# i10k = Item.create(name: "Beans, Greens, and Grains", category: "Frozen Meal", note: "African dish", date_sell_by: DateTime.new(2017,9,1) , date_expires: DateTime.new(2018,4,14), grams: 340)
# i11k = Item.create(name: "Coke", category: "Beverage", note: nil, date_sell_by: nil, date_expires: nil, grams: 360)
# i7k = Item.create(name: "Apple", category: "Fruit", note: "Gala", date_sell_by: nil , date_expires: nil, grams: 100.5)

# u1a.fridges.first.items << i1k << i2k << i3k << i4k << i11k << i6k
# u1b.fridges.first.items << i5k << i7k << i8k << i9k << i10k

#i1g = Item.create(name: "Southwest Salad", category: "Frozen Meal", note: "African dish", date_sell_by: DateTime.new(2017,9,1) , date_expires: DateTime.new(2018,4,14), grams: 340)
#i2g = Item.create(name: "Non-dairy Coffee Creamer", category: "Frozen Meal", note: "African dish", date_sell_by: DateTime.new(2017,9,1) , date_expires: DateTime.new(2018,4,14), grams: 340)
i3g = Item.create(name: "Donut", category: "Dessert", note: "Chocolate-glazed", date_sell_by: nil, date_expires: DateTime.new(2018,10,4), grams: 95)
i4g = Item.create(name: "Donut", category: "Dessert", note: "Maple-glazed", date_sell_by: nil, date_expires: DateTime.new(2018,10,2), grams: 95)
i5g = Item.create(name: "Donut", category: "Sweets", note: "Cinnamon-sugar", date_sell_by: nil, date_expires: DateTime.new(2018,10,1), grams: 90)
#i6g = Item.create(name: "Beans, Greens, and Grains", category: "Frozen Meal", note: "African dish", date_sell_by: DateTime.new(2017,9,12) , date_expires: DateTime.new(2018,5,4), grams: 340)

u1a.fridges[1].items << i3g << i4g #<< i1g << i2g << i3g << i4g 
u1b.fridges[1].items << i5g #<< i6g

# i1b = Item.create(name: "Coke", category: "Beverage", note: nil, date_sell_by: nil, date_expires: nil, grams: 360)
# i2b = Item.create(name: "Coke", category: "Beverage", note: nil, date_sell_by: nil, date_expires: nil, grams: 360)
# i3b = Item.create(name: "Kombucha", category: "Beverage", note: "Mango", date_sell_by: DateTime.new(2017,9,4) , date_expires: DateTime.new(2018,9,29), grams: 340)
# i4b = Item.create(name: "Green Tea", category: "Beverage", note: "Matcha", date_sell_by: DateTime.new(2017,9,1) , date_expires: DateTime.new(2018,10,18), grams: 300)
# i5b = Item.create(name: "Sparkling Water", category: "Beverage", note: "Lemon", date_sell_by: nil , date_expires: DateTime.new(2019,3,12), grams: 290)

# u1a.fridges.last.items << i1b << i2b << i3b << i4b << i5b

# #-------------------------------

u2 = User.create(first_name: "Tom", last_name: "Bradey", username:"bradet", password: "g", email:"bradet@outlook.com")
u2.fridges << Fridge.create(name: "kitchen fridge")

u2_i1k = Item.create(name: "Veggie Enchiladas", category: "Frozen Meal", note: "2 enchiladas with black beans and tofu", date_sell_by: DateTime.new(2017,8,26) , date_expires: DateTime.new(2017,11,15), grams: 270)
u2_i2k = Item.create(name: "Power Greens", category: "Salad", note: "spinach and baby kale", date_sell_by: DateTime.new(2017,8,20) , date_expires: DateTime.new(2017,8,30), grams: 100)
u2_i3k = Item.create(name: "Peanut Butter", category: "Spread", note: "chunky organic", date_sell_by: DateTime.new(2017,9,23) , date_expires: DateTime.new(2017,11,1), grams: 230)
u2_i4k = Item.create(name: "Jelly", category: "Spread", note: "raspberry, reduced sugar", date_sell_by: DateTime.new(2017,9,14) , date_expires: DateTime.new(2017,10,31), grams: 270)
u2_i5k = Item.create(name: "Almond Milk", category: "Beverage", note: nil, date_sell_by: DateTime.new(2017,11,30) , date_expires: DateTime.new(2017,12,15), grams: 310)
u2_i6k = Item.create(name: "Apple", category: "Fruit", note: "Gala", date_sell_by: nil , date_expires: nil, grams: 100.5)
u2_i7k = Item.create(name: "Apple", category: "Fruit", note: "Gala", date_sell_by: nil , date_expires: nil, grams: 100.5)
u2_i8k = Item.create(name: "Banana", category: "Fruit", note: nil, date_sell_by: nil , date_expires: nil, grams: 205)
u2_i9k = Item.create(name: "Avocado", category: "Vegetable", note: nil, date_sell_by: nil, date_expires: nil, grams: 240)

u2.fridges.first.items << u2_i1k << u2_i2k << u2_i3k << u2_i4k << u2_i5k << u2_i6k << u2_i7k << u2_i8k << u2_i9k

#----------------------------------------
# Do not use for now
# u3a = User.create(first_name: "Celine", last_name: "Dion", username:"celiD", password: "g", email:"celi@me.com")
# u3b = User.create(first_name: "Dave", last_name: "Dion", username:"daviddi", password: "g", email:"daviddi@me.com")
# u3c = User.create(first_name: "Mary", last_name: "Dion", username:"mardi", password: "g", email:"mardi@icloud.com")