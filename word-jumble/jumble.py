import sys

## Iterates through each line of the file given and builds 
## a dictionary. The keys will be the sorted values of each
## word in the file, if anagrams are found the values will
## be an list of anagrams for the key.

def populate_dict(path):
	dictionary = {}
	with open(path) as f:
		for word in f:
			word = word.strip().lower()
			sorted_word = ''.join(sorted(word))
			if sorted_word in dictionary:
				dictionary[sorted_word].append(word)
			else:
				dictionary[sorted_word] = [word]

		return dictionary


## Generates all permutations for a given word
## a recursive method would be more elegant.
def generate_permutations(word):
	permutations = []
	word_length = range(len(word))
	for i in word_length:
		for j in word_length:
			current_perm = ''.join(word[ i: j+1])

			if len(current_perm) > 0:
				permutations.append(current_perm) 
	return permutations

## Converts an array of arrays and return a set 
def flatten(l):
	return set(item for sublist in l for item in sublist)


## Main method. It checks if each permutation of a
## word exists in the dictionary and appends it to the 
## result.
def start(key, path):
	result = []
	dictionary = populate_dict(path)
	permutations = generate_permutations(key)

	for permutation in permutations:
		sorted_perm = ''.join(sorted(permutation.lower()))

		if sorted_perm in dictionary:
			result.append(dictionary[sorted_perm]) 

	## returns a set of words that apprear in the dict,
	## taking into account key subsets.
	return flatten(result) if len(result) > 0 else "No words found for " + key


if __name__ == '__main__':

	key = sys.argv[-2]
	path = sys.argv[-1]
	print start(key, path)







		



