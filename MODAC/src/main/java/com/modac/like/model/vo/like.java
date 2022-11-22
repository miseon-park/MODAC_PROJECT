package com.modac.like.model.vo;

public class like {
	private String memberNo;
	private String postNo;
	
	public like() {
		super();
	}
	

	public String getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}


	public like(String memberNo, String postNo) {
		super();
		this.memberNo = memberNo;
		this.postNo = postNo;
	}


	@Override
	public String toString() {
		return "like [memberNo=" + memberNo + ", postNo=" + postNo + "]";
	}


	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	

	public like(String postNo) {
		super();
		this.postNo = postNo;
	}
	
	
}
