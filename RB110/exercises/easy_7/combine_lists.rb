def interleave2(arr1, arr2)
  combined = []
  alternator = true
  (arr1.size * 2).times do 
    if alternator
      combined << arr1.shift
    else
      combined << arr2.shift
    end
    
    alternator = (alternator ? false : true)
  end
  combined
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])  == [1, 'a', 2, 'b', 3, 'c']


