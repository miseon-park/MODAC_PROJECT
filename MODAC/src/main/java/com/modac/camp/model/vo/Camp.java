package com.modac.camp.model.vo;

public class Camp {
	
	private String campNo;
	private String campName;
	private String location1;
	private String location2;
	private String address;
	private String campCall;
	private String campWeb;
	private String campContent;
	
	private String naturalAttri;
	
	
	
	
	public Camp() {
		super();
	}



	public Camp(String campNo, String campName, String location1, String location2, String address, String campCall,
			String campWeb, String campContent) {
		super();
		this.campNo = campNo;
		this.campName = campName;
		this.location1 = location1;
		this.location2 = location2;
		this.address = address;
		this.campCall = campCall;
		this.campWeb = campWeb;
		this.campContent = campContent;
	}
	
	
	
	public String getCampNo() {
		return campNo;
	}



	public void setCampNo(String campNo) {
		this.campNo = campNo;
	}



	public String getCampName() {
		return campName;
	}



	public void setCampName(String campName) {
		this.campName = campName;
	}



	public String getLocation1() {
		return location1;
	}



	public void setLocation1(String location1) {
		this.location1 = location1;
	}



	public String getLocation2() {
		return location2;
	}



	public void setLocation2(String location2) {
		this.location2 = location2;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCampCall() {
		return campCall;
	}



	public void setCampCall(String campCall) {
		this.campCall = campCall;
	}



	public String getCampWeb() {
		return campWeb;
	}



	public void setCampWeb(String campWeb) {
		this.campWeb = campWeb;
	}



	public String getCampContent() {
		return campContent;
	}



	public void setCampContent(String campContent) {
		this.campContent = campContent;
	}	
	
	
	
	public String getNaturalAttri() {
		return naturalAttri;
	}



	public void setNaturalAttri(String naturalAttri) {
		this.naturalAttri = naturalAttri;
	}



	@Override
	public String toString() {
		return "Camp [campNo=" + campNo + ", campName=" + campName + ", location1=" + location1 + ", location2="
				+ location2 + ", address=" + address + ", campCall=" + campCall + ", campWeb=" + campWeb
				+ ", campContent=" + campContent + ", naturalAttri=" + naturalAttri + "]";
	}



	// 캠핑장 조회 리스트
	public Camp(String campName, String address, String naturalAttri) {
		super();
		this.campName = campName;
		this.address = address;
		this.naturalAttri = naturalAttri;
	}
	
	
	// 캠핑장 세부 조회
	public Camp(String campName, String address, String campCall, String campWeb, String campContent) {
		super();
		this.campName = campName;
		this.address = address;
		this.campCall = campCall;
		this.campWeb = campWeb;
		this.campContent = campContent;
	}
	
	
}
