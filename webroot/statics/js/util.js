function isEmpty(str){
	if(str==null || $.trim(str).length==0){
		return true;
	}
	return false;
}

function isNotEmpty(str){
	return !isEmpty(str);
}