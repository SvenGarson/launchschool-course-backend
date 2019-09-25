=begin

  inp:
    - string
  out:
    - boxed string in format:
        +------+  --> T
        |      |  --> E
        | AAAA |  --> STR
        |      |  --> E
        +------+  --> T

  exp:
    - method name: print_in_box
    - text with banner will always fit into terminal window
    - minimim paddin hori and verti = 1
    - empty string will still print box with text line,
      just empty

  ds and algo:
    
    - width_in = str length + 2
    - print T   with width_in '-'
    - print E   with width_in ' '
    - print STR with leadind and following space
    - print E with width_in ' '
    - print T with width_in '-'

  further exploration:

    1) Truncating the string into an 80 column wide terminal

        - compute banner width
        - if width > 80 set it to 80
        - compute max text width width - 4 (padding + pipe)
        - get substring for text width if necessary
        - print the same way as before

    2) Wrap long lines onto multiple lines withing a box
      
      -? keep words whole

      - as before compute banner with and max text width
      - line accum = new empty string
      - for word in str split at space:
        - if line accum length +  + word length <= max text width:
,         - line accum += word
        - else
          - pad spaces right = banner_width - used _width
          - puts line with pad spaces on right of text
          - reset line accum to empty string
          - add word to line accum
    
=end

def str_lines(string, line_length)
  lines = []
  loop do
    sub = string[0, line_length]
    string = string[line_length..-1]
    lines << sub unless sub.empty?
    break if string == nil
  end
  lines
end

def print_in_box_lines(str)
  banner_width = str.length + 4
  if banner_width > TERMINAL_WIDTH
    banner_width = TERMINAL_WIDTH
  end
  text_width = banner_width - 4
  div_border = "+#{'-' * (banner_width - 2)}+"
  div_empty  = "|#{' ' * (banner_width - 2)}|"
  puts div_border
  puts div_empty
  
  if str.length != 0
    lines  = str_lines(str, text_width)
    lines.each_with_index do |line, i|
      puts "| #{line.strip.center(text_width)} |"
    end
  end  

  puts div_empty
  puts div_border
end

def print_in_box(str)
  width_in = str.length + 2
  div_border  = '+'  + ('-' * width_in) + '+'
  div_empty   = '|'  + (' ' * width_in) + '|'
  div_text    = '| ' + str.chomp + ' |'

  puts div_border
  puts div_empty
  puts div_text
  puts div_empty
  puts div_border
end

TERMINAL_WIDTH = 25

def print_in_box_truncated(str)
  banner_width = str.length + 4
  if banner_width > TERMINAL_WIDTH
    banner_width = TERMINAL_WIDTH
  end
  sub_str = str[0, banner_width - 4]
  inside_width = banner_width - 2
  div_border = "+#{'-' * inside_width}+"
  div_empty  = "|#{' ' * inside_width}|"
  
  puts div_border
  puts div_empty
  puts "| #{sub_str} |"
  puts div_empty
  puts div_border
  
end

puts '### Solution ###'
print_in_box('To boldly go where no one has gone before.')
print_in_box('')

puts '### Solution to further exploration, truncating oversized strings ###'
print_in_box_truncated('To boldly go where no one has gone before.')
print_in_box_truncated('')

puts '### Solution to further exploration, multiple line on long string ###'
print_in_box_lines('To boldly go where no one has gone before.')
print_in_box_lines('')