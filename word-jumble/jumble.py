import sys


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

def generate_permutations(word):
	permutations = []
	
	for i in range(len(word)):
		for j in range(len(word)):
			current_perm = ''.join(word[ i: j+1])

			if len(current_perm) > 0:
				permutations.append(current_perm) 
	return permutations

def flatten(l):
	return set(item for sublist in l for item in sublist)



def start(key, path):
	result = []
	dictionary = populate_dict(path)
	permutations = generate_permutations(key)

	for permutation in permutations:
		sorted_perm = ''.join(sorted(permutation.lower()))

		if sorted_perm in dictionary:
			result.append(dictionary[sorted_perm]) 
	
	return flatten(result) if len(result) > 0 else "No words found for " + key




if __name__ == '__main__':

	key = sys.argv[-2]
	path = sys.argv[-1]
	print start(key, path)







		



