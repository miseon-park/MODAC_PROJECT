package com.modac.member.model.vo;

import java.util.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNic;
	private String status;
	private Date inDate;
	private Date modiDate;
	
	
	
	
	
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNic, String status,
			Date inDate, Date modiDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNic = memberNic;
		this.status = status;
		this.inDate = inDate;
		this.modiDate = modiDate;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberNic=" + memberNic + ", status=" + status + ", inDate=" + inDate + ", modiDate="
				+ modiDate + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNic() {
		return memberNic;
	}
	public void setMemberNic(String memberNic) {
		this.memberNic = memberNic;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getModiDate() {
		return modiDate;
	}
	public void setModiDate(Date modiDate) {
		this.modiDate = modiDate;
	}
	
	
}
