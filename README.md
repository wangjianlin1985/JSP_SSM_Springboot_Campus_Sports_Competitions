# JSP_SSM_Springboot_Campus_Sports_Competitions
JSP基于SSM大学生校园体育比赛响应式网站可升级SpringBoot毕业源码案例设计
## 开发技术 java ssm 框架
比赛公告，校内比赛报名

（需要报名总人数，报名时间，截止报名时间，超过时间或者报名人数将提示不能报名，报名分组一组二，规定组成员为多少人，选择自由报名组，分为十组总共）

校内小组冠军比赛报名（该比赛只能由十个小组决胜的小组冠军进行报名，时间，截止时间，一个冠军能）

校内比赛结果通知（由管理员记录每个组的每个人得分情况，最后由比赛结果出通知，组一哪个人是冠军，组二哪个人是冠军，

组详情里面有该组每个成员的得分情况，）

冠军比赛结果通知（由十个组的冠军进行比赛，由管理员后台记录每个人的分数，

最后比赛结果出通知，十个冠军哪个是冠军，可以查看详情，每个人的得分情况）

大学生校园体育比赛

学生注册的时候选择学校

比赛通知公告 比赛报名（分羽毛球比赛以及乒乓球，每个比赛多规定40个人，报名时间，截止时间，）

比赛结果通知（管理员登记每个组每个人的成绩，得出每个组的，羽毛球组的冠军）

冠军跟三个学校进行pk 得出最终冠军
## 实体ER属性：
学校: 学校id,学校名称

项目: 项目id,项目名称,项目介绍

比赛: 比赛id,举办学校,比赛项目,比赛名称,比赛介绍,比赛地点,人数限制,报名时间,截止时间

报名学生: 用户名,登录密码,报名比赛,姓名,性别,出生日期,用户照片,联系电话,家庭地址,报名时间

比赛成绩: 成绩id,比赛名称,学生,比赛轮次,比赛积分

新闻公告: 公告id,标题,公告内容,发布时间
