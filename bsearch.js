function bsearch(ary, num) {
	var middle = parseInt(ary.length / 2);
	console.log(middle, ary) 
	if (ary[middle] === num) return middle;
	if (ary.length < 2) return -1;

	if (num > ary[middle]) {
		middle += bsearch(ary.slice(middle + 1, ary.length), num) + 1; 
	} 
	else
		middle = bsearch(ary.slice(0, middle), num);
	return middle
}

var ary = [2, 4, 6, 8, 10, 21]
console.log(bsearch(ary, 21))
