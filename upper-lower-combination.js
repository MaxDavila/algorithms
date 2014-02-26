// Given a lowercase string 'ab',write a program to generate 
// all possible lowercase and uppercase combination 
// {'AB',‘Ab’,'aB' and 'ab' } 

function allCombination(str, accu, idx, result){
	// return if we are at the end of the string
	if (idx === str.length) 
		return result.push(accu.join(''));
	var ch = str[idx];

	// make two recursive calls to get every single combination--
	// upper/lower--until the end of the string
	accu[idx] = ch.toLowerCase();
	allCombination(str, accu, idx+1, result);

	accu[idx] = ch.toUpperCase();
	allCombination(str, accu, idx+1, result);
	
	return result
}


console.log(allCombination('ab', [], 0, []))