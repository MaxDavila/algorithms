// Given a lowercase string 'ab',write a program to generate 
// all possible lowercase and uppercase combination 
// {'AB',‘Ab’,'aB' and 'ab' } 

function allCombination(str, accu, idx, result){
	if (idx === str.length) 
		return result.push(accu.join(''));
	var ch = str[idx];

	accu[idx] = ch.toLowerCase();

	allCombination(str, accu, idx+1, result);

	accu[idx] = ch.toUpperCase();
	allCombination(str, accu, idx+1, result);
	return result


}


console.log(allCombination('abcd', [], 0, []))