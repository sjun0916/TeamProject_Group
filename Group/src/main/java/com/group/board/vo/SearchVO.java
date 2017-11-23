package com.group.board.vo;


public class SearchVO extends  PageVO  {

    private String bgno;                       // 게시판 그룹
    private String searchKeyword = "";         // 검색 키워드
    private String searchType = "";            // 검색 필드: 제목, 내용  
    private String[] searchTypeArr;            // 검색 필드를 배열로 변환
    private String category1;
    public String getBgno() {
        return bgno;
    }

    public void setBgno(String bgno) {
        this.bgno = bgno;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }
    
    public void setSearchKeyword(String searchKeyword) {
    	System.out.println("searchKeyword set: "+searchKeyword);
        this.searchKeyword = searchKeyword;
    }
   
    public String getSearchType() {
        return searchType;
    }
    
    public void setSearchType(String searchType) {
    	System.out.println("searchType set:"+searchType);
        this.searchType = searchType;
    }
    
    public String[] getSearchTypeArr() {
        return searchType.split(",");
    }

	public String getCategory1() {
		
		return category1;
	}

	public void setCategory1(String category1) {
		
//    	String cat = category1;
//    	cat = cat.substring(0, cat.length()-1);
    	this.category1 = category1;
    	System.out.println("category1 set:"+this.category1);
	
	}
    
}
 