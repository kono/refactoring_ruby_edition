require 'test/unit'


class TC_fileread < Test::Unit::TestCase
  def test_read_4th_character
    contents = File.read('data.txt')
    assert_equal 'd', contents[3,1]
  end
end
