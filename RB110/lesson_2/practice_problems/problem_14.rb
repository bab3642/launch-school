hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}



arr =   hsh.each_with_object([]) do |(_, data), array|
  if data[:type] == 'vegetable'
    array << data[:size].upcase
  else
    array << data[:colors].map { |color| color.capitalize }
  end
end


p arr
  