package com.example.albamen.dto.company;

import java.util.Date;

public class BranchDTO{
	private int bno;
	private int cno;
	private String bname;
	private String btel;
	private String post;
	private String address;
	private Date regDate;

	@Override
	public String toString() {
		return "BranchDTO{" +
				"bno=" + bno +
				", cno=" + cno +
				", bname='" + bname + '\'' +
				", btel='" + btel + '\'' +
				", post='" + post + '\'' +
				", address='" + address + '\'' +
				", regDate=" + regDate +
				'}';
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBtel() {
		return btel;
	}

	public void setBtel(String btel) {
		this.btel = btel;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
