def is_an_ip_number?(number_str)
  number_i = number_str.to_i
  number_i >= 0 && number_i <= 255
end

def dot_separated_id_address?(input_string)
  dot_separated_comps = input_string.split('.')
  components = dot_separated_comps.size
  # has to be 4 component address
  return false unless components == 4
  # check all components in range
  address_valid = true
  for comp in dot_separated_comps
    if !is_an_ip_number?(comp)
      address_valid = false
      break
    end
  end
  address_valid
end

# test cases
puts dot_separated_id_address?('')                # no components
puts dot_separated_id_address?('0.255.127.1')     # valid components
puts dot_separated_id_address?('0.255.127.1.55')  # too many components
puts dot_separated_id_address?('-25.255.127')     # invalid component range
puts dot_separated_id_address?('0.255.354.127')   # invalid component range