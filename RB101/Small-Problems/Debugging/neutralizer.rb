=begin
  The problem is the deletion during the iteration of the array.
  The each method iterates over the given collection from first
  to last object. But if objects are removed during this iteration,
  the order order each iterates will not change, but the object at each
  iteration respective to an un-modified array will.
  
  So when each is at index 1, delete removed 'dull' from the array,
  which shifts the object after index 1 forward to fill the array back
  up. Then each increments the index from 1 to 2, at which point the 
  word boring moved to index 1 because of the deletion and is missed
  for testing against negative words.

  Selection or transofmration would be correct methods to use in this case
  
  Further exploration, re-implementing reject method:

  Iterate throuch the given collection and for each object in the array
  check the return value of the block for this current object and remove
  from the param array if the block returns true.
  Since deletion at index shifts the object behind to the left, deletion
  does not increment the current index.

=end

def neutralize(sentence)
  sentence.split(' ').select { |word| not negative?(word)}.join(' ')
end

def mutating_reject(array)
  index = 0
  loop do
    
    break if index == array.size

    curr = array[index]

    if yield(curr)
      array.delete_at(index)
    else
      index += 1
    end
  end
  array
end

def negative?(word)
  ['dull',
   'boring',
   'annoying',
   'chaotic'
   ].include?(word)
end

p neutralize('These dull boring cards are part of a chaotic board game.') ==
  'These cards are part of a board game.'

