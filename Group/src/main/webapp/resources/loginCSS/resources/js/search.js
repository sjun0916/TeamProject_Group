// 검색기능
function searchCheck(form) {
		
	if (form.keyword.value == "") {
		alert("검색할 단어를 입력하세요.");
		form.keyword.focus();
		
		return;
	}
		
	// @ 아주중요
	// http://kftc.local:8088/test.jsp?gg=1
	//
	// window.location.hostname;   // => kftc.local
	// window.location.href;       // => http://kftc.local:8088/test.jsp
	// window.location.host;       // => kftc.local:8088
	// window.location.port;       // => 8088
	// window.location.pathname;   // => test.jsp
	// window.location.search;     // => ?gg=1 
	// window.location.protocol;   // => http: 
		
	form.action += "<c:url value='pa/listAll/'>";
	form.action += "?keyfield=" + form.keyfield.value;
	form.action += "&compare=" + document.querySelector('input[name = "compare"]:checked').value;
	form.action += "&keyword=" + form.keyword.value;
	
	form.method = "get";
	
	//alert('form.action = ' + form.action);
	
	form.submit();
}

function initSelectOptionRadio(lines, sortItem, sortMethod) {
	
	// SelectOption : list count
	// var select_list_count = "<%=request.getParameter("lines")%>";
	var select_list_count = getQueryParam("lines");
	
//	alert("lines = " + lines);
	
	var length = document.getElementById("select_list_count").options.length;		
	
	for (var i = 0; i < length; i++) {
		if (document.getElementById("select_list_count").options[i].value == select_list_count.toString()) {
			document.getElementById("select_list_count").options[i].selected = true;
		}
	}
	
	// SelectOption : sort item
	//var sort_item = "<%=request.getParameter("sort_item")%>";
	var sort_item = sortItem;
	var length = document.getElementById("select_sort_item").options.length;

	for (var i = 0; i < length; i++) {
		if (document.getElementById("select_sort_item").options[i].value == sort_item.toString()) {
			document.getElementById("select_sort_item").options[i].selected = true;				
		}
	}
	
	var sort_method = sortMethod;
	
	//alert("sort_method = " + sort_method);
	
	if (sort_method != false) {
		document.getElementById(sort_method).checked = true;
	} else {
		document.getElementById("ASC").checked = true;
	}
}

// ~개씩 보기가 변경되는 경우
function changeSelectOptionListCount(servletPath, selectedIndex) {

	var url = servletPath;
	
	alert('url = ' + url);
	//alert('search = ' + window.location.search);		
	
	url = addUrlParam(url, "lines", document.getElementById("select_list_count").options[selectedIndex].value);
	
	if (getQueryParam("sort_item") != false)
		url = addUrlParam(url, "sort_item", getQueryParam("sort_item"));
	
	if (getQueryParam("sort_method") != false)
		url = addUrlParam(url, "sort_method", getQueryParam("sort_method"));
	
	if (getQueryParam("keyfield") != false) {
		url = addUrlParam(url, "keyfield", getQueryParam("keyfield"));
		url = addUrlParam(url, "compare", getQueryParam("compare"));
		url = addUrlParam(url, "keyword", getQueryParam("keyword"));
	}
	
	alert('url = ' + url);
	
	window.location.href = url;
}

//@변경전
// 	function changeSelectOptionSortItem(selectedIndex) {
	
// 		var length = document.getElementById("select_sort_item").options.length;
// 		document.getElementById("select_sort_item").options[selectedIndex].selected = true;	
	
// 		var url = 'list_paging.jsp';
	
// 		if (getQueryParam("lines") != false) {
// 			url += '?lines=' + getQueryParam("lines");
// 			url += '&sort_item=' + document.getElementById("select_sort_item").options[selectedIndex].value;
// 		}
// 		else
// 			url += '?sort_item=' + document.getElementById("select_sort_item").options[selectedIndex].value;		

// 		window.location.href = url;
// 	}
//@변경후
function changeSelectOptionSortItem(selectedIndex) {
	
	//document.getElementById("select_sort_item").options[selectedIndex].selected = true;	
	
	var url = "<c:url value='pa/listAll/'>";
	//var url = window.location.href;
	
	if (getQueryParam("lines") != false)
		url = addUrlParam(url, "lines", getQueryParam("lines"));
		
	url = addUrlParam(url, "sort_item", document.getElementById("select_sort_item").options[selectedIndex].value);
	
	if (getQueryParam("sort_method") != false)
		url = addUrlParam(url, "sort_method", getQueryParam("sort_method"));
	
	if (getQueryParam("keyfield") != false) {
		url = addUrlParam(url, "keyfield", getQueryParam("keyfield"));
		url = addUrlParam(url, "compare", getQueryParam("compare"));
		url = addUrlParam(url, "keyword", getQueryParam("keyword"));
	}

	window.location.href = url;
}	

// 검색방법
function changeRadioSortMethod(selectedRadio) {
	var url = "<c:url value='pa/listAll/'>";
	//var url = window.location.href;
	
	if (getQueryParam("lines") != false)
		url = addUrlParam(url, "lines", getQueryParam("lines"));

	if (getQueryParam("sort_item") != false)
		url = addUrlParam(url, "sort_item", getQueryParam("sort_item"));
	
	url = addUrlParam(url, "sort_method", selectedRadio);
	
	if (getQueryParam("keyfield") != false) {
		url = addUrlParam(url, "keyfield", getQueryParam("keyfield"));
		url = addUrlParam(url, "compare", getQueryParam("compare"));
		url = addUrlParam(url, "keyword", getQueryParam("keyword"));
	}
	
	window.location.href = url;
}

// 인터넷에서 구한 소스코드
function getQueryParam(param) {
	
    var result =  window.location.search.match(
        new RegExp("(\\?|&)" + param + "(\\[\\])?=([^&]*)")
    );

    return result ? result[3] : false;
}

// 인터넷에서 구한 소스코드
// URL Parameter를 만들어준다
function addUrlParam(url, key, value) {
    var newParam = key+"="+value;
    var result = url.replace(new RegExp("(&|\\?)"+key+"=[^\&|#]*"), '$1' + newParam);
    
    if (result === url) { 
        result = (url.indexOf("?") != -1 ? url.split("?")[0]+"?"+newParam+"&"+url.split("?")[1] 
           : (url.indexOf("#") != -1 ? url.split("#")[0]+"?"+newParam+"#"+ url.split("#")[1] 
              : url+'?'+newParam));
    }
    
    return result;
}