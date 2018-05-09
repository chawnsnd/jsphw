-- DB 생성
create database dankook default character set UTF8;

-- 계정 생성
create user 'dankook'@localhost identified by 'dankookpw';
create user 'dankook'@'%' identified by 'dankookpw';

-- 권한부여
grant all privileges on dankook.* to  'dankook'@localhost identified by 'dankookpw';
grant all privileges on dankook.* to  'dankook'@'%' identified by 'dankookpw';

-- DB 이동
use dankook;

-- course 테이블 생성
create table `course`(
	`course_id` int not null comment '강의 번호',
	`name` varchar(30) collate utf8_bin not null comment '강의 이름',
	`department` varchar(20) collate utf8_bin not null comment '학과',
	`professor` varchar(10) collate utf8_bin not null comment '교수 이름',
	`kind` varchar(10) collate utf8_bin not null comment '강의 종류(전공선택, 전공필수 등)',
	`day_of_week` varchar(10) not null comment '강의요일',
	`time` varchar(50) not null comment '강의시간',
	primary key(`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='강의 정보';

-- student 테이블 생성
create table `student`(
	`student_id` int not null comment '학번',
	`name` varchar(10) collate utf8_bin not null comment '학생 이름',
	`password` varchar(20) not null comment '비밀번호',
	primary key(`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='학생 정보';

-- enrolment 테이블 생성
create table `enrolment`(
	`enrolment_id` int not null auto_increment comment '수강신청 번호',
	`student_id` int not null comment '학번',
	`course_id` int not null comment '강의 번호',
	primary key(`enrolment_id`),
	foreign key(`course_id`) references `course` (`course_id`) on delete cascade on update cascade,
	foreign key(`student_id`) references `student` (`student_id`) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='수강신청 정보';

-- 샘플 course
insert into `course` values('100', '자바', '응용컴퓨터공학과', '김자바', '전공필수', 'WED', '2-3-4');
insert into `course` values('101', '파이썬', '응용컴퓨터공학과', '박이선', '전공선택', 'MON', '4-5-6');
insert into `course` values('102', 'C++', '응용컴퓨터공학과', '씨플플', '전공선택', 'FRI', '12-13-14');
insert into `course` values('103', '자바스크립트', '응용컴퓨터공학과', '차차차', '전공선택', 'TUE', '10-11-12');
insert into `course` values('200', '일반수학', '공과대학', '이수학', '전공필수', 'THU', '1-2-3');
insert into `course` values('201', '일반물리학', '공과대학', '최물리', '전공필수', 'WED', '2-3-4');
insert into `course` values('202', '일반화학', '공과대학', '김화학', '전공필수', 'MON', '6-7-8');
insert into `course` values('300', '영어', '인문대학', 'Steve Jobs', '교양선택', 'WED', '9-10-11');
insert into `course` values('301', '축구', '체육대학', '박지성', '교양선택', 'MON', '7-8-9');

-- 샘플 student
insert into `student` values('00000000', 'guest', 'guestpw');
insert into `student` values('11111111', '홍길동', 'hgd');
insert into `student` values('32121908', '차준웅', 'cjw');

-- 샘플 enrolment
insert into `enrolment`(`student_id`, `course_id`) values('11111111', '100');
insert into `enrolment`(`student_id`, `course_id`) values('11111111', '101');
insert into `enrolment`(`student_id`, `course_id`) values('11111111', '200');
insert into `enrolment`(`student_id`, `course_id`) values('32121908', '201');
insert into `enrolment`(`student_id`, `course_id`) values('32121908', '101');
insert into `enrolment`(`student_id`, `course_id`) values('32121908', '300');