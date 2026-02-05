# collapse.rb

def collapse(str, letter)
  result = +""
  prev = letter

  str.each_char do |c|
    if c == letter
      result << c if prev != letter
    else
      result << c
    end
    prev = c
  end

  result
end