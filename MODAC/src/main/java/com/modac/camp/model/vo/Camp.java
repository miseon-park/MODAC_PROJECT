package com.modac.camp.model.vo;

public class Camp {
	private String location_1;
	private String location_2;
	private String campName;
	private String address;
	private String campNo;
	private String campCall;
	private String campWeb;
	private String campContent;
	
	
	private String naturalAttri;
	
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
	@Override
	public String toString() {
		return "Camp [location_1=" + location_1 + ", location_2=" + location_2 + ", campName=" + campName + ", address="
				+ address + ", campNo=" + campNo + ", campCall=" + campCall + ", campWeb=" + campWeb + ", campContent="
				+ campContent + "]";
	}


	public Camp(String location_1, String location_2) {
		super();
		this.location_1 = location_1;
		this.location_2 = location_2;
	}


	public Camp() {
		super();
	}
	
	
	public Camp(String location_1, String location_2, String campName, String address, String campNo, String campCall,
			String campWeb, String campContent) {
		super();
		this.location_1 = location_1;
		this.location_2 = location_2;
		this.campName = campName;
		this.address = address;
		this.campNo = campNo;
		this.campCall = campCall;
		this.campWeb = campWeb;
		this.campContent = campContent;
	}
	public String getNaturalAttri() {
		return naturalAttri;
	}



	public void setNaturalAttri(String naturalAttri) {
		this.naturalAttri = naturalAttri;
	}
	public String getLocation_1() {
		return location_1;
	}
	public void setLocation_1(String location_1) {
		this.location_1 = location_1;
	}
	public String getLocation_2() {
		return location_2;
	}
	public void setLocation_2(String location_2) {
		this.location_2 = location_2;
	}
	public String getCampName() {
		return campName;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCampNo() {
		return campNo;
	}
	public void setCampNo(String campNo) {
		this.campNo = campNo;
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
	
	
	
}
