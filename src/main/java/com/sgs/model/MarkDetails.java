package com.sgs.model;

public class MarkDetails {
	private int markId;
	private int studentId;
	private int semesterId;
	private String department;
	private int subjectId;
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

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
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
				+ ", department=" + department + ", subjectId=" + subjectId + ", mark=" + mark + "]";
	}

}
