require('pg')

class Room
  attr_reader(:first_name, :last_name, :nights, :breakfast, :type_of_room)

  def initialize(options)
    @id=options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @nights = options['nights'].to_i
    @breakfast = options['breakfast']
    @type_of_room = options['type_of_room']
  end

  def self.all
    db=PG.connect({dbname: 'bandb', host: 'localhost'})
    sql="SELECT * FROM rooms;"
    rooms = db.exec(sql)
    result =rooms.map{|room| Room.new(room)}
    db.close
    return result
  end

  def save
    db=PG.connect({dbname: 'bandb', host: 'localhost'})
    sql="INSERT INTO rooms (
    first_name,
    last_name,
    nights,
    breakfast,
    type_of_room) VALUES (
    '#{first_name}',
    '#{last_name}',
    '#{nights}',
    '#{breakfast}',
    '#{type_of_room}'
    ) RETURNING *"
    room_data = db.exec(sql)
    db.close
    @id =room_data.first()['id'].to_i
  end


  def pretty_name()
    return @first_name.concat(" #{@last_name}")
  end
end
