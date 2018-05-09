package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import dao.CourseDao;
import dao.EnrolmentDao;
import model.Course;
import model.Enrolment;
import model.Student;

public class StudentService {

	public List<Course> getEnrolCourse(int studentId) throws SQLException{
		List<Course> courses = new ArrayList<>();
		EnrolmentDao enrolmentDao = new EnrolmentDao();
		enrolmentDao.connect();
		List<Enrolment> enrolments = enrolmentDao.selectEnrolmentByStudentId(studentId);
		enrolmentDao.disconnect();
		CourseDao courseDao = new CourseDao();
		courseDao.connect();
		for(Enrolment enrolment : enrolments) {
			Course course = courseDao.selectById(enrolment.getCourseId());
			courses.add(course);
		}
		courseDao.disconnect();
		return new ArrayList<Course>(new HashSet<>(courses));
	}
}
