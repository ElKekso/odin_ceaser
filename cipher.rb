def encrypt_lo_up(char, amount, border_low, border_high)
  char += amount
  while(char < border_low || char > border_high) do
    if(char < border_low) { border_high - border_low + 1 + char }
    if(char > border_high) { border_low - border_high - 1 + char }
  end
  char
end

def encrypt_lower(char, amount)

end

def encrypt_char(char, amount)

  UP_LOWEST = 65
  UP_HIGHEST = 90
  DOWN_LOWEST = 97
  DOWN_HIGHEST = 122

  if(char < UP_LOWEST || char > UP_HIGHEST && char < DOWN_LOWEST || char > DOWN_HIGHEST)
    return char
  
  if(char >= UP_LOWEST && char <= UP_HIGHEST)
    return encrypt_lo_up(char, amount, UP_LOWEST, UP_HIGHEST)
  else
    encrypt_lo_up(char, amount, DOWN_LOWEST, DOWN_HIGHEST)
    
end

def encrypt(sentence, amount)
  sentence.bytes.map {|item| encrypt_char(item)} 
end