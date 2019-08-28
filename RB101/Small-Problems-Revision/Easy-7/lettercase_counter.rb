=begin
  input:
    string
  output:
    hash that has 3 entries:
      lowercase => count of lowercase letters
      uppercase => count of upercase  letters
      neither   => count of characters that are neither upper nor lowercase

  requirements:
    explicit:
      method name: letter_case_count
      one string parameter
  
    implicit:
      n/a

    mental model:

      Take a string and count occurences of uppercase, lowercase and
      neither of both, then create and return a new has that contains
      three key - value pairs. For each attribute store the count as value

    ds and algo:
      create hash with default object integer zero
      for every character in the string:
        if character is a alphabetical character:
          if uppercase -> upcase  += 1 
          if lowercase -> lowcase += 1
        else -> neither += 1
      return coun hash

=end

ALPHA_LOWCASE = ('a'..'z').to_a
ALPHA_UPCASE  = ('A'..'Z').to_a
ALPHA = ALPHA_LOWCASE + ALPHA_UPCASE
SYM_LOWCASE = :lowercase
SYM_UPCASE  = :uppercase
SYM_NEITHER = :neither


def is_alpha?(char)
  ALPHA.include?(char)
end

def is_upcase?(char)
  ALPHA_UPCASE.include?(char)
end

def is_lowcase?(char)
  ALPHA_LOWCASE.include?(char)
end

def letter_case_count(string)
  count_hsh = { SYM_LOWCASE => 0, SYM_UPCASE => 0, SYM_NEITHER => 0}
  string.chars.each do |char|
    if is_alpha?(char)
      case
      when is_lowcase?(char) then count_hsh[SYM_LOWCASE] += 1
      when is_upcase?(char)  then count_hsh[SYM_UPCASE] += 1
      end
    else
      count_hsh[SYM_NEITHER] += 1
    end
  end
  count_hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4}
p letter_case_count('AbCd +Ef')   == { lowercase: 3, uppercase: 3, neither: 2}
p letter_case_count('123')        == { lowercase: 0, uppercase: 0, neither: 3}
p letter_case_count('')           == { lowercase: 0, uppercase: 0, neither: 0}