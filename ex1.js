// Given a lowercase string 'ab',write a program to generate 
// all possible lowercase and uppercase combination 
// {'AB',‘Ab’,'aB' and 'ab } 

function allCombination(str){
	result = [str]
	for (var i = 0; i < str.length; i++){
		var strArray = str.split('');
		result.push(generateLower(strArray.slice(0), i));
		result.push(generateUpper(strArray, i));
	}
	result.push(str.toUpperCase())
	return result;
}

function generateUpper(str, idx) {
	return str.map(function(el, index){
		if (index === idx) return el;
		return el.toUpperCase();
	}).join('');
}

function generateLower(str, idx) {
	str.splice(idx, 1, str[idx].toUpperCase());
	return str.join('');
}

console.log(allCombination('abc'))