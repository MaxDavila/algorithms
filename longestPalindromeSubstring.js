// Find the longest palindrome substring 
// Ideal solution is O(n^2)


// This solution is O(n^3)
function longestPalindromeSub(string) {
	var result = [];
	for (var i = 0; i < string.length; i++) {
		for (var j = 0 ; j < string.length; j++) {
			var substr = string.substr(i, j+1)
			if ((substr.length > 1) && (result.indexOf(substr) === -1) && isPalindrome(substr))
				result.push(substr)
		}
	}
	return result.sort(function(a,b){
		return a - b;
	}).pop()
}

function isPalindrome(string) {
	return string.split('').reverse().join('') === string
}

console.log(longestPalindromeSub('aabaa'))
console.log(longestPalindromeSub('abacdgfdcaba'))