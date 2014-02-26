// Find the longest palindrome substring 

function longestPalindromeSub(string) {
	var result = [];
	for (var i = 0; i < string.length; i++) {
		for (var j = 0 ; j < string.length; j++) {
			var substr = string.substr(i, j+1)
			if ((substr.length > 1) && (result.indexOf(substr) === -1) && isPalindrome(substr))
				result.push(substr)
		}
	}
	return result
}

function isPalindrome(string) {
	return string.split('').reverse().join('') === string
}

console.log(longestPalindromeSub('aabaa'))