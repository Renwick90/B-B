require( 'minitest/autorun' )
require_relative( '../models/room' )

class TestRoom < MiniTest::Test

  def setup
    options = {
      'first_name' => 'Tony',
      'last_name' => 'Goncalves',
      'nights' => '4',
      'breakfast' => 'yes',
      'type_of_room' =>'double'
    }
    @room = Room.new( options )
  end
  def test_first_name()
    assert_equal( 'Tony', @room.first_name() )
  end

  def test_second_name()
    assert_equal( 'Goncalves', @room.last_name() )
  end
  # specs/pizza_spec.rb

  def test_pretty_name()
    assert_equal( 'Tony Goncalves', @room.pretty_name() )
  end
end