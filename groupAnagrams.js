// Given a list of words, write a function which
// takes in the list, and groups the words together
// according to which ones are anagrams of eachother.
// Runnig time must be O(n)
// e.g.
// input = ["art", "rat", "bats", "banana", "stab", "tar"]
// output = [["art", "rat", "tar], ["bats", "stab"], ["banana"]]

function groupAnagrams(array){
	var dict = {},
			result = [];

	// travere the array and store the words in a hash table
	// where the key is the sorted word itself.
	array.forEach( function(word){
		var sorted_word = word.split('').sort().join('');
		
		if (dict[sorted_word] === undefined)
			dict[sorted_word] = [word];
		else 
			dict[sorted_word].push(word);
		
	});

	// convert dictionary to array of arrays
	for(var el in dict) {
		result.push(dict[el]);
	}
	return result;
}

console.log(groupAnagrams(["art", "rat", "bats", "banana", "stab", "tar"]))