def print_in_box(str)
  str_len = str.size
  interior_width = 2 + str_len
  interior_height = 2 + (str_len > 0 ? str_len : 1)

  div_hori_edge = "+#{'-'*interior_width}+"
  div_text      = "| #{str} |"
  div_hori_pad  = "|#{' '*interior_width}|"

  puts div_hori_edge
  puts div_hori_pad
  puts div_text
  puts div_hori_pad
  puts div_hori_edge
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')