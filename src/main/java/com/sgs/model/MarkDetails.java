package com.sgs.model;

public class MarkDetails {
	private int markId;
	private int studentId;
	private int semesterId;
	private String department;
	private String subjectName;
	private int mark;

	public MarkDetails() {
		super();
	}

	public int getMarkId() {
		return markId;
	}

	public void setMarkId(int markId) {
		this.markId = markId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getSemesterId() {
		return semesterId;
	}

	public void setSemesterId(int semesterId) {
		this.semesterId = semesterId;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	@Override
	public String toString() {
		return "MarkDetails [markId=" + markId + ", studentId=" + studentId + ", semesterId=" + semesterId
				+ ", department=" + department + ", subjectName=" + subjectName + ", mark=" + mark + "]";
	}

	

}
