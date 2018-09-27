class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @name = name
    @id = id
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-sql
    INSERT INTO pokemon (name, type) VALUES (?, ?)
    sql
    db.execute(sql, name, type)
  end

  def self.find(id,  db)
    sql = <<-sqlite
    SELECT * FROM pokemon WHERE pokemon.id = ?
    sqlite

    pokemon = db.execute(sql, id)[0]
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end
end
