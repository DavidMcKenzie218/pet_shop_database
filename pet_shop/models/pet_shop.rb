require('pg')
require_relative ('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :addredd, :stock_type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock']
  end

  def save
    sql = "INSERT INTO pet_shops (name, address, stock) VALUES ('#{@name}', '#{@address}', '#{@stock_type}') RETURNING *"
    pet_shop = SqlRunner.run(sql).first
    @id = pet_shop['id'].to_i
  end

  def list_all_pets
    sql = "SELECT * FROM pets INNER JOIN pet_shops ON pets.pet_shop_id = pet_shops.id WHERE pet_shops.id = #{@id}"
    list_of_pets = SqlRunner.run(sql)
    return list_of_pets.map {|pet| Pet.new(pet)}
  end

end