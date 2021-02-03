package com.example.albamen.dto.company;

import com.example.albamen.dto.security.AuthDTO;

import java.util.Date;
import java.util.List;

public class CompanyDTO{

	private int cno;
	private String id;
	private String password;
	private String name;
	private String ceo;
	private Date regDate;
	private int cStatus;

	private List<BranchDTO> branchList;
	private List<AuthDTO> authList;

	public boolean hasAuth(String role){
		for (AuthDTO auth: authList){
			if (auth.isAuth(role)){
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "CompanyDTO{" +
				"cno=" + cno +
				", id='" + id + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", ceo='" + ceo + '\'' +
				", regDate=" + regDate +
				", cStatus=" + cStatus +
				", branchList=" + branchList +
				", authList=" + authList +
				'}';
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getcStatus() {
		return cStatus;
	}

	public void setcStatus(int cStatus) {
		this.cStatus = cStatus;
	}

	public List<BranchDTO> getBranchList() {
		return branchList;
	}

	public boolean searchBranchList(int bno){
		int temp = 0;
		for(int i=0; i<branchList.size(); i++){
			temp = branchList.get(i).getBno();
			if(temp == bno){
				return true;
			}
		}
		return false;
	}

	public void setBranchList(List<BranchDTO> branchList) {
		this.branchList = branchList;
	}

	public List<AuthDTO> getAuthList() {
		return authList;
	}

	public void setAuthList(List<AuthDTO> authList) {
		this.authList = authList;
	}
}
