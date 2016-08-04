require('pg')
require_relative ('../db/sql_runner')

class Pet

  attr_reader :id, :name, :type, :pet_shop_id

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @type = options['type']
    @pet_shop_id = options['pet_shop_id'].to_i
  end

  def save 
    sql = "INSERT INTO pets (name, type, pet_shop_id) VALUES ('#{@name}', '#{@type}', #{@pet_shop_id}) RETURNING *;"
    pet = SqlRunner.run(sql).first
    @id = pet['id'].to_i
  end

  def belongs_to_what_store
    sql = "SELECT * FROM pets INNER JOIN pet_shops ON pets.pet_shop_id = pet_shops.id WHERE pets.id = #{@id}"
    pet = SqlRunner.run(sql).first
    return pet['name'] 
  end

end