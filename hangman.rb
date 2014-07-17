words = ["window", "vehicle", "abnormal", "environment", "wonderful", "aorta", "saxaphone"]

word = words.shuffle.first.upcase
blanks = "_" * word.length 
errors = ""

hang = ["
 ___
|   |
|   
|
|
|____
",
"
 ___
|   |
|   O
|
|
|____
",
"
 ___
|   |
|   O
|   |
|
|____
",
"
 ___
|   |
|   O
|  -|
|
|____
",
"
 ___
|   |
|   O
|  -|-
|
|____
",
"
 ___
|   |
|   O
|  -|-
|  /
|____
",
"
 ___
|   |
|   O
|  -|-
|  / \
|____
"]

def print_word(letters)
	letters.split("").each { |letter| print letter + " " } 
	print "\n"
end

while blanks != word do
	puts "Enter a letter:"
	letter = gets.chomp[0].upcase

	found = false
	word.split("").each_with_index { |l, index| 
		if word[index] == letter then
			blanks[index] = letter
			found = true
		end
	}

	unless found then
		errors += letter
	end

	puts hang[errors.length]
	puts "Word:"
	print_word(blanks)
	puts "Guesses:"
	print_word(errors)
end
