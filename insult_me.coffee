bad_word = "jerk"

## final method
call_me_a = (insult) ->
  [first] = arrayify_insult(insult)
  if first_letter_is_a_vowel(first)
    console.log "you're an #{insult}"
  else
    console.log "you're a #{insult}"



## make insult string into array
arrayify_insult = (insult) ->
  for letter in insult
    letter

## check if first letter of insult string is vowel
first_letter_is_a_vowel = (letter) ->
  vowels = ["a", "e", "i", "o", "u"]
  letter in vowels





## get first letter from insult string
[first] = arrayify_insult bad_word

console.log [first]
console.log first_letter_is_a_vowel first
call_me_a bad_word
