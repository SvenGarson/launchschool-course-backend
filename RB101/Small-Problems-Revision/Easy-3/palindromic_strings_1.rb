=begin
  inp:
    string
  out:
    True  if palindromic
    False if not palindromic

  req:
    exp:
      - method name: palindrome?
      - palindrome case, punctuation and space sensitive

  ds and algo:

    result = (string == string reverse)

  further exploration:

  1) Write a method that determines if an array is palindromic

  inp:
    - array
  out:
    - True or False

  req:
    - palindromic array -> elements appear in same sequence from
      start to end and vice-versa

    ds and algo:
      
      [1,2,3,2,1]
      [1, 2]
      [2, 1].reverse [1, 2]
      count = 5
      center = 5 / 2 = 2

      [1, 2, 2, 1]
      count = 4
      center = 2
    
    extract array from 0 to center and form center to end of
    the same size, ignore center object if odd.
    Reverse the second array and check for palindrome on those
    two extracts.

    - sub_left  = arr[0, center]
    - sub_right = arr[-center, center] 
    - result = sub_left == sub_right.reverse

    2) Write a method that determines whether am array or string
       is palindromic.

    inp:
      - array or string
    out:
      - True or False
    req:
      exp:
        - cannot use: if; unless or case
        - we can use a ternary operator to select the right method
          based on the parameters class

=end

def array_palindrome?(arr)
  center = arr.length / 2
  sub_left  = arr[0, center]
  sub_right = arr[-center, center]
  sub_left == sub_right.reverse 
end

def palindrome?(str)
  str == str.reverse
end

def object_palindrome?(obj)
  (obj.class == String) ? palindrome?(obj) : array_palindrome?(obj)
end

puts '### Solution to original problem ###'
p palindrome?('madam')  == true
p palindrome?('Madam')  == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true

puts '### Further exploration 1) Solution for palindromic array ###'
p array_palindrome?([1, 2, 5, 2, 1]) == true
p array_palindrome?([1, 2, 5, 1])    == false
p array_palindrome?([])        == true
p array_palindrome?([1,2,1,2]) == false

puts '### Further expliration 2) Solution for passing a string OR array as argument ###'
p object_palindrome?('AbCCbA')        == true
p object_palindrome?([1, 2, 3, 2, 1]) == true
p object_palindrome?('I am your father am I') == false
p object_palindrome?('I am ma I')     == true
p object_palindrome?([1, 2, 3, 1, 2]) == false