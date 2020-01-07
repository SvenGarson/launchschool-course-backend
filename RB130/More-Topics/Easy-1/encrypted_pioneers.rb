NAMES = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

ALPHA_UPPER = ('A'..'Z').to_a
ALPHA_LOWER = ('a'..'z').to_a

def wrap_13th(char, alphabet)
  char_index = alphabet.index(char)
  rotated_index = (char_index + 13) % alphabet.length
  alphabet[rotated_index]
end

def rot13(char)
  if char.match?(/[a-z]/i)
    if char == char.upcase
      wrap_13th(char, ALPHA_UPPER)
    elsif char == char.downcase
      wrap_13th(char, ALPHA_LOWER)
    end
  else
    ' '
  end
end

def string_decrypt_rot13(string)
  string.chars.map { |char| rot13(char) }.join
end

# decrypt and log all the names to stdout
decrypted_names = NAMES.map { |name| string_decrypt_rot13(name) }
puts decrypted_names
