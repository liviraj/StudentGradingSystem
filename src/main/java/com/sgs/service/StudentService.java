package com.sgs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sgs.dbconnection.DbConnection;
import com.sgs.model.StudentDetailsModel;

public class StudentService {
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	public ArrayList<StudentDetailsModel> getStudentList() throws ClassNotFoundException {
		ArrayList<StudentDetailsModel> studentList = new ArrayList<StudentDetailsModel>();
		try {
			con = DbConnection.getConnection();
			st = (Statement) con.createStatement();
			String query = "select * from studentdetails";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				StudentDetailsModel studentModel = new StudentDetailsModel();
				studentModel.setStudentId(rs.getInt("studentId"));
				studentModel.setRollNo(rs.getString("rollNo"));
				studentModel.setName(rs.getString("name"));
				studentModel.setGender(rs.getString("gender"));
				studentModel.setFatherName(rs.getString("fatherName"));
				studentModel.setDob(rs.getDate("dob"));
				studentModel.setSemester(rs.getInt("semester"));
				studentModel.setDepartment(rs.getString("department"));
				studentModel.setCompletedYear(rs.getString("completedYear"));
				
				studentList.add(studentModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentList;
	}

	public StudentDetailsModel getStudentById(int id) throws ClassNotFoundException {
		StudentDetailsModel studentModel = new StudentDetailsModel();
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("select * from studentdetails where studentId='" + id + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				studentModel.setStudentId(rs.getInt("studentId"));
				studentModel.setRollNo(rs.getString("rollNo"));
				studentModel.setName(rs.getString("name"));
				studentModel.setGender(rs.getString("gender"));
				studentModel.setFatherName(rs.getString("fatherName"));
				studentModel.setDob(rs.getDate("dob"));
				studentModel.setSemester(rs.getInt("semester"));
				studentModel.setDepartment(rs.getString("department"));
				studentModel.setCompletedYear(rs.getString("completedYear"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentModel;
	}

	public int deleteServer(int id) throws ClassNotFoundException, SQLException {
		int status = 0;
		String deleteMarks = "delete from markdetails where studentId=" + id + "";
		String query = "delete from studentdetails where studentId=" + id + "";
		con = DbConnection.getConnection();
		PreparedStatement psDelete = (PreparedStatement) con.prepareStatement(deleteMarks);
		int marksDelStatus = psDelete.executeUpdate();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		status = ps.executeUpdate();
		return status;
	}

	public ArrayList<StudentDetailsModel> getStudentList2() throws ClassNotFoundException {
		ArrayList<StudentDetailsModel> studentList = new ArrayList<StudentDetailsModel>();
		try {
			con = DbConnection.getConnection();
			st = (Statement) con.createStatement();
			String query = "select * from studentdetails";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				StudentDetailsModel studentModel = new StudentDetailsModel();
				studentModel.setStudentId(rs.getInt("studentId"));
				studentModel.setRollNo(rs.getString("rollNo"));
				studentModel.setName(rs.getString("name"));
				studentModel.setGender(rs.getString("gender"));
				studentModel.setFatherName(rs.getString("fatherName"));
				studentModel.setDob(rs.getDate("dob"));
				studentModel.setSemester(rs.getInt("semester"));
				studentModel.setDepartment(rs.getString("department"));
				studentModel.setCompletedYear(rs.getString("completedYear"));
				
				studentList.add(studentModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentList;
	}

	public int insertStudentDetails(StudentDetailsModel studentModel) {
		int status = 0;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"insert into studentdetails(rollNo,name,dob,gender,fatherName,semester,department, completedYear) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, studentModel.getRollNo());
			ps.setString(2, studentModel.getName());
			ps.setDate(3, studentModel.getDob());
			ps.setString(4, studentModel.getGender());
			ps.setString(5, studentModel.getFatherName());
			ps.setInt(6, studentModel.getSemester());
			ps.setString(7, studentModel.getDepartment());
			ps.setString(8, studentModel.getCompletedYear());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int updateServer(StudentDetailsModel studentModel) throws ClassNotFoundException {
		int status = 0;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"update studentdetails set rollNo=?,name=?,dob=?,gender=?,fatherName=?,semester=?, department=?, completedYear=?  where studentId='"
							+ studentModel.getStudentId() + "'");
			ps.setString(1, studentModel.getRollNo());
			ps.setString(2, studentModel.getName());
			ps.setDate(3, studentModel.getDob());
			ps.setString(4, studentModel.getGender());
			ps.setString(5, studentModel.getFatherName());
			ps.setInt(6, studentModel.getSemester());
			ps.setString(7, studentModel.getDepartment());
			ps.setString(8, studentModel.getCompletedYear());
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public String rollNoCheck(String rollNo) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			st = (Statement) con.createStatement();
			rs = st.executeQuery("select rollNo from studentdetails where  rollNo = '" + rollNo + "'");
			if (rs.next()) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "failed";
	}
}
