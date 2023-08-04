def is_int_array(array)
  return true if array == []
  return false if !array.is_a? Array
  if (array.select do |element|
      element.to_i != element
      end) == []
      return true
  end
  false
end



# test cases
p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
