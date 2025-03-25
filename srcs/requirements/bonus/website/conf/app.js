
/* Can Do

let $ = 'test';
let $num = 42;
let num$ = -42;
let _ = 22;
let _num = -22;
let num_ = 33;
let camelCase = 1;
let num42 = 42;
*/

/* Restricred
let 42num = 11;
let my-num = 2;
let const 
*/

const resultElement = document.getElementById('result');
const input1 = document.getElementById('input1');
const input2 = document.getElementById('input2');
const submitBtn = document.getElementById('submit');
const plusBtn = document.getElementById('plus');
const minusBtn = document.getElementById('minus');
const multiplierBtn = document.getElementById('multiplier');
const divideBtn = document.getElementById('divide');
let action = '+';


plusBtn.onclick = function() {
	action = '+';
}

minusBtn.onclick = function() {
	action = '-';
}

multiplierBtn.onclick = function() {
	action = '*';
}

divideBtn.onclick = function() {
	action = '/';
}

function printfResult(result) {
	if(result < 0) {
		resultElement.style.color = 'red';
	} else {
		resultElement.style.color = 'green';
	}
	resultElement.textContent = result;
}

function computeNumbersWithAction (inp1, inp2, actionSymbol) {
	const num1 = Number(inp1.value);
	const num2 = Number(inp2.value);
	
	switch(actionSymbol) {
		case '+':
			return num1 + num2;
		case '-':
			return num1 - num2;
		case '*':
			return num1 * num2;
		case '/':
			return num2 !== 0 ? num1 / num2 : 'Ошибка деления на ноль';
		default:
			return 'Неизвестная операция';
	}
}

submitBtn.onclick = function() {
	const result = computeNumbersWithAction(input1, input2, action);
	printfResult(result);
}


