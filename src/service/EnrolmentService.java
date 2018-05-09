package service;

import java.sql.SQLException;
import java.util.List;

import dao.EnrolmentDao;
import model.Course;
import util.DuplicateException;


public class EnrolmentService {
	public void enroll(int studentId, int courseId) throws SQLException{
		StudentService studentService = new StudentService();
		List<Course> courses = studentService.getEnrolCourse(studentId);
		for(Course course : courses) {
			if(course.getCourseId() == courseId) {
				throw new DuplicateException();
			}
		}
		EnrolmentDao enrolmentDao = new EnrolmentDao();
		enrolmentDao.connect();
		enrolmentDao.create(studentId, courseId);
		enrolmentDao.disconnect();
	}
}
