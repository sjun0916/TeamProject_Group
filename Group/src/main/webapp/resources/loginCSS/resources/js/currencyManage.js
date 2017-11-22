//출처 : http://javaroid.tistory.com/15

//해당 파라미터를 3자리씩 구분하여 자르는 함수
function currencyCheck(obj) {
	
//	조건 맞지 않을 경우 false return
	if ((event.keyCode < 48) || (event.keyCode > 57)) {
		event.returnValue = false;
	}
	
	var val = obj.value.replace(/, /g, "");
	var val2 = val.substr(0, 1);
	var val3 = val.length;
	
	alert('currencyCheck val : ' + val);
	alert('currencyCheck val2 : ' + val2);
	alert('currencyCheck val3 : ' + val3);
	
	if (val2 == 0) {
		val = val.substr(1, val3);
		
		alert('currencyCheck if val : ' + val);
	}
	
	obj.value = currencyFormat(val);
}

//3자리씩 구분하여 자른 파라미터들 사이에 콤마를 삽입하는 함수
function currencyFormat(num) {
	var reg = /(^[+-]?\d+)(\d{3})/;
	
//	숫자 > 문자 파싱
	num = String(num);
	
	while (reg.test(num)) {
		num = num.replace(reg, '$1' + ',' + '$2');
	}
	
	alert('currencyFormat num : ' + num);
	
	return num;
}