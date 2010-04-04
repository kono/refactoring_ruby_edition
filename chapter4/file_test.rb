require 'test/unit'

class TC_fileread < Test::Unit::TestCase
  def test_read_4th_character
    contents = File.read('data.txt')
    assert_equal 'd', contents[3,1]
  end
  #def test_read_4th_content_is_2
  #  contents = File.read('data.txt')
  #  assert_equal '2', contents[3,1]
  #end
  #def test_read_causes_error_when_file_not_found
  #  contents = File.read('datas.txt')
  #  assert_equal '2', contents[3,1]
  #end
  def test_read_with_a_length_specified
    contents = File.read('data.txt',15)
    assert_equal 'Bradman 99.94 5', contents
  end
  def test_read_empty_file_returns_empty_string
    File.open('empty_data.txt', 'w'){}
    contents = File.read('empty_data.txt')
    assert_equal "", contents
  end
  def test_read_an_out_of_bounds_length_causes_no_error
    File.open('simple_data.txt','w'){|file| file << "simple file"}
    contents = File.read('simple_data.txt',100)
    assert_equal "simple file", contents
  end
  def tesa_read_raises_error_when_file_not_found
    begin
      File.read('datas.txt')
    rescue
    rescued = true
    end
    assert_equal true, rescued
  end
  def test_read_raises_error_when_file_not_found2
    assert_raises Errno::ENOENT do
      File.read('datas.txt')
    end
  end
end
