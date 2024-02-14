package com.sgs.model;

public class MarkViewModel {
	private String rollNo;
	private String name;
	private String department;
	private int semesterId;
	private int mark;
	private String subjectName;

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getSemesterId() {
		return semesterId;
	}

	public void setSemesterId(int semesterId) {
		this.semesterId = semesterId;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "MarkViewModel [rollNo=" + rollNo + ", name=" + name + ", department=" + department + ", semesterId="
				+ semesterId + ", mark=" + mark + ", subjectName=" + subjectName + "]";
	}

}
