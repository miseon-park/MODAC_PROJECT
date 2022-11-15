package com.modac.campReview.model.vo;

public class ReviewTag {
	
	private String postNo;
	private Number tagNo;
	
	public ReviewTag(){
		super();
	}

	public ReviewTag(String postNo, Number tagNo) {
		super();
		this.postNo = postNo;
		this.tagNo = tagNo;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public Number getTagNo() {
		return tagNo;
	}

	public void setTagNo(Number tagNo) {
		this.tagNo = tagNo;
	}
	
	
	
	
	
}
