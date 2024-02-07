package com.sgs.model;

public class SubjectDetails {
	private int subjectId;
	private String subjectCode;
	private String subjectName;
	private String department;
	private int semesterId;

	public SubjectDetails() {
		super();
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
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

	@Override
	public String toString() {
		return "SubjectDetails [subjectId=" + subjectId + ", subjectCode=" + subjectCode + ", subjectName="
				+ subjectName + ", department=" + department + ", semesterId=" + semesterId + "]";
	}

}
