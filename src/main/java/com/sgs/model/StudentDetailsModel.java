package com.sgs.model;

import java.sql.Date;

public class StudentDetailsModel {
	private int studentId;
	private String rollNo;
	private String name;
	private Date dob;
	private String gender;
	private String fatherName;
	private int semester;
	private String department;

	public StudentDetailsModel() {
		super();
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	@Override
	public String toString() {
		return "StudentDetailsModel [studentId=" + studentId + ", rollNo=" + rollNo + ", name=" + name + ", dob=" + dob
				+ ", gender=" + gender + ", fatherName=" + fatherName + ", semester=" + semester + ", department="
				+ department + "]";
	}
}
