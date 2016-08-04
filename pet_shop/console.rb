require_relative('./models/pet_shop')
require_relative('./models/pets')

require('pry-byebug')

new_store = PetStore.new({
  'name' => 'Pets r Us',
  'address' => "2 Made Up Avenue",
  'stock' => 'Dogs'
  })
new_store.save()

pet_dog = Pet.new({
  'name' => 'Wilfred',
  'type' => 'Mongral', 
  'pet_shop_id' => new_store.id
  })
pet_dog.save()

binding.pry
nil