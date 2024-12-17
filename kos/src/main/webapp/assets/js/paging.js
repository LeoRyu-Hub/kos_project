function setPaging(id,startPage, endPage,fn, countPerPage){
	if(countPerPage==undefined){
		countPerPage=10;
	}
	
	$(id).empty();
	
	var isNext=false;
	
	if(startPage+countPerPage<=endPage){
		endPage=startPage+countPerPage-1;
		isNext=true;
	}
	
	str = "<li class=\"page-item\">";
	if(startPage>1){
    	str+= "	<a class=\"page-link\" href=\"#\" aria-label=\"Previous\" onclick=\""+fn+"("+(startPage-1)+");\">";
    }else{
		str+= "	<a class=\"page-link\" aria-label=\"Previous\" >";
	}
    str+= "     	<span aria-hidden=\"true\">&laquo;</span>";
    str+= "     </a>";
    str+= "</li>";
    
    for(var i=startPage;i<=endPage;i++){
    	str+= "<li class=\"page-item\"><a class=\"page-link\" href=\"#\" onclick=\""+fn+"("+i+");\">"+i+"</a></li>";
    }
    str+= "<li class=\"page-item\">";
    if(isNext){
	    str+= "		<a class=\"page-link\" href=\"#\" aria-label=\"Next\" onclick=\""+fn+"("+(endPage+1)+");\">";
    }else{
		str+= "		<a class=\"page-link\" aria-label=\"Next\">";
	}
    str+= "     	<span aria-hidden=\"true\">&raquo;</span>";
    str+= "		</a>";
    str+= "</li>";
	$(id).append(str);
}