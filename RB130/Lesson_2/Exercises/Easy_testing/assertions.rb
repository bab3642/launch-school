require 'minitest/autorun'

class TestPractice < Minitest::Test
  attr_accessor :value

  def setup
    @value = 3
  end

  def test_val_odd
    assert_equal(true, value.odd?)
  end

  def test_downcase
    assert_equal('xyz', value.downcase)
  end

  def test_nil
    assert_nil(value)
  end

  def test_empty
    assert_empty(list)
  end

  def test_include
    assert_includes(list, 'xyz')
  end

  def test_error
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_type
    assert_instance_of(Numeric, value)
  end

  def test_kind
    assert_kind_of(Numeric, value)
  end

  def test_same_obj
    assert_same(list, list.process)
  end

  def test_refute
    refute_includes(list, 'xyz')
  end
end

