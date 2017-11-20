package com.group.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("memverVO")
public class MemberVO {
	private String id;
	private String pw;
	private String name; 
	private String email; 
	private Timestamp regDate;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	// toString()
    @Override
    public String toString() {
        return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email="
                + email + ", regDate=" + regDate + "]";
    }
	
}
