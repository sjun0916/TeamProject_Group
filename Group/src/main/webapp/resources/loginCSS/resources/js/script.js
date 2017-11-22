function goPage(url, pages, lines, sortItem, sortMethod, keyfield, keyword, compare) {
	
	//alert("####");
	
	url += '?' + "pages=" + pages + "&lines=" + lines + "&sort_item=" + sortItem + "&sort_method=" + sortMethod + "&keyfield=" + keyfield + "&keyword=" + keyword + "&compare=" + compare;
	
	//alert("url = " + url);
	
	location.href = url;	
}