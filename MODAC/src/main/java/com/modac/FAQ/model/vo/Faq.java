package com.modac.FAQ.model.vo;

public class Faq {

	private int faqNo;
	private int faqTitle;
	private String faqContent;
	private String faqWriter;
	
	public Faq() {
		super();
	}
	
	public Faq(int faqNo, int faqTitle, String faqContent, String faqWriter) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(int faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqWriter="
				+ faqWriter + "]";
	}
	
	
	
}
