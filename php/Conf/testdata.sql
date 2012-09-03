/*!40101 SET NAMES utf8 */;
USE campus;

INSERT INTO ustc_school SET name='中国科学技术大学';

INSERT INTO ustc_user SET realname='李博杰', login_type=0, email='boj@mail.ustc.edu.cn', password=MD5(CONCAT(MD5('123456'),'salt')), salt='salt', status='active', isdeveloper=true, isschooladm=true, sid=1, student_no='PB10000603', gender=true, dept='少年班学院', major='计算机科学与技术', notify_email='bojieli@gmail.com', grade=2010, register_time=NOW(), hobby='', homepage='http://gewu.ustc.edu.cn/';
INSERT INTO ustc_user SET realname='马甲', login_type=0, email='boj@mail.ustc.edu.cn', password=MD5(CONCAT(MD5('123456'),'salt')), salt='salt', status='active', isdeveloper=true, isschooladm=true, sid=1, student_no='PB10000603', gender=true, dept='少年班学院', major='计算机科学与技术', notify_email='bojieli@gmail.com', grade=2010, register_time=NOW(), hobby='', homepage='http://gewu.ustc.edu.cn/';
INSERT INTO ustc_user SET realname='马甲2', login_type=0, email='boj@mail.ustc.edu.cn', password=MD5(CONCAT(MD5('123456'),'salt')), salt='salt', status='active', isdeveloper=true, isschooladm=true, sid=1, student_no='PB10000603', gender=true, dept='少年班学院', major='计算机科学与技术', notify_email='bojieli@gmail.com', grade=2010, register_time=NOW(), hobby='', homepage='http://gewu.ustc.edu.cn/';

INSERT INTO ustc_group SET sid=1, owner=1, status='active', name='Linux用户协会', register_time='10000';
INSERT INTO ustc_group SET sid=1, owner=1, status='active', name='Joke协会', register_time='10000';
INSERT INTO ustc_group SET sid=1, owner=1, status='active', name='系统测试协会', register_time='10000';
INSERT INTO ustc_group SET sid=1, owner=1, status='active', name='LUG', register_time='10000';

INSERT INTO ustc_user_group SET `uid`=1, gid=1, priv='admin', title='会长';
INSERT INTO ustc_user_group SET `uid`=1, gid=2, priv='member', title='会员';
INSERT INTO ustc_user_group SET `uid`=1, gid=3, priv='inactive', title='待审核';
INSERT INTO ustc_user_group SET `uid`=2, gid=1, priv='manager', title='部长';
INSERT INTO ustc_user_group SET `uid`=2, gid=2, priv='member', title='会员';
INSERT INTO ustc_user_group SET `uid`=3, gid=1, priv='inactive', title='待审核';
INSERT INTO ustc_user_group SET `uid`=3, gid=2, priv='manager', title='部长';

INSERT INTO ustc_attachment SET author=1, upload_time=NOW(), img_height=600, img_width=400, filename='SFD.jpg', localpath='232132412.jpg';

INSERT INTO ustc_act SET gid=1, author=1, name='SFD 2012', publish_time=NOW(), start_time=NOW()+100000, end_time=NOW()+100000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=1, author=1, name='SFD 2013', publish_time=NOW()-10000, start_time=NOW()+200000, end_time=NOW()+200000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=1, author=1, name='SFD 2014', publish_time=NOW()-20000, start_time=NOW()+300000, end_time=NOW()+300000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=1, author=1, name='SFD 2015', publish_time=NOW()-30000, start_time=NOW()+400000, end_time=NOW()+400000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2016', publish_time=NOW()-40000, start_time=NOW()+500000, end_time=NOW()+500000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
INSERT INTO ustc_act SET gid=2, author=1, name='SFD 2017', publish_time=NOW()-50000, start_time=NOW()+600000, end_time=NOW()+600000+7200, place='西活', poster=1, description='这是一次很好的活动';
