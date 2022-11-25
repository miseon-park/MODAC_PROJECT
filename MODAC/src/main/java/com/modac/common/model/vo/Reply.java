package com.modac.common.model.vo;

import java.sql.Date;

public class Reply {

	private String boardNo;
	private String postNo;
	private String replyNo;
	private String replyContent;
	private String writer;
	private String hiddenReply;
	private Date createDate;
	private String status;
	
	public Reply() {
		super();
	}
	
	public Reply(String boardNo, String postNo, String replyNo, String replyContent, String writer, String hiddenReply,
			Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.writer = writer;
		this.hiddenReply = hiddenReply;
		this.createDate = createDate;
		this.status = status;
	}

	// 더 추가할것

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


	public String getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getHiddenReply() {
		return hiddenReply;
	}


	public void setHiddenReply(String hiddenReply) {
		this.hiddenReply = hiddenReply;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Reply [boardNo=" + boardNo + ", postNo=" + postNo + ", replyNo=" + replyNo + ", replyContent="
				+ replyContent + ", writer=" + writer + ", hiddenReply=" + hiddenReply + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}

	
	
	
}
