/*function sum(n) {
var kek = 0;
for(var i=10; i<=20; i++){
	kek +=i;
	console.log(i*i);
}
	return kek;
}
console.log( sum(20) );
*/

function buttonClick(){
	var resultDiv = document.getElementById('result');
	var x1 = document.getElementById('x1').value;
	var x2 = document.getElementById('x2').value;
	var x3 = parseInt(x1);
	var x4 = parseInt(x2);
	resultDiv.innerHTML = "";
	
	if(x1 === '' || x2 === ''){
		alert("Поля x1 и x2 должны быть заполнены.");
	} else if(Number.isNaN(x3) || Number.isNaN(x4)){
		alert("В поля х1 и х2 должны быть введены только числовые значения.");
	 
	} else {
		let operatorType = getCheckedRadioValue("operatorType");

		let resultByOperator = getRowByOperator(x3, x4, operatorType);
		let sumRow = getRowByOperator(x3, x4, "+");

		resultDiv.append("x1 + x2 = " + sumRow + ", result of selected operation " + resultByOperator);
	}
}

function getRowByOperator(numberFrom, numberTo, operatorType){
	let sum = numberFrom;
	for(let i=numberFrom; i<=numberTo; i++) {
		if (i === numberFrom) {
			continue;
		}

		switch (operatorType){
			case "+":
				sum = sum + i;
				break;
			case "*":
				sum = sum * i;
				break;
		}
	}
	return sum;
}

function reset (){
	document.getElementById("x1").value = "";
	document.getElementById("x2").value = "";
}

function getCheckedRadioValue(name) {
    var elements = document.getElementsByName(name);

    for (var i=0, len=elements.length; i<len; ++i)
        if (elements[i].checked) return elements[i].value;
}










