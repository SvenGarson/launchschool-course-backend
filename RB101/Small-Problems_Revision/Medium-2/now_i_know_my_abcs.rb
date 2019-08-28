=begin
  inp:
    string

  outp:
    true of false bool

  requir.:

    explic.:
      - method name: block_word
      - arg        : string containing characters form the blocks
      - each block can only be used once

    implic.:
      -! the two chars of one block can never both be used
         see test at line 2 for example
      -? arg argg strings always characters present in the block
      -! blocks are uppercase but input can be lower case too
         see test line 3
      -? can input be mixed-case
      -? does the problem state block in the format A:F for a specific
         reason


  ds and algo:

    - for every char in the arg string:
      - does block include block with that char:
        if yes:
          -> delete that block
        if not:
          -> return false

    - for every char in arg string:
      - upcase the char
      - find block that contains char, false if none found
      - if found == false:
        -> return false
      - if found == object
        -> remove found form blocks

    -

=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word(str)
  blocks = BLOCKS.dup
  valid = true
  str.chars.each do |char|
    found = blocks.find(nil){ |pair_str| pair_str.include?(char.upcase) }
    if found
      blocks.delete(found)
    else
      valid = false
      break
    end
  end
  valid
end

p block_word('BATCH') == true
p block_word('BUTCH') == false
p block_word('jest')  == true