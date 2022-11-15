package com.modac.recipe.model.vo;

import java.sql.Date;

public class Attachment {

	private String photoNo;
	private String postNo;
	private String originName;
	private String newName;
	private String path;
	private Date uploadDate;
	private String status;
	private String fileLevel;
	private String boardNo;
	
	public Attachment() {
		super();
	}

	public Attachment(String photoNo, String postNo, String originName, String newName, String path, Date uploadDate,
			String status, String fileLevel, String boardNo) {
		super();
		this.photoNo = photoNo;
		this.postNo = postNo;
		this.originName = originName;
		this.newName = newName;
		this.path = path;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
		this.boardNo = boardNo;
	}

	public String getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(String photoNo) {
		this.photoNo = photoNo;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
}
