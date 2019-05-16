# write a method that generates one UUID when called
# with no parameters

# UUID contains 32 hexadecimal characters (without hyphens)
# UUID contains 5 sections divided by a hyphen
# format: 12345678-1234-1234-1234-123456789ABC

HEXADEC = ('0'..'9').to_a + ('A'..'F').to_a

def gen_uuid
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |length, index|
    length.times do
      uuid << HEXADEC.sample
    end
    uuid << '-' if index < sections.length-1
  end
  uuid
end

UUID = gen_uuid
puts '=== UUID ==='
p UUID