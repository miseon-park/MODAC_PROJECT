package com.modac.campReview.model.vo;

import java.sql.Date;

public class CampReview {
	
	private String boardNo;
	private String postNo;
	private String postTitle;
	private String postContent;
	private String memberNo;
	private Date createDate;
	private int readCount;
	private int tagNo;
	private String status;
	private String reportNo;
	

	public CampReview(String boardNo, String postNo, String postTitle, String postContent, String memberNo,
			Date createDate, int readCount, int tagNo, String status, String reportNo) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.memberNo = memberNo;
		this.createDate = createDate;
		this.readCount = readCount;
		this.tagNo = tagNo;
		this.status = status;
		this.reportNo = reportNo;
	}
	
	//목록
	public CampReview(String postNo, String postTitle, String memberNo,
			Date createDate, int readCount) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.memberNo = memberNo;
		this.createDate = createDate;
		this.readCount = readCount;
	}
	
	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}

	@Override
	public String toString() {
		return "CampReview [boardNo=" + boardNo + ", postNo=" + postNo + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", memberNo=" + memberNo + ", createDate=" + createDate + ", readCount=" + readCount
				+ ", tagNo=" + tagNo + ", status=" + status + ", reportNo=" + reportNo + "]";
	}
	
	
	

}
