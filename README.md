# 在线考试平台

本项目是基于 SpringBoot 2.3 开发的在线考试平台。

## 运行环境

JDK 8+

MySQL 数据库

Redis  数据库

## 本机如何运行

1. 搭建mysql环境，并且运行文件夹doc中的sql脚本
2. 搭建redis环境

3. 修改文件`Online-Test\online-test-core\src\main\resources\config\application-prod.yml`，将其中的`mysql.url`、`mysql.port`和`mysql.database.name`替换。同时修改Redis的url，port以及password。
4. 启动微服务，首先启动SpringAdminApplication，其次启动otpServer。

## 快速部署

本项目已经打包镜像至dockhub，可以在doc中找到`docker-compose.yml`文件，之后执行`docker-compose up -d` 命令完成快速部署。

> 数据库相关部署已经完成，都部署在阿里云服务器上

## 快速访问

本项目已上传至github，地址：https://github.com/caixindi/Online-Test

本项目已部署在阿里云服务器上，访问地址如下：

服务端访问地址:http://39.104.160.208:8085

Spring-Admin服务监控系统访问地址:http://39.104.160.208:8400   用户名：otp  密码：123456

## 技术栈

| 模块     | 依赖                         |
| :------- | :--------------------------- |
| 前端     | AdminLTE 3、JQuery           |
| 后端     | spring boot 2、MyBatis-Plus  |
| 模板引擎 | beetl                        |
| 数据库   | MySQL、Redis                 |
| 工具类库 | guava、hutool、Apache-common |

## 微服务

| 服务名称             | 描述                        | 端口 |
| :------------------- | --------------------------- | ---- |
| otp-server           | 考试与信息维护服务系统      | 8085 |
| otp-apm-spring-admin | Spring-Admin 服务监控子系统 | 8400 |

## 架构设计

![image-20220528141959244](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220528141959244-16537289552663.png)

## 功能模块设计

### online-test-apm
系统 Application Performance Management 监控模块，集成了 Spring-Admin 服务监控子系统和 ELK 日志收集与分析平台，ELK需要使用 docker-compose 完成平台的搭建。

### online-test-common
系统通用模块，包含了系统的通用资源，包括领域对象模型、自定义工具类、常量池、系统配置、持久层接口、缓存层接口、统一异常处理、数据传输对象模型，视图对象模型等。

### online-test-service
系统业务逻辑模块，包括系统业务接口及其实现。

### online-test-core
系统核心模块，包含了系统的请求拦截器、权限维护、定时任务、外部化配置、初始化装配、自定义注解等核心组件层。对外暴露了页面控制层（管理员控制层、登录控制层、学生控制层以及教师控制层）和 RESTful 统一服务接口。通过  controller 和 rest 区分页面模型和 RESTful 接口，其中，对 RESTful 接口进行了基于注解的统一自定义权限检测，采用分布式 session 管理用户会话，可以使用Nginx作负载均衡，以实系统集群化部署。

### online-test-util
系统的工具模块，包含一个用户登录的验证码服务和Excel文档处理服务。

## 功能模块实现
### 管理员模块

#### 系统管理员

系统管理员是在线考试系统的最高权限用户，拥有管理和维护系统顶层数据的权限。
1. 系统公告管理。其功能包括：

   - 管理员发布系统公告，发布后学生和教师用户可以在相应的公告栏查看公告内容

   - 管理员用户编辑和删除公告

     学生和教师用户读取公告（学生和教师没有公告的编辑和删除权限）

2. 学院管理。由系统管理员管理校内二级学院，其功能包括：

   - 新增、删除、修改二级学院信息
   - 为新增专业、新增教师、新增学生进行学院绑定

3. 教师管理。由管理员维护全校教师账号，其功能包括：

   - 查询教师信息（包括姓名、工号、登录密码、职位和所属学院等基础信息）
   - 修改教师信息（包括姓名、登录密码、职位和所属学院等基础信息）
   - 新增教师（包括姓名、工号、登录密码、职位和所属学院等基础信息）
   - 删除教师

4. 学生管理。由系统管理员管理全校学生信息，其功能包括：

   - 新增学生（包括学生姓名（不可重复）、学号、年级、专业）
   - 修改学生信息
   - 删除学生
   - 支持快速搜索、分类筛选
   - 支持从Excel文件导入学生

