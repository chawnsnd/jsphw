package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import dao.EnrolmentDao;
import dao.StudentDao;
import model.Enrolment;
import model.Student;

public class CourseService {
	public List<Student> getEnrolStudent(int courseId) throws SQLException{
		List<Student> students = new ArrayList<>();
		EnrolmentDao enrolmentDao = new EnrolmentDao();
		enrolmentDao.connect();
		List<Enrolment> enrolments = enrolmentDao.selectEnrolmentByCourseId(courseId);
		enrolmentDao.disconnect();
		StudentDao studentDao = new StudentDao();
		studentDao.connect();
		for(Enrolment enrolment : enrolments) {
			Student student = studentDao.selectById(enrolment.getStudentId());
			students.add(student);
		}
		studentDao.disconnect();
		return new ArrayList<Student>(new HashSet<>(students));
	}

}
