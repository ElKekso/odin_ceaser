UP_LOWEST = 65
UP_HIGHEST = 90
DOWN_LOWEST = 97
DOWN_HIGHEST = 122

def encrypt_lo_up(char, amount, border_low, border_high)
  char += amount
  while(char < border_low || char > border_high) do
    if(char < border_low) then char = border_high - border_low + 1 + char end
    if(char > border_high) then char = border_low - border_high - 1 + char end
  end
  char
end

def encrypt_char(char, amount)
  if(char < UP_LOWEST || char > UP_HIGHEST && char < DOWN_LOWEST || char > DOWN_HIGHEST)
    return char
  
  elsif(char >= UP_LOWEST && char <= UP_HIGHEST)
    return encrypt_lo_up(char, amount, UP_LOWEST, UP_HIGHEST)
  else
    encrypt_lo_up(char, amount, DOWN_LOWEST, DOWN_HIGHEST)
  end
    
end

def encrypt(sentence, amount)
  sentence.bytes.map {|item| encrypt_char(item, amount)}.pack('C*').force_encoding('UTF-8') 
end