5. 专业管理。由系统管理员管理全校专业数据，其功能如下：

   - 新增专业（包括专业名称及其所属学院）
   - 修改专业信息
   - 删除专业
   - 支持从Excel文件导入专业

6. 管理员管理。该权限只有系统管理员具备，其功能如下：

   - 新增系统管理员和学院管理员
   - 支持快速查询管理员
   - 修改管理员密码
   - 删除系统管理员和学院管理员
#### 学院管理员
学院管理员在系统管理员的基础上删减了部分功能和权限，增加了针对试卷和课程的权限指派业务，学院管理员的业务功能集中在对本学院的管理和维护上。

1. 系统公告管理。其功能包括：
   - 学院管理员发布系统公告
   - 学院管理员编辑公告（学院管理员没有公告删除权限）
2. 教师管理。学院管理员拥有对本学院教师的管理权限，其功能包括：
   - 查询教师信息（包括姓名、工号、登录密码、职位和所属学院等基础信息）
   - 修改教师信息（包括姓名、登录密码、职位和所属学院等基础信息）
   - 新增教师（包括姓名、工号、登录密码、职位和所属学院等基础信息）
   - 删除教师
3. 学生管理。学院管理员拥有对本学院学生的管理权限，其功能包括：
   - 新增学生（包括学生姓名（不可重复）、学号、年级、专业）
   - 修改学生信息
   - 删除学生
   - 支持快速搜索、分类筛选
   - 支持从Excel文件导入学生
4. 班级管理。学院管理员拥有对本学院专业的班级管理权限，其功能如下：
   - 班级分配（包括增删改查）
5. 专业管理。学院管理员拥有对本学院专业的管理权限，其功能如下：
   - 新增专业（包括专业名称及其所属学院）
   - 修改专业信息
   - 删除专业
   - 支持从Excel文件导入专业
6. 试卷管理。教师完成试卷上传之后，无法立即公布考试信息，需经过相应学院的学院管理员审核之后进行试卷班级指派，指派完成后，相关班级学生才有权限进行考试。
7. 	课程管理。学院管理员拥有对本学院课程的教师指派权限，指派可以将一门课程给一位或者多位教师。指派完成之后相应教师将用于相应课程的出题出卷权限。
### 教师模块
教师作为在线考试系统的主要使用者，从相应课程的题库维护、到课程题目录入、出卷都需要教师，其主要功能侧重出题出卷上。
1. 消息公告。查看管理员发布的消息。
2. 	课程管理。查看指派到的课程数据。
3. 	试题管理。老师可使用导入本地模板表格和直接新增试题两种方式新增试题并录入题库中，每位老师的题库仅限于指派到的相关课程的题目，且不同出题人之间仅对自己的题目有查看、编辑和删除权限，对于其他出题人的题目只有只读权限。
4. 	试卷管理。老师可以使用导入试卷或者从题库中随机抽题组卷的方式新增一场考试，设置考试日期和时间，在考试未开始和未被学院管理员指派班级之前，可删除试卷。
5. 	试卷分析：教师可通过班级和考试场次筛选出某场考试的班级成绩分析数据表，并可以导出班级成绩分析表格，同时提供多维度数据包括平均分、排名、及格率等数据分析。
6. 	考试复查。作为主观题复查的选项，计算机会做第一次检查并评出基础分数，老师做二次检查并确定最后分数。
### 学生模块
学生模块功能主要侧重学生考试答题环节以及考卷分析。
1. 系统公告。查看公告内容。
2. 我的考试。其功能如下：
   - 查看考试科目、时间、状态
   - 考试入口。考试开始时，考试状态由未开始转为开始，学生点击进入答卷，考试结束自动交卷，题目顺序随机。
3. 我的成绩。查询已考完的考试的成绩和考试情况详细信息。
4. 成绩分析。
   - 提供多维度成绩图表分析。比如雷达图（显示学生每个科目的考试成绩与所有考生的每个科目成绩平均分的对比）和饼图（显示学生每个科目的成绩分数段比例）。
   - 考试成绩汇总分析导出功能。如单科成绩总排名、平均分。 

## 部分功能截图

系统登录页面

![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220528161706396-16537270508871.png)

学生端首页  ![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220528163425060.png)

我的考试页面

![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220528163647065.png)

考试页面

![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220531003103366.png)

系统管理员页面

![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220531004621761.png)

学院管理员页面

![](https://cxd-note-img.oss-cn-hangzhou.aliyuncs.com/typora-note-img/image-20220531002900801.png)



















