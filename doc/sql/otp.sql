SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES (1, '计算机与人工智能学院');
INSERT INTO `academy` VALUES (3, '外国语学院');
INSERT INTO `academy` VALUES (4, '机电工程学院');
INSERT INTO `academy` VALUES (5, '艺术学院');
INSERT INTO `academy` VALUES (6, '经济管理学院');
INSERT INTO `academy` VALUES (7, '建筑工程学院');
INSERT INTO `academy` VALUES (8, '电气与电子工程学院');
INSERT INTO `academy` VALUES (12, '国际教育学院');
INSERT INTO `academy` VALUES (36, '材料科学与工程学院');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `academy_id` int NULL DEFAULT NULL COMMENT '归属学院，0为系统管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (4, '初始化管理员', 'system', '$2a$10$HCuvGrT1KYi8G1PJ6GzMMOUaO0npoJ2za4EZ27KzZfd9o6E0YLfGy', 1, '2022-05-31 00:39:23', NULL);
INSERT INTO `admin` VALUES (19, 'Cindy', 'Cindy', '$2a$10$P1i8Z9d7UpH4js/3ZCvJPetV7WXvNwsg3gkXdVsHIzxrYFEeuIZd2', 1, '2022-05-28 00:19:20', NULL);
INSERT INTO `admin` VALUES (20, '计算机学院管理员', 'CS', '$2a$10$ABOghZKE.JnnIDHW/n.OkumHp90jI7imH8GVEmcogPe44ARl4m.ey', 1, '2022-05-31 00:23:27', 1);

-- ----------------------------
-- Table structure for announce
-- ----------------------------
DROP TABLE IF EXISTS `announce`;
CREATE TABLE `announce`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公告内容',
  `author_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者id',
  `role_id` int NULL DEFAULT NULL COMMENT '作者身份id：管理员-1 学生-2 教师-3',
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '公告创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announce
-- ----------------------------
INSERT INTO `announce` VALUES (47, '考试须知', '国家教育考试违规处理办法\r\n（2004年5月19日中华人民共和国教育部令第18号发布，根据2012年1月5日《教育部关于修改<国家教育考试违规处理办法>的决定》修正）\r\n第一章　总则\r\n第一条　为规范对国家教育考试违规行为的认定与处理，维护国家教育考试的公平、公正，保障参加国家教育考试的人员（以下简称考生）、从事和参与国家教育考试工作的人员（以下简称考试工作人员）的合法权益，根据《中华人民共和国教育法》及相关法律、行政法规，制定本办法。\r\n第二条　本办法所称国家教育考试是指普通和成人高等学校招生考试、全国硕士研究生招生考试、高等教育自学考试等，由国务院教育行政部门确定实施，由经批准的实施教育考试的机构承办，面向社会公开、统一举行，其结果作为招收学历教育学生或者取得国家承认学历、学位证书依据的测试活动。\r\n第三条　对参加国家教育考试的考生以及考试工作人员、其他相关人员，违反考试管理规定和考场纪律，影响考试公平、公正行为的认定与处理，适用本办法。\r\n对国家教育考试违规行为的认定与处理应当公开公平、合法适当。\r\n第四条　国务院教育行政部门及地方各级人民政府教育行政部门负责全国或者本地区国家教育考试组织工作的管理与监督。\r\n承办国家教育考试的各级教育考试机构负责有关考试的具体实施，依据本办法，负责对考试违规行为的认定与处理。\r\n第二章　违规行为的认定与处理\r\n第五条　考生不遵守考场纪律，不服从考试工作人员的安排与要求，有下列行为之一的，应当认定为考试违纪：\r\n（一）携带规定以外的物品进入考场或者未放在指定位置的；\r\n（二）未在规定的座位参加考试的；\r\n（三）考试开始信号发出前答题或者考试结束信号发出后继续答题的；\r\n（四）在考试过程中旁窥、交头接耳、互打暗号或者手势的；\r\n（五）在考场或者教育考试机构禁止的范围内，喧哗、吸烟或者实施其他影响考场秩序的行为的；\r\n（六）未经考试工作人员同意在考试过程中擅自离开考场的；\r\n（七）将试卷、答卷（含答题卡、答题纸等，下同）、草稿纸等考试用纸带出考场的；\r\n（八）用规定以外的笔或者纸答题或者在试卷规定以外的地方书写姓名、考号或者以其他方式在答卷上标记信息的；\r\n（九）其他违反考场规则但尚未构成作弊的行为。\r\n第六条　考生违背考试公平、公正原则，在考试过程中有下列行为之一的，应当认定为考试作弊：\r\n（一）携带与考试内容相关的材料或者存储有与考试内容相关资料的电子设备参加考试的；\r\n（二）抄袭或者协助他人抄袭试题答案或者与考试内容相关的资料的；\r\n（三）抢夺、窃取他人试卷、答卷或者胁迫他人为自己抄袭提供方便的；\r\n（四）携带具有发送或者接收信息功能的设备的；\r\n（五）由他人冒名代替参加考试的；\r\n（六）故意销毁试卷、答卷或者考试材料的；\r\n（七）在答卷上填写与本人身份不符的姓名、考号等信息的；\r\n（八）传、接物品或者交换试卷、答卷、草稿纸的；\r\n（九）其他以不正当手段获得或者试图获得试题答案、考试成绩的行为。\r\n第七条　教育考试机构、考试工作人员在考试过程中或者在考试结束后发现下列行为之一的，应当认定相关的考生实施了考试作弊行为：\r\n（一）通过伪造证件、证明、档案及其他材料获得考试资格、加分资格和考试成绩的；\r\n（二）评卷过程中被认定为答案雷同的；\r\n（三）考场纪律混乱、考试秩序失控，出现大面积考试作弊现象的；\r\n（四）考试工作人员协助实施作弊行为，事后查实的；\r\n（五）其他应认定为作弊的行为。\r\n第八条　考生及其他人员应当自觉维护考试秩序，服从考试工作人员的管理，不得有下列扰乱考试秩序的行为：\r\n（一）故意扰乱考点、考场、评卷场所等考试工作场所秩序；\r\n（二）拒绝、妨碍考试工作人员履行管理职责；\r\n（三）威胁、侮辱、诽谤、诬陷或者以其他方式侵害考试工作人员、其他考生合法权益的行为；\r\n（四）故意损坏考场设施设备；\r\n（五）其他扰乱考试管理秩序的行为。\r\n第九条　考生有第五条所列考试违纪行为之一的，取消该科目的考试成绩。\r\n考生有第六条、第七条所列考试作弊行为之一的，其所报名参加考试的各阶段、各科成绩无效；参加高等教育自学考试的，当次考试各科成绩无效。\r\n有下列情形之一的，可以视情节轻重，同时给予暂停参加该项考试1至3年的处理；情节特别严重的，可以同时给予暂停参加各种国家教育考试1至3年的处理：\r\n（一）组织团伙作弊的；\r\n（二）向考场外发送、传递试题信息的；\r\n（三）使用相关设备接收信息实施作弊的；\r\n（四）伪造、变造身份证、准考证及其他证明材料，由他人代替或者代替考生参加考试的。\r\n参加高等教育自学考试的考生有前款严重作弊行为的，也可以给予延迟毕业时间1至3年的处理，延迟期间考试成绩无效。\r\n第十条　考生有第八条所列行为之一的，应当终止其继续参加本科目考试，其当次报名参加考试的各科成绩无效；考生及其他人员的行为违反《中华人民共和国治安管理处罚法》的，由公安机关进行处理；构成犯罪的，由司法机关依法追究刑事责任。\r\n第十一条　考生以作弊行为获得的考试成绩并由此取得相应的学位证书、学历证书及其他学业证书、资格资质证书或者入学资格的，由证书颁发机关宣布证书无效，责令收回证书或者予以没收；已经被录取或者入学的，由录取学校取消录取资格或者其学籍。\r\n第十二条　在校学生、在职教师有下列情形之一的，教育考试机构应当通报其所在学校，由学校根据有关规定严肃处理，直至开除学籍或者予以解聘：\r\n（一）代替考生或者由他人代替参加考试的；\r\n（二）组织团伙作弊的；\r\n（三）为作弊组织者提供试题信息、答案及相应设备等参与团伙作弊行为的。\r\n第十三条　考试工作人员应当认真履行工作职责，在考试管理、组织及评卷等工作过程中，有下列行为之一的，应当停止其参加当年及下一年度的国家教育考试工作，并由教育考试机构或者建议其所在单位视情节轻重分别给予相应的行政处分：\r\n（一）应回避考试工作却隐瞒不报的；\r\n（二）擅自变更考试时间、地点或者考试安排的；\r\n（三）提示或暗示考生答题的；\r\n（四）擅自将试题、答卷或者有关内容带出考场或者传递给他人的；\r\n（五）未认真履行职责，造成所负责考场出现秩序混乱、作弊严重或者视频录像资料损毁、视频系统不能正常工作的；\r\n（六）在评卷、统分中严重失职，造成明显的错评、漏评或者积分差错的；\r\n（七）在评卷中擅自更改评分细则或者不按评分细则进行评卷的；\r\n（八）因未认真履行职责，造成所负责考场出现雷同卷的；\r\n（九）擅自泄露评卷、统分等应予保密的情况的；\r\n（十）其他违反监考、评卷等管理规定的行为。\r\n第十四条　考试工作人员有下列作弊行为之一的，应当停止其参加国家教育考试工作，由教育考试机构或者其所在单位视情节轻重分别给予相应的行政处分，并调离考试工作岗位；情节严重，构成犯罪的，由司法机关依法追究刑事责任：\r\n（一）为不具备参加国家教育考试条件的人员提供假证明、证件、档案，使其取得考试资格或者考试工作人员资格的；\r\n（二）因玩忽职守，致使考生未能如期参加考试的或者使考试工作遭受重大损失的；\r\n（三）利用监考或者从事考试工作之便，为考生作弊提供条件的；\r\n（四）伪造、变造考生档案（含电子档案）的；\r\n（五）在场外组织答卷、为考生提供答案的；\r\n（六）指使、纵容或者伙同他人作弊的；\r\n（七）偷换、涂改考生答卷、考试成绩或者考场原始记录材料的；\r\n（八）擅自更改或者编造、虚报考试数据、信息的；\r\n（九）利用考试工作便利，索贿、受贿、以权徇私的；\r\n（十）诬陷、打击报复考生的。\r\n第十五条　因教育考试机构管理混乱、考试工作人员玩忽职守，造成考点或者考场纪律混乱，作弊现象严重；或者同一考点同一时间的考试有1/5以上考场存在雷同卷的，由教育行政部门取消该考点当年及下一年度承办国家教育考试的资格；高等教育自学考试考区内一个或者一个以上专业考试纪律混乱，作弊现象严重，由高等教育自学考试管理机构给予该考区警告或者停考该考区相应专业1至3年的处理。\r\n对出现大规模作弊情况的考场、考点的相关责任人、负责人及所属考区的负责人，有关部门应当分别给予相应的行政处分；情节严重，构成犯罪的，由司法机关依法追究刑事责任。\r\n第十六条　违反保密规定，造成国家教育考试的试题、答案及评分参考（包括副题及其答案及评分参考，下同）丢失、损毁、泄密，或者使考生答卷在保密期限内发生重大事故的，由有关部门视情节轻重，分别给予责任人和有关负责人行政处分；构成犯罪的，由司法机关依法追究刑事责任。\r\n盗窃、损毁、传播在保密期限内的国家教育考试试题、答案及评分参考、考生答卷、考试成绩的，由有关部门依法追究有关人员的责任；构成犯罪的，由司法机关依法追究刑事责任。\r\n第十七条　有下列行为之一的，由教育考试机构建议行为人所在单位给予行政处分；违反《中华人民共和国治安管理处罚法》的，由公安机关依法处理；构成犯罪的，由司法机关依法追究刑事责任：\r\n（一）指使、纵容、授意考试工作人员放松考试纪律，致使考场秩序混乱、作弊严重的；\r\n（二）代替考生或者由他人代替参加国家教育考试的；\r\n（三）组织或者参与团伙作弊的;\r\n（四）利用职权，包庇、掩盖作弊行为或者胁迫他人作弊的；\r\n（五）以打击、报复、诬陷、威胁等手段侵犯考试工作人员、考生人身权利的；\r\n（六）向考试工作人员行贿的；\r\n（七）故意损坏考试设施的；\r\n（八）扰乱、妨害考场、评卷点及有关考试工作场所秩序后果严重的。\r\n国家工作人员有前款行为的，教育考试机构应当建议有关纪检、监察部门，根据有关规定从重处理。\r\n第三章　违规行为认定与处理程序\r\n第十八条　考试工作人员在考试过程中发现考生实施本办法第五条、第六条所列考试违纪、作弊行为的，应当及时予以纠正并如实记录；对考生用于作弊的材料、工具等，应予暂扣。\r\n考生违规记录作为认定考生违规事实的依据，应当由2名以上监考员或者考场巡视员、督考员签字确认。\r\n考试工作人员应当向违纪考生告知违规记录的内容，对暂扣的考生物品应填写收据。\r\n第十九条　教育考试机构发现本办法第七条、第八条所列行为的，应当由2名以上工作人员进行事实调查，收集、保存相应的证据材料，并在调查事实和证据的基础上，对所涉及考生的违规行为进行认定。\r\n考试工作人员通过视频发现考生有违纪、作弊行为的，应当立即通知在现场的考试工作人员，并应当将视频录像作为证据保存。教育考试机构可以通过视频录像回放，对所涉及考生违规行为进行认定。\r\n第二十条　考点汇总考生违规记录，汇总情况经考点主考签字认定后，报送上级教育考试机构依据本办法的规定进行处理。\r\n第二十一条　考生在普通和成人高等学校招生考试、高等教育自学考试中，出现第五条所列考试违纪行为的，由省级教育考试机构或者市级教育考试机构做出处理决定，由市级教育考试机构做出的处理决定应报省级教育考试机构备案；出现第六条、第七条所列考试作弊行为的，由市级教育考试机构签署意见，报省级教育考试机构处理，省级教育考试机构也可以要求市级教育考试机构报送材料及证据，直接进行处理；出现本办法第八条所列扰乱考试秩序行为的，由市级教育考试机构签署意见，报省级教育考试机构按照前款规定处理，对考生及其他人员违反治安管理法律法规的行为，由当地公安部门处理；评卷过程中发现考生有本办法第七条所列考试作弊行为的，由省级教育考试机构做出处理决定，并通知市级教育考试机构。\r\n考生在参加全国硕士研究生招生考试中的违规行为，由组织考试的机构认定，由相关省级教育考试机构或者受其委托的组织考试的机构做出处理决定。\r\n在国家教育考试考场视频录像回放审查中认定的违规行为，由省级教育考试机构认定并做出处理决定。\r\n参加其他国家教育考试考生违规行为的处理由承办有关国家教育考试的考试机构参照前款规定具体确定。\r\n第二十二条　教育行政部门和其他有关部门在考点、考场出现大面积作弊情况或者需要对教育考试机构实施监督的情况下，应当直接介入调查和处理。\r\n发生第十四、十五、十六条所列案件，情节严重的，由省级教育行政部门会同有关部门共同处理，并及时报告国务院教育行政部门；必要时，国务院教育行政部门参与或者直接进行处理。\r\n第二十三条　考试工作人员在考场、考点及评卷过程中有违反本办法的行为的，考点主考、评卷点负责人应当暂停其工作，并报相应的教育考试机构处理。\r\n第二十四条　在其他与考试相关的场所违反有关规定的考生，由市级教育考试机构或者省级教育考试机构做出处理决定；市级教育考试机构做出的处理决定应报省级教育考试机构备案。\r\n在其他与考试相关的场所违反有关规定的考试工作人员，由所在单位根据市级教育考试机构或者省级教育考试机构提出的处理意见，进行处理，处理结果应当向提出处理的教育考试机构通报。\r\n第二十五条　教育考试机构在对考试违规的个人或者单位做出处理决定前，应当复核违规事实和相关证据，告知被处理人或者单位做出处理决定的理由和依据；被处理人或者单位对所认定的违规事实认定存在异议的，应当给予其陈述和申辩的机会。\r\n给予考生停考处理的，经考生申请，省级教育考试机构应当举行听证，对作弊的事实、情节等进行审查、核实。\r\n第二十六条　教育考试机构做出处理决定应当制作考试违规处理决定书，载明被处理人的姓名或者单位名称、处理事实根据和法律依据、处理决定的内容、救济途径以及做出处理决定的机构名称和做出处理决定的时间。\r\n考试违规处理决定书应当及时送达被处理人。\r\n第二十七条　考生或者考试工作人员对教育考试机构做出的违规处理决定不服的，可以在收到处理决定之日起15日内，向其上一级教育考试机构提出复核申请；对省级教育考试机构或者承办国家教育考试的机构做出的处理决定不服的，也可以向省级教育行政部门或者授权承担国家教育考试的主管部门提出复核申请。\r\n第二十八条　受理复核申请的教育考试机构、教育行政部门应对处理决定所认定的违规事实和适用的依据等进行审查，并在受理后30日内，按照下列规定作出复核决定：\r\n（一）处理决定认定事实清楚、证据确凿，适用依据正确，程序合法，内容适当的，决定维持；\r\n（二）处理决定有下列情况之一的，决定撤销或者变更：\r\n1．违规事实认定不清、证据不足的；\r\n2．适用依据错误的；\r\n3．违反本办法规定的处理程序的。\r\n做出决定的教育考试机构对因错误的处理决定给考生造成的损失，应当予以补救。\r\n第二十九条　申请人对复核决定或者处理决定不服的，可以依法申请行政复议或者提起行政诉讼。\r\n第三十条　教育考试机构应当建立国家教育考试考生诚信档案，记录、保留在国家教育考试中作弊人员的相关信息。国家教育考试考生诚信档案中记录的信息未经法定程序，任何组织、个人不得删除、变更。\r\n国家教育考试考生诚信档案可以依申请接受社会有关方面的查询，并应当及时向招生学校或单位提供相关信息，作为招生参考条件。\r\n第三十一条　省级教育考试机构应当及时汇总本地区违反规定的考生及考试工作人员的处理情况，并向国家教育考试机构报告。\r\n第四章　附则\r\n第三十二条　本办法所称考场是指实施考试的封闭空间；所称考点是指设置若干考场独立进行考务活动的特定场所；所称考区是指由省级教育考试机构设置，由若干考点组成，进行国家教育考试实施工作的特定地区。\r\n第三十三条　非全日制攻读硕士学位全国考试、中国人民解放军高等教育自学考试及其他各级各类教育考试的违规处理可以参照本办法执行。\r\n第三十四条　本办法自发布之日起施行。此前教育部颁布的各有关国家教育考试的违规处理规定同时废止。', '4', 1, '初始化管理员', '2022-05-28 00:16:18');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '该门课的出题老师(默认一门课一个老师出题)',
  `academy_id` int NULL DEFAULT NULL COMMENT '所属学院',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java课程设计', '4,1', 1);
INSERT INTO `course` VALUES (2, '大学物理', '2', 1);
INSERT INTO `course` VALUES (4, 'JavaEE企业级开发编程技术', '4', 1);
INSERT INTO `course` VALUES (5, '模拟电路', '1', 8);
INSERT INTO `course` VALUES (7, 'C语言程序设计', '4', 1);
INSERT INTO `course` VALUES (30, '数据结构与算法', '7,4', 1);
INSERT INTO `course` VALUES (36, '测试课程', '1', 1);
INSERT INTO `course` VALUES (37, 'test', '1', 1);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NULL DEFAULT NULL COMMENT '班级年级',
  `major_id` int NULL DEFAULT NULL COMMENT '所属专业id',
  `grade_number` int NULL DEFAULT NULL COMMENT '班级编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, 17, 1, 1);
INSERT INTO `grade` VALUES (2, 17, 1, 2);
INSERT INTO `grade` VALUES (5, 16, 1, 1);
INSERT INTO `grade` VALUES (6, 16, 1, 2);
INSERT INTO `grade` VALUES (7, 16, 1, 3);
INSERT INTO `grade` VALUES (8, 16, 1, 4);
INSERT INTO `grade` VALUES (9, 16, 1, 5);
INSERT INTO `grade` VALUES (10, 17, 1, 3);
INSERT INTO `grade` VALUES (11, 17, 1, 4);
INSERT INTO `grade` VALUES (12, 17, 1, 5);
INSERT INTO `grade` VALUES (13, 16, 8, 1);
INSERT INTO `grade` VALUES (14, 16, 8, 2);
INSERT INTO `grade` VALUES (15, 16, 8, 3);
INSERT INTO `grade` VALUES (16, 16, 8, 4);
INSERT INTO `grade` VALUES (17, 16, 8, 5);
INSERT INTO `grade` VALUES (18, 16, 8, 6);
INSERT INTO `grade` VALUES (19, 16, 8, 7);
INSERT INTO `grade` VALUES (20, 16, 8, 8);
INSERT INTO `grade` VALUES (21, 17, 2, 1);
INSERT INTO `grade` VALUES (22, 17, 2, 2);
INSERT INTO `grade` VALUES (23, 17, 2, 3);
INSERT INTO `grade` VALUES (24, 18, 1, 1);
INSERT INTO `grade` VALUES (25, 18, 1, 2);
INSERT INTO `grade` VALUES (26, 18, 1, 3);
INSERT INTO `grade` VALUES (27, 18, 29, 1);
INSERT INTO `grade` VALUES (28, 18, 30, 1);
INSERT INTO `grade` VALUES (29, 18, 30, 2);
INSERT INTO `grade` VALUES (30, 21, 3, 1);
INSERT INTO `grade` VALUES (31, 21, 3, 2);
INSERT INTO `grade` VALUES (32, 21, 3, 3);
INSERT INTO `grade` VALUES (33, 21, 3, 4);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '专业ID',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业班级',
  `academy_id` int NULL DEFAULT NULL COMMENT '学院ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术', 1);
INSERT INTO `major` VALUES (2, '数字媒体技术', 1);
INSERT INTO `major` VALUES (3, '软件工程', 1);
INSERT INTO `major` VALUES (4, '网络工程', 1);
INSERT INTO `major` VALUES (7, '土木工程', 7);
INSERT INTO `major` VALUES (8, '商务英语', 3);
INSERT INTO `major` VALUES (9, '环境设计', 5);
INSERT INTO `major` VALUES (10, '商务日语', 3);
INSERT INTO `major` VALUES (11, '会计学', 12);
INSERT INTO `major` VALUES (12, '电气工程及其自动化', 8);
INSERT INTO `major` VALUES (17, '机械设计', 4);
INSERT INTO `major` VALUES (18, '数字媒体艺术', 5);
INSERT INTO `major` VALUES (19, '国际贸易', 6);
INSERT INTO `major` VALUES (21, '金融工程', 6);
INSERT INTO `major` VALUES (27, '机械制造', 7);
INSERT INTO `major` VALUES (29, '大数据技术', 1);
INSERT INTO `major` VALUES (30, '网络安全', 1);
INSERT INTO `major` VALUES (31, '物联网工程', 1);
INSERT INTO `major` VALUES (32, '电子信息', 1);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `question_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问题id组合',
  `begin_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷开始时间',
  `end_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷结束时间',
  `allow_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试时长',
  `score` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷总分',
  `paper_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试状态：未开始，进行中，已结束',
  `paper_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷类型：正式，模拟',
  `major_id` int NULL DEFAULT NULL COMMENT '专业id',
  `paper_form_id` int NULL DEFAULT NULL COMMENT '试卷组成id',
  `teacher_id` int NULL DEFAULT NULL COMMENT '出卷老师id',
  `academy_id` int NULL DEFAULT NULL COMMENT '学院id',
  `grade_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班级id集合',
  `level` int NULL DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (62, 'JAVA EE 期末考试', 1, '13,15,17,47,11,27,28,12,53,22,36,6', '2022-05-29 15:00', '2022-05-29 17:00', '120分钟', '100', '已结束', '正式', 1, 1, 1, 1, '1,2,3,4', 21);
INSERT INTO `paper` VALUES (63, 'JavaSE 试卷', 1, '2,3,4,8,11,13,15,16,17,37,5,12,30,43,43,10,20,21,32,46', '2022-05-31 00:23', '2022-05-31 00:30', '7分钟', '100', '未开始', '正式', 1, 67, 1, 1, NULL, NULL);
INSERT INTO `paper` VALUES (64, 'j2ee期末考试', 1, '27,2,29,35,15,51,42,14,24,22,39,25', '2022-05-31 00:30', '2022-05-31 00:35', '5分钟', '100', '未开始', '正式', 1, 1, 1, 1, '1', 21);

-- ----------------------------
-- Table structure for paper_form
-- ----------------------------
DROP TABLE IF EXISTS `paper_form`;
CREATE TABLE `paper_form`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '题目id',
  `q_choice_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单选题数目',
  `q_choice_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单选题分数',
  `q_mul_choice_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '多选题数目',
  `q_mul_choice_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '多选题分数',
  `q_tof_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '判断题数目',
  `q_tof_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '判断题分数',
  `q_fill_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '填空题数目',
  `q_fill_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '填空题分数',
  `q_SAQ_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简答题数目',
  `q_SAQ_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简答题分数',
  `q_program_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编程题数目',
  `q_program_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编程题分数',
  `type` int NULL DEFAULT NULL COMMENT '模板类型（1：导入试卷新增模板，0：模板页面增加的模板）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paper_form
-- ----------------------------
INSERT INTO `paper_form` VALUES (1, '6', '5', '2', '10', '', '', '2', '5', '2', '20', NULL, NULL, 0);
INSERT INTO `paper_form` VALUES (64, '1', '100', '', '', '', '', '', '', '', '', '', '', 0);
INSERT INTO `paper_form` VALUES (65, '5', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 1);
INSERT INTO `paper_form` VALUES (67, '10', '2', '5', '4', '5', '4', '0', '0', '0', '0', '0', '0', 1);
INSERT INTO `paper_form` VALUES (68, '10', '2', '5', '4', '5', '4', '0', '0', '0', '0', '0', '0', 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限 ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `expression` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限表达式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '', 'student:update:password');
INSERT INTO `permission` VALUES (2, '', 'student:update');
INSERT INTO `permission` VALUES (3, '', 'student:delete');
INSERT INTO `permission` VALUES (4, NULL, 'student:save');
INSERT INTO `permission` VALUES (5, NULL, 'student:list');
INSERT INTO `permission` VALUES (6, NULL, 'teacher:update:password');
INSERT INTO `permission` VALUES (7, NULL, 'teacher:list');
INSERT INTO `permission` VALUES (8, NULL, 'teacher:update');
INSERT INTO `permission` VALUES (9, NULL, 'teacher:save');
INSERT INTO `permission` VALUES (10, NULL, 'teacher:delete');
INSERT INTO `permission` VALUES (11, NULL, 'paper:update');
INSERT INTO `permission` VALUES (12, NULL, 'paper:list');
INSERT INTO `permission` VALUES (13, NULL, 'paper:import');
INSERT INTO `permission` VALUES (14, NULL, 'paper:save');
INSERT INTO `permission` VALUES (15, NULL, 'paper:update');
INSERT INTO `permission` VALUES (16, NULL, 'paper:delete');
INSERT INTO `permission` VALUES (17, NULL, 'course:list');
INSERT INTO `permission` VALUES (18, NULL, 'course:delete');
INSERT INTO `permission` VALUES (19, NULL, 'question:list');
INSERT INTO `permission` VALUES (20, NULL, 'question:save');
INSERT INTO `permission` VALUES (21, NULL, 'question:update');
INSERT INTO `permission` VALUES (22, NULL, 'question:delete');
INSERT INTO `permission` VALUES (23, NULL, 'question:import');
INSERT INTO `permission` VALUES (24, NULL, 'score:chart');
INSERT INTO `permission` VALUES (25, NULL, 'paperForm:delete');
INSERT INTO `permission` VALUES (26, NULL, 'paperForm:save');
INSERT INTO `permission` VALUES (27, NULL, 'announce:save');
INSERT INTO `permission` VALUES (28, NULL, 'announce:delete');
INSERT INTO `permission` VALUES (29, NULL, 'announce:update');
INSERT INTO `permission` VALUES (30, NULL, 'announce:list');
INSERT INTO `permission` VALUES (31, NULL, 'admin:delete');
INSERT INTO `permission` VALUES (32, NULL, 'admin:save');
INSERT INTO `permission` VALUES (33, NULL, 'admin:update');
INSERT INTO `permission` VALUES (34, NULL, 'admin:update:password');
INSERT INTO `permission` VALUES (35, NULL, 'admin:update:list');
INSERT INTO `permission` VALUES (36, NULL, 'academy:list');
INSERT INTO `permission` VALUES (37, NULL, 'academy:update');
INSERT INTO `permission` VALUES (38, NULL, 'academy:save');
INSERT INTO `permission` VALUES (39, NULL, 'academy:delete');
INSERT INTO `permission` VALUES (40, NULL, 'major:list');
INSERT INTO `permission` VALUES (41, NULL, 'major:update');
INSERT INTO `permission` VALUES (42, NULL, 'major:save');
INSERT INTO `permission` VALUES (43, NULL, 'major:delete');
INSERT INTO `permission` VALUES (44, NULL, 'course:save');
INSERT INTO `permission` VALUES (45, NULL, 'type:list');
INSERT INTO `permission` VALUES (46, NULL, 'score:list');
INSERT INTO `permission` VALUES (47, NULL, 'admin:list');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `question_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '题目名称',
  `option_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项d',
  `type_id` int NULL DEFAULT NULL COMMENT '题目类型id',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '题目答案',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `difficulty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目难度：1-容易，2-中等，3-较难',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '题目解析',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '我们在程序中经常使用“System.out.println()”来输出信息，语句中的System是包名，out是类名，println是方法名。', NULL, NULL, NULL, NULL, 3, '错', 1, '1', '错', 4);
INSERT INTO `question` VALUES (2, '下面论述正确的是（）？', '如果两个对象的hashcode相同，那么它们作为同一个HashMap的key时，必然返回同样的值', '如果a,b的hashcode相同，那么a.equals(b)必须返回true', '对于一个类，其所有对象的hashcode必须不同', '如果a.equals(b)返回true，那么a,b两个对象的hashcode必须相同', 1, 'A', 1, '2', '映射关系分析', 4);
INSERT INTO `question` VALUES (3, '以下的变量定义语句中，合法的是（）', 'byte=128', 'boolean=null', 'long a=123L', 'double=0.9239d', 1, 'C', 1, '1', NULL, 1);
INSERT INTO `question` VALUES (4, '关于匿名内部类叙述正确的是？ ( )', '匿名内部类可以继承一个基类，不可以实现一个接口', '匿名内部类不可以定义构造器', '匿名内部类不能用于形参', '以上说法都不正确', 1, 'B', 1, '2', NULL, 1);
INSERT INTO `question` VALUES (5, '下面选项中,哪些是interface中合法方法定义?()', 'public void main(String [] args);', 'private int getSum();', 'boolean setFlag(Boolean [] test);', 'public float get(int x);', 2, 'A,C,D', 1, '3', NULL, 1);
INSERT INTO `question` VALUES (6, '请简述Java命名规范有哪些？', NULL, NULL, NULL, NULL, 5, '1.不能以数字开头2.不能包含特殊字符，除了$和_3.类名和文件名相同4.区分大小写5.不能使用关键字和保留字6.代码行以;结束', 1, '1', 'JavaSE基础', 4);
INSERT INTO `question` VALUES (7, '启动自定义线程的方法是________', NULL, NULL, NULL, NULL, 4, 'start()', 1, '2', '重写run()方法，调用start()启动线程', 1);
INSERT INTO `question` VALUES (8, '关于中间件特点的描述.不正确的是（）', '中间件运行于客户机/服务器的操作系统内核中，提高内核运行效率', '中间件应支持标准的协议和接口', '中间件可运行于多种硬件和操作系统平台上', '跨越网络,硬件，操作系统平台的应用或服务可通过中间件透明交互', 1, 'A', 1, '3', '中间件位于操作系统之上，应用软件之下，而不是操作系统内核中', 4);
INSERT INTO `question` VALUES (9, '请简述你对接口的认识。', NULL, NULL, NULL, NULL, 5, '接口使用interface修饰;接口不能包含普通方法,只能存在抽象方法。接口中的方法默认使用 public abstract修饰。', 1, '2', NULL, 4);
INSERT INTO `question` VALUES (10, 'It is an important feature of the Java language that it always provides a default constructor to a class.', NULL, NULL, NULL, NULL, 3, '错', 1, '3', '只有在不显示声明构造方法时，系统才提供默认无参构造方法', 4);
INSERT INTO `question` VALUES (11, '下列选项中符合Java命名规则的标识符是（）', '2japro', '&Class', 'const', '_123', 1, 'D', 1, '1', '除去java中关键字，java中标识符是：字下美人数-----字母，下划线，美元符号，人民币，数字（数字不能放首位）', 4);
INSERT INTO `question` VALUES (12, '在Java线程状态转换时，下列转换不可能发生的有（）？', '初始态->运行态', '就绪态->运行态', '阻塞态->运行态', '运行态->就绪态', 2, 'A, C', 1, '2', '初始态->就绪态->运行态，阻塞态->就绪态->运行态', 1);
INSERT INTO `question` VALUES (13, '明朝时期张居正改革的一条鞭法的主要思想是()', '面向过程', '万物皆数', '统一接口', '泛型编程', 1, 'C', 1, '3', '鞭法既条例，条例既规范，规范就是接口', 4);
INSERT INTO `question` VALUES (14, 'jdk1.8中，下面有关java 抽象类和接口的区别，说法错误的是？', '抽象类可以有构造方法，接口中不能有构造方法', '抽象类中可以包含非抽象的普通方法，接口中的方法必须是抽象的，不能有非抽象的普通方法', '一个类可以实现多个接口，但只能继承一个抽象类', '接口中可以有普通成员变量，抽象类中没有普通成员变量', 2, 'B,D', 1, '2', NULL, 1);
INSERT INTO `question` VALUES (15, '下面有关java final的基本规则，描述错误的是？', 'final修饰的类不能被继承', 'final修饰的成员变量只允许赋值一次，且只能在类方法赋值', 'final修饰的局部变量即为常量，只能赋值一次。', 'final修饰的方法不允许被子类覆盖', 1, 'B', 1, '2', 'final修饰的引用类型，不能再指向别的东西，但是可以改变其中的内容。', 1);
INSERT INTO `question` VALUES (16, '下面有关JVM内存，说法错误的是？', '程序计数器是一个比较小的内存区域，用于指示当前线程所执行的字节码执行到了第几行，是线程隔离的', 'Java方法执行内存模型，用于存储局部变量，操作数栈，动态链接，方法出口等信息，是线程隔离的', '方法区用于存储JVM加载的类信息、常量、静态变量、即时编译器编译后的代码等数据，是线程隔离的', '原则上讲，所有的对象都在堆区上分配内存，是线程之间共享的', 1, 'C', 1, '2', '运行时数据区包括：虚拟机栈区，堆区，方法区，本地方法栈，程序计数器', 1);
INSERT INTO `question` VALUES (17, 'ArrayList和Vector主要区别是什么？', 'Vector与ArrayList一样，也是通过数组实现的，不同的是Vector支持线程的同步', 'Vector与ArrayList一样，也是通过数组实现的，不同的是ArrayList支持线程的同步', 'Vector是通过链表结构存储数据，ArrayList是通过数组存储数据', '上述说法都不正确', 1, 'A', 1, '2', 'Vector支持线程的同步，也就是内部加锁的 但是效率低，因此在新版jdk中加入线程不安全的Arraylist', 1);
INSERT INTO `question` VALUES (18, '下面的类哪些可以处理Unicode字符?', 'InputStreamReader', 'BufferedReader', 'Writer', 'PipedInputStream', 2, 'A,B,C', 1, '2', '简单地说，字符流是字节流根据字节流所要求的编码集解析获得的 可以理解为字符流=字节流+编码集所以本题中和字符流有关的类都拥有操作编码集(unicode)的能力。', 1);
INSERT INTO `question` VALUES (19, '关于sleep()和wait()，以下描述错误的一项是（ ）', 'sleep是线程类（Thread）的方法，wait是Object类的方法；', 'sleep不释放对象锁，wait放弃对象锁', 'sleep暂停线程、但监控状态仍然保持，结束后会自动恢复', 'wait后进入等待锁定池，只有针对此对象发出notify方法后获得对象锁进入运行状态', 1, 'D', 1, '2', 'Java中的多线程是一种抢占式的机制，而不是分时机制。抢占式的机制是有多个线程处于可运行状态，但是只有一个线程在运行。 ', 4);
INSERT INTO `question` VALUES (20, '变量可以不进行赋值就使用。', NULL, NULL, NULL, NULL, 3, '错', 1, '1', NULL, 1);
INSERT INTO `question` VALUES (21, '一个类只能继承一个父类。', NULL, NULL, NULL, NULL, 3, '对', 1, '1', 'Java中类之间单继承', 1);
INSERT INTO `question` VALUES (22, '抽象类用______关键字修饰？', NULL, NULL, NULL, NULL, 4, 'abstract', 1, '1', NULL, 1);
INSERT INTO `question` VALUES (23, '接口用______关键字修饰？', NULL, NULL, NULL, NULL, 4, 'interface', 1, '1', NULL, 1);
INSERT INTO `question` VALUES (24, 'Java虚拟机(JVM)全拼是________?', NULL, NULL, NULL, NULL, 4, 'Java Virtual Machine', 1, '1', NULL, 1);
INSERT INTO `question` VALUES (25, '请简述你对集合框架的认识。', NULL, NULL, NULL, NULL, 5, '接口Collection 常用子接口:Set List Set接口常用实现类:HashSet,TreeSet,LinkedHashSet (都是线程非安全的类) List接口常用实现类:线程非安全:ArrayList,LindedList;线程安全:Stack,Vector', 1, '3', NULL, 1);
INSERT INTO `question` VALUES (26, '请写出一个线程安全的集合。', NULL, NULL, NULL, NULL, 5, 'List<String> list = Collections.synchronizedList(new ArrayList<String>())', 1, '2', NULL, 1);
INSERT INTO `question` VALUES (27, '以下哪个式子有可能在某个进制下成立（）？', '13*14=204', '12*34=568', '14*14=140', '1+1=3', 1, 'A', 1, '2', '先去十进制算出乘积的个位乘积，再去判断进制 13*14个位乘积为12，结果为204，则只可能为八进制，然后判断 BCD同理', 4);
INSERT INTO `question` VALUES (28, '以下关于Spring的说法是正确（ ）', 'Spring 不能和Hibernate一样设置bean是否为延迟加载', '在Spring配置文件中，就可以设置Bean初始化函数和消亡函数', '属性注入只能是简单数据，构造方法注入可以是对象', '对象的设计应使类和构件之间的耦合最小', 2, 'B,D', 1, '3', ' A、延迟加载有2种方法：一是hibernate提供的延迟载入机制；二是Spring框架提供的DAO模式结合Hibernate延迟加载的Web方案。故A错； B、spring可以 在配置文件中 配置Bean初始化函数和消亡函数，故B对； C、spring可以注入复杂的数据类型比如对象、数组、List集合、map集合、Properties等，故C错； D、对象之间的耦合越高,维护成本越高。对象的设计应使类和构件之间的耦合最小，故D对. 综上所述，答案为B、D.', 1);
INSERT INTO `question` VALUES (29, '下面有关spring依赖注入说法错误的是？', 'IOC就是由spring来负责控制对象的生命周期和对象间的关系', 'BeanFacotry是最简单的容器，提供了基础的依赖注入支持', 'ApplicationContext建立在BeanFacotry之上，提供了系统构架服务', '如果Bean的某一个属性没有注入，ApplicationContext加载后，直至第一次使用调用getBean方法才会抛出异常；而BeanFacotry则在初始化自身时检验，这样有利于检查所依赖属性是否注入', 1, 'D', 1, '3', 'ApplicationContext初始化时会检验，而BeanFactory在第一次使用时未注入，才会抛出异常 ', 1);
INSERT INTO `question` VALUES (30, '下面有关forward和redirect的描述，正确的是() ？', 'forward是服务器将控制权转交给另外一个内部服务器对象，由新的对象来全权负责响应用户的请求', '执行forward时，浏览器不知道服务器发送的内容是从何处来，浏览器地址栏中还是原来的地址', '执行redirect时，服务器端告诉浏览器重新去请求地址', 'forward是内部重定向，redirect是外部重定向', 2, 'B,C,D', 1, '3', '重定向，其实是两次request, 第一次，客户端request A,服务器响应，并response回来，告诉浏览器，你应该去B。这个时候IE可以看到地址变了，而且历史的回退按钮也亮了。重定向可以访问自己web应用以外的资源。在重定向的过程中，传输的信息会被丢失。', 4);
INSERT INTO `question` VALUES (31, 'Java.Thread的方法resume()负责重新开始被以下哪个方法中断的线程的执行（）。', 'stop', 'sleep', 'wait', 'suspend', 1, 'D', 1, '3', 'suspend() 和 resume() 方法：两个方法配套使用，suspend()使得线程进入阻塞状态，并且不会自动恢复，必须其对应的 resume() 被调用，才能使得线程重新进入可执行状态', 1);
INSERT INTO `question` VALUES (32, '判断{company：4399} 的json格式是否正确', NULL, NULL, NULL, NULL, 3, '错', 1, '1', 'json对象要求属性必须加双引号。', 1);
INSERT INTO `question` VALUES (33, '判断{\"company\":{\"name\":[4399,4399,4399]}}json格式是否正确', NULL, NULL, NULL, NULL, 3, '对', 1, '1', 'JSON语法可以表示以下三种类型的值:  1.简单值：使用与JavaScript 相同的语法，可以在JSON中表示字符串，数值，布尔值和null。  2.对象：对象作为一种复杂数据类型，表示的是一组有序的键值对。而每组键值对中的值可以是简单值，也可以是复杂数据类型的值。  3.数组：数组也是一种复杂数据类型，表示一组有序的值的列表，可以通过数值索引来访问其中的值。数组的值也可以是任意类型--简单值，对象或数组。', 1);
INSERT INTO `question` VALUES (34, '判断{[4399,4399,4399]}json格式是否正确', NULL, NULL, NULL, NULL, 3, '错', 1, '1', '使用 {} 则为json对象。json对象必须由一组有序的键值对组成。', 1);
INSERT INTO `question` VALUES (35, 'volatile关键字的说法错误的是', '能保证线程安全', 'volatile关键字用在多线程同步中，可保证读取的可见性', 'JVM保证从主内存加载到线程工作内存的值是最新的', 'volatile能禁止进行指令重排序', 1, 'A', 1, '3', ' 出于运行速率的考虑，java编译器会把经常经常访问的变量放到缓存（严格讲应该是工作内存）中，读取变量则从缓存中读。但是在多线程编程中,内存中的值和缓存中的值可能会出现不一致。volatile用于限定变量只能从内存中读取，保证对所有线程而言，值都是一致的。但是volatile不能保证原子性，也就不能保证线程安全。', 1);
INSERT INTO `question` VALUES (36, '简述Java中volatile关键字的功能', NULL, NULL, NULL, NULL, 5, 'volatile是java中的一个类型修饰符。它是被设计用来修饰被不同线程访问和修改的变量。如果不加入volatile，基本上会导致这样的结果：要么无法编写多线程程序，要么编译器 失去大量优化的机会。 1，可见性     可见性指的是在一个线程中对该变量的修改会马上由工作内存（Work Memory）写回主内存（Main Memory），所以会马上反应在其它线程的读取操作中。顺便一提，工作内存和主内存可以近似理解为实际电脑中的高速缓存和主存，工作内存是线程独享的，主存是线程共享的。 2，禁止指令重排序优化     禁止指令重排序优化。大家知道我们写的代码（尤其是多线程代码），由于编译器优化，在实际执行的时候可能与我们编写的顺序不同。编译器只保证程序执行结果与源代码相同，却不保证实际指令的顺序与源代码相同。这在单线程看起来没什么问题，然而一旦引入多线程，这种乱序就可能导致严重问题。volatile关键字就可以从语义上解决这个问题。     注意，禁止指令重排优化这条语义直到jdk1.5以后才能正确工作。此前的JDK中即使将变量声明为volatile也无法完全避免重排序所导致的问题。所以，在jdk1.5版本前，双重检查锁形式的单例模式是无法保证线程安全的。因此，下面的单例模式的代码，在JDK1.5之前是不能保证线程安全的。', 1, '3', 'jvm运行时刻内存的分配', 4);
INSERT INTO `question` VALUES (37, '关键字super的作用是？', '用来访问父类被隐藏的非私有成员变量', '用来调用父类中被重写的方法', '用来调用父类的构造函数', '以上都是', 1, 'D', 1, '1', 'super代表父类对应的对象，所以用super访问在子类中无法直接使用的父类成员和方法', 1);
INSERT INTO `question` VALUES (38, 'final、finally和finalize的区别中，下述说法正确的有？', 'final用于声明属性，方法和类，分别表示属性不可变，方法不可覆盖，类不可继承。', 'finally是异常处理语句结构的一部分，表示总是执行。', 'finalize是Object类的一个方法，在垃圾收集器执行的时候会调用被回收对象的此方法，可以覆盖此方法提供垃圾收集时的其他资源的回收，例如关闭文件等。', '引用变量被final修饰之后，不能再指向其他对象，它指向的对象的内容也是不可变的。', 2, 'A,B', 1, '1', '使用 final 关键字修饰一个变量时，是指引用变量不能变，引用变量所指向的对象中的内容还是可以改变的。一般不要使用finalize，最主要的用途是回收特殊渠道申请的内存。Java程序有垃圾回收器，所以一般情况下内存问题不用程序员操心。但有一种JNI(Java Native Interface)调用non-Java程序（C或C++），finalize()的工作就是回收这部分的内存。', 4);
INSERT INTO `question` VALUES (39, '请简述你对final、finally、finalize的理解', NULL, NULL, NULL, NULL, 5, '一.final 如果一个类被声明为final，意味着它不能再派生出新的子类，不能作为父类被继承。因此一个类不能既被声明为 abstract的，又被声明为final的。将变量或方法声明为final，可以保证它们在使用中不被改变。被声明为final的变量必须在new一个对象时初始化（即只能在声明变量或构造器或代码块内初始化），而在以后的引用中只能读取，不可修改。被声明为final的方法也同样只能使用，不能覆盖(重写)。 二.finally 在异常处理时提供 finally 块来执行任何清除操作。如果抛出一个异常，那么相匹配的 catch 子句就会执行，然后控制就会进入 finally 块（如果有的话）。  三.finalize 方法名。Java 技术允许使用 finalize() 方法在垃圾收集器将对象从内存中清除出去之前做必要的清理工作。这个方法是由垃圾收集器在确定这个对象没有被引用时对这个对象调用的。它是在 Object 类中定义的，因此所有的类都继承了它。子类覆盖 finalize() 方法以整理系统资源或者执行其他清理工作。finalize() 方法是在垃圾收集器删除对象之前对这个对象调用的。注意：finalize不一定被jvm调用，只有当垃圾回收器要清除垃圾时才被调用。', 1, '2', '概念题，注意区分即可', 1);
INSERT INTO `question` VALUES (40, '在java中，类Cat里面有个公有方法sleep()，该方法前有static修饰，则可以直接用Cat.sleep()。', NULL, NULL, NULL, NULL, 3, '对', 1, '2', '在本类中可以直接使用 但如果是private并且在其他类就不能这么直接用了', 4);
INSERT INTO `question` VALUES (41, '有时为了避免某些未识别的异常抛给更高的上层应用，在某些接口实现中我们通常需要捕获编译运行期所有的异常， catch 哪个类的实例才能达到目的_________', NULL, NULL, NULL, NULL, 4, 'Exception', 1, '2', '因为error是系统出错，catch是无法处理的，难以修复的，RuntimeException不需要程序员进行捕获处理，error和exception都是throwable的子类，我们只需要对exception的实例进行捕获即可', 4);
INSERT INTO `question` VALUES (42, '以下集合对象中哪几个是线程安全的？( )', 'ArrayList', 'Vector', 'Hashtable', 'Stack', 2, 'B,C,D', 1, '1', ' vector：就比arraylist多了个同步化机制（线程安全），因为效率较低，现在已经不太建议使用。在web应用中，特别是前台页面，往往效率（页面响应速度）是优先考虑的。 statck：堆栈类，先进后出 hashtable：就比hashmap多了个线程安全 enumeration：枚举，相当于迭代器 除了这些之外，其他的都是非线程安全的类和接口。', 1);
INSERT INTO `question` VALUES (43, '下列说法正确的是（）', 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个名字为main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中，如果只有一条语句，可以不用{}（大括号）括起来', 2, 'A,B', 1, '2', 'A.java是强类型语言，所有的方法必须放在类里面，包括main B .java中可以有多个重载的main方法，只有public static void main(String[] args){}是函数入口 C.内部类的类名一般与文件名不同 D.函数都必须用{}括起来，不管是一条语句还是多条语句', 4);
INSERT INTO `question` VALUES (44, '判断：ThreadLocal存放的值是线程封闭，线程间互斥的，主要用于线程内共享一些数据，避免通过参数来传递', NULL, NULL, NULL, NULL, 3, '对', 1, '2', 'ThreadLocal模式是为了解决单线程内的跨类跨方法调用的 ThreadLocal不是用来解决对象共享访问问题的，而主要是提供了保持对象的方法和避免参数传递的方便的对象访问方式。', 4);
INSERT INTO `question` VALUES (45, '判断：线程的角度看，每个线程都保持一个对其线程局部变量副本的隐式引用，只要线程是活动的并且 ThreadLocal 实例是可访问的；在线程消失之后，其线程局部实例的所有副本都会被垃圾回收', NULL, NULL, NULL, NULL, 3, '对', 1, '2', '对于多线程资源共享的问题，同步机制采用了“以时间换空间”的方式，而ThreadLocal采用了“以空间换时间”的方式。前者仅提供一份变量，让不同的线程排队访问，而后者为每一个线程都提供了一份变量，因此可以同时访问而互不影响。', 1);
INSERT INTO `question` VALUES (46, '判断在Thread类中有一个Map，用于存储每一个线程的变量的副本。', NULL, NULL, NULL, NULL, 3, '对', 1, '2', NULL, 1);
INSERT INTO `question` VALUES (47, 'jre 判断程序是否执行结束的标准是（）', '所有的前台线程执行完毕', '所有的后台线程执行完毕', '所有的线程执行完毕', '和以上都无关', 1, 'A', 1, '2', '后台线程：指为其他线程提供服务的线程，也称为守护线程。JVM的垃圾回收线程就是一个后台线程。 前台线程：是指接受后台线程服务的线程，其实前台后台线程是联系在一起，就像傀儡和幕后操纵者一样的关系。傀儡是前台线程、幕后操纵者是后台线程。由前台线程创建的线程默认也是前台线程。可以通过isDaemon()和setDaemon()方法来判断和设置一个线程是否为后台线程。', 4);
INSERT INTO `question` VALUES (48, '下列哪个选项是Java调试器？如果编译器返回程序代码的错误，可以用它对程序进行调试。', 'java.exe', 'javadoc.exe', 'jdb.exe', 'javaprof.exe', 1, 'C', 1, '2', 'java.exe是java虚拟机  javadoc.exe用来制作java文档  jdb.exe是java的调试器  javaprof,exe是剖析工具', 1);
INSERT INTO `question` VALUES (49, '一般情况下，以下哪个选项不是关系数据模型与对象模型之间匹配关系？', '表对应类', '记录对应对象', '表的字段对应类的属性', '表之间的参考关系对应类之间的依赖关系', 1, 'D', 1, '1', '一般关系数据模型和对象数据模型之间有以下对应关系：表对应类，记录对应对象，表的字段对应类的属性', 1);
INSERT INTO `question` VALUES (50, '判断：在开发中使用泛型取代非泛型的数据类型（比如用ArrayList<String>取代ArrayList），程序的运行时性能会变得更好。', NULL, NULL, NULL, NULL, 3, '错', 1, '1', '泛型仅仅是java的语法糖，它不会影响java虚拟机生成的汇编代码，在编译阶段，虚拟机就会把泛型的类型擦除，还原成没有泛型的代码，顶多编译速度稍微慢一些，执行速度是完全没有什么区别的.', 1);
INSERT INTO `question` VALUES (51, '下列在Java语言中关于数据类型和包装类的说法，正确的是（）', '基本（简单）数据类型是包装类的简写形式，可以用包装类替代基本（简单）数据类型', 'long和double都占了64位（64bit）的存储空间。', '默认的整数数据类型是int，默认的浮点数据类型是float。', '和包装类一样，基本（简单）数据类型声明的变量中也具有静态方法，用来完成进制转化等。', 1, 'B', 1, '2', '1、整数类型byte（1个字节）short（2个字节）int（4个字节）long（8个字节） 2、字符类型char（2个字节） 3、浮点类型float（4个字节）double（8个字节）', 4);
INSERT INTO `question` VALUES (52, '下列关于容器集合类的说法正确的是？', 'LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', 1, 'C', 1, '2', 'a选项linkedlist类是实现了List接口，而不是继承 b选项AbstractSet类实现Set接口 c选项HashSet继承 AbstractSet类，同时也实现set d.WeakMap不存在于java集合框架的。只有一个叫做WeakHashMap（继承自AbstractMap）。 ', 1);
INSERT INTO `question` VALUES (53, '请填写Math.floor(-8.5)=________________ 答案，注明数据类型', NULL, NULL, NULL, NULL, 4, '(double)-9.0', 1, '2', ' Math.floor(x) 返回小于等于x的最接近整数，类型为double', 1);
INSERT INTO `question` VALUES (54, 'BufferedReader的父类是_____________', NULL, NULL, NULL, NULL, 4, 'Reader', 1, '1', 'java.io.Reader是一个读取字符流的抽象类，通过继承Reader类，可以很方便的读取字符流', 4);
INSERT INTO `question` VALUES (55, '简述你知道的JAVA中Object类的方法', NULL, NULL, NULL, NULL, 5, 'wait() notify() notifyAll()', 1, '1', 'A    synchronized     Java语言的关键字，当它用来修饰一个方法或者一个代码块的时候，能够保证在同一时刻最多只有一个线程执行该段代码。E   sleep 是Thread类中的方法', 1);
INSERT INTO `question` VALUES (56, '下面哪个注解不是Spring 提供的', '@Service', '@Autowrid', '@Resource', '@Configuration', 1, 'C', 4, '1', '@Resource 是 java 的原生注解', 4);
INSERT INTO `question` VALUES (57, '下列选项中与数据存储结构无关的术语是', '顺序表', '链表', '链队列', '栈', 1, 'D', 30, '1', NULL, 4);
INSERT INTO `question` VALUES (58, '组成数据的基本单位是', '数据项', '数据类型', '数据元素', '数据变量', 1, 'C', 30, '1', NULL, 4);
INSERT INTO `question` VALUES (59, '设数据结构A=(D，R)，其中D={1，2，3，4}，R={r}，r={<1，2>，<2，3>，<3，4>，<4，1>}，则数据结构A是', '线性结构', '树型结构', '图型结构', '集合', 1, 'C', 30, '1', NULL, 4);
INSERT INTO `question` VALUES (60, '数据结构是', '一种数据类型', '数据的存储结构', '一组性质相同的数据元素的集合', '相互之间存在一种或多种特定关系的数据元素的集合', 1, 'B', 30, '1', NULL, 4);
INSERT INTO `question` VALUES (61, '对一个算法的评价，不包括如下（  ）方面的内容。', '健壮性和可读性 ', '并行性 ', '正确性', '时空复杂度', 1, 'B', 30, '1', NULL, 4);
INSERT INTO `question` VALUES (62, '模电题目1', '1111', '22222', '333333', '444444444', 1, 'A', 5, '1', NULL, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id:管理员_1，学生_2，老师_3',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员');
INSERT INTO `role` VALUES (2, '学生');
INSERT INTO `role` VALUES (3, '教师');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 31);
INSERT INTO `role_permission` VALUES (1, 32);
INSERT INTO `role_permission` VALUES (1, 33);
INSERT INTO `role_permission` VALUES (1, 34);
INSERT INTO `role_permission` VALUES (1, 35);
INSERT INTO `role_permission` VALUES (1, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (1, 9);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (1, 27);
INSERT INTO `role_permission` VALUES (1, 28);
INSERT INTO `role_permission` VALUES (1, 29);
INSERT INTO `role_permission` VALUES (1, 30);
INSERT INTO `role_permission` VALUES (1, 36);
INSERT INTO `role_permission` VALUES (1, 37);
INSERT INTO `role_permission` VALUES (1, 38);
INSERT INTO `role_permission` VALUES (1, 39);
INSERT INTO `role_permission` VALUES (3, 30);
INSERT INTO `role_permission` VALUES (3, 17);
INSERT INTO `role_permission` VALUES (3, 18);
INSERT INTO `role_permission` VALUES (3, 44);
INSERT INTO `role_permission` VALUES (3, 40);
INSERT INTO `role_permission` VALUES (3, 41);
INSERT INTO `role_permission` VALUES (3, 42);
INSERT INTO `role_permission` VALUES (3, 43);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (3, 3);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (3, 19);
INSERT INTO `role_permission` VALUES (3, 20);
INSERT INTO `role_permission` VALUES (3, 21);
INSERT INTO `role_permission` VALUES (3, 22);
INSERT INTO `role_permission` VALUES (3, 23);
INSERT INTO `role_permission` VALUES (3, 23);
INSERT INTO `role_permission` VALUES (3, 13);
INSERT INTO `role_permission` VALUES (3, 14);
INSERT INTO `role_permission` VALUES (3, 15);
INSERT INTO `role_permission` VALUES (3, 16);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (2, 24);
INSERT INTO `role_permission` VALUES (3, 5);
INSERT INTO `role_permission` VALUES (3, 6);
INSERT INTO `role_permission` VALUES (3, 11);
INSERT INTO `role_permission` VALUES (3, 25);
INSERT INTO `role_permission` VALUES (3, 26);
INSERT INTO `role_permission` VALUES (3, 45);
INSERT INTO `role_permission` VALUES (3, 36);
INSERT INTO `role_permission` VALUES (3, 12);
INSERT INTO `role_permission` VALUES (2, 12);
INSERT INTO `role_permission` VALUES (2, 46);
INSERT INTO `role_permission` VALUES (3, 46);
INSERT INTO `role_permission` VALUES (1, 47);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 5);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分数id',
  `stu_id` int NULL DEFAULT NULL COMMENT '考生id',
  `paper_id` int NULL DEFAULT NULL COMMENT '试卷id',
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷分数',
  `wrong_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '错题id集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (53, 1, 54, 'Java 程序设计基础期中考试', '80', '5,18,25,39');
INSERT INTO `score` VALUES (54, 2, 54, 'Java 程序设计基础期中考试', '55', '51,37,5,18,25,39');
INSERT INTO `score` VALUES (55, 1, 55, 'JavaEE 期中考试', '100', NULL);
INSERT INTO `score` VALUES (56, 2, 55, 'JavaEE 期中考试', '100', NULL);
INSERT INTO `score` VALUES (57, 1, 56, '2022-2 数据结构期中考试', '80', '60');
INSERT INTO `score` VALUES (58, 2, 56, '2022-2 数据结构期中考试', '100', NULL);
INSERT INTO `score` VALUES (59, 1, 60, 'JavaSE 期末考试', '53', '49,16,27,37,12,9,39');
INSERT INTO `score` VALUES (60, 247, 64, 'j2ee期末考试', '45', '15,14,39,25');

-- ----------------------------
-- Table structure for stu_answer_record
-- ----------------------------
DROP TABLE IF EXISTS `stu_answer_record`;
CREATE TABLE `stu_answer_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生答题记录id',
  `paper_id` int NULL DEFAULT NULL COMMENT '试卷id',
  `stu_id` int NULL DEFAULT NULL COMMENT '学生id',
  `question_id` int NULL DEFAULT NULL COMMENT '题目id',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '题目答案',
  `score` int NULL DEFAULT NULL COMMENT '题目得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_answer_record
-- ----------------------------
INSERT INTO `stu_answer_record` VALUES (90, 54, 1, 25, '接口Collection 常用子接口:Set List Set接口常用实现类:HashSet,TreeSet,LinkedHashSet (都是线程非安全的类) List接口常用实现类:线程非安全:ArrayList,LindedList;', 19);
INSERT INTO `stu_answer_record` VALUES (91, 54, 1, 39, '一.final 如果一个类被声明为final，意味着它不能再派生出新的子类，不能作为父类被继承。因此一个类不能既被声明为 abstract的，又被声明为final的。将变量或方法声明为final，可以保证它们在使用中不被改变。被声明为final的变量必须在new一个对象时初始化（即只能在声明变量或构造器或代码块内初始化），而在以后的引用中只能读取，不可修改。被声明为final的方法也同样只能使用，不能覆盖(重写)。 二.finally 在异常处理时提供 finally 块来执行任何清除操作。如果抛出一个异常，那么相匹配的 catch 子句就会执行，然后控制就会进入 finally 块（如果有的话）。  三.finalize 方法名。Java 技术允许使用 finalize() 方法在垃圾收集器将对象从内存中清除出去之前做必要的清理工作。这个方法是由垃圾收集器在确定这个对象没有被引用时对这个对象调用的。它是在 Object 类中定义的，因此所有的类都继承了它。子类覆盖 finalize() 方法以整理系统资源或者执行其他清理工作。finalize() 方法是在垃圾收集器删除对象之前对这个对象调用的。注意：finalize不一定被jvm调用，只有当垃圾回收器要清除垃圾时才被调用。', 20);
INSERT INTO `stu_answer_record` VALUES (92, 54, 2, 25, 'List Collection', 5);
INSERT INTO `stu_answer_record` VALUES (93, 54, 2, 39, '一.final 如果一个类被声明为final，意味着它不能再派生出新的子类，不能作为父类被继承。因此一个类不能既被声明为 abstract的，又被声明为final的。将变量或方法声明为final，可以保证它们在使用中不被改变。被声明为final的变量必须在new一个对象时初始化（即只能在声明变量或构造器或代码块内初始化），而在以后的引用中只能读取，不可修改。被声明为final的方法也同样只能使用，不能覆盖(重写)。 二.finally 在异常处理时提供 finally 块来执行任何清除操作。如果抛出一个异常，那么相匹配的 catch 子句就会执行，然后控制就会进入 finally 块（如果有的话）。  三.finalize 方法名。Java 技术允许使用 finalize() 方法在垃圾收集器将对象从内存中清除出去之前做必要的清理工作。这个方法是由垃圾收集器在确定这个对象没有被引用时对这个对象调用的。它是在 Object 类中定义的，因此所有的类都继承了它。子类覆盖 finalize() 方法以整理系统资源或者执行其他清理工作。finalize() 方法是在垃圾收集器删除对象之前对这个对象调用的。注意：finalize不一定被jvm调用，只有当垃圾回收器要清除垃圾时才被调用。', 20);
INSERT INTO `stu_answer_record` VALUES (94, 60, 1, 9, '接口使用interface修饰，默认没有方法体。接口中的方法默认使用 public abstract修饰，JDK8之后，接口可以有默认的方法实现。', 10);
INSERT INTO `stu_answer_record` VALUES (95, 60, 1, 39, '一.final 如果一个类被声明为final，意味着它不能再派生出新的子类，不能作为父类被继承。因此一个类不能既被声明为 abstract的。 二.finally 在异常处理时提供 finally 块来执行任何清除操作。如果抛出一个异常，那么相匹配的 catch 子句就会执行，然后控制就会进入 finally 块。  三.finalize 方法名。Java 技术允许使用 finalize() 方法在垃圾收集器将对象从内存中清除出去之前做必要的清理工作。这个方法是由垃圾收集器在确定这个对象没有被引用时对这个对象调用的。', 12);
INSERT INTO `stu_answer_record` VALUES (96, 64, 247, 39, '测试', 0);
INSERT INTO `stu_answer_record` VALUES (97, 64, 247, 25, '测试', 0);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生登录密码',
  `stu_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `sex` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `major_id` int NULL DEFAULT NULL COMMENT '专业id',
  `level` int NULL DEFAULT NULL COMMENT '年级',
  `grade_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '蔡一', '$2a$10$ajDmspQ42D2NGsVTpHJTdevtUmLFl6VZw/WcmSkpF5i93enO8cni.', '201701', 2, '男', 1, 17, '1');
INSERT INTO `student` VALUES (2, '马飞', '$2a$10$ViIVUNzXsflPxhcWBFEAq.y0SM.c12Ylcq/snyCgtdttU7QPf7.12', '201702', 2, '男', 1, 17, '1');
INSERT INTO `student` VALUES (224, '李楠', '$2a$10$DzeilIbKHjo9WAFFwCurAuHJu.OzCvx.OGOlCZneaPiyBaDBKaz1C', '20176695', 2, '男', 1, 17, NULL);
INSERT INTO `student` VALUES (225, '吴航', '$2a$10$qv8VKvrlGZgMcuK4p9gf1.RUfPD2xY8Cyv4VMFLyTdpn4TRWBpFKe', '20182291', 2, '男', 1, 18, NULL);
INSERT INTO `student` VALUES (226, '赵松', '$2a$10$FLNCdtKpXLCzdBt5XkWgDuEMC2P8et21aFYUgLc2pnmYwAoufFP.i', '20190549', 2, '男', 1, 19, NULL);
INSERT INTO `student` VALUES (227, '张之洞', '$2a$10$73doLs0/8GHNUiYIJt1tgOU9WmvHDZhuFopB7bHiRpka1pDmlBQMW', '20179123', 2, '男', 1, 17, NULL);
INSERT INTO `student` VALUES (228, '韩航', '$2a$10$O1Xdmer4/lMC5AAsjdg8feVy1/xx.MFDz.UJ5tnVfPXeOBKB7kJua', '20176950', 2, '男', 1, 17, NULL);
INSERT INTO `student` VALUES (230, '陈云', '$2a$10$SGHZJ5QtQmOerWz2kb1xPe1vgcecqjSFQwoLROtt2bpuasyTKK3Ri', '20187796', 2, '女', 1, 18, NULL);
INSERT INTO `student` VALUES (231, '陈悦', '$2a$10$is8rHTJmAMTsoXjq.o1GWO4SXUHC38Lzw1IRYxdHoKlhNtbw/5v0e', '20165591', 2, '女', 1, 16, NULL);
INSERT INTO `student` VALUES (232, '李安然', '$2a$10$KVwg3LMZWd4OCGN/Sl.Lb.xkcVhEyIGKSDtxagzOKSfR4vSL/ccRq', '20175903', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (233, '骆丹', '$2a$10$WcTpi9G1vDaz5UC1f.6TAeKKTgRe2/6KZh7AYRerf3xSF6Nq3l0hG', '20193001', 2, '女', 1, 19, NULL);
INSERT INTO `student` VALUES (234, '苏楷红', '$2a$10$EXp3i3SJ3/ZgS86Adh/SIuIqnQMr4pXBTXdyyXDMgDSgFItelEv4m', '20176320', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (235, '李沐风', '$2a$10$YWfsG9MiL98cmU0qnPNvUuoUM63FFa4h1H1UEetsPjNqA6rA0yoya', '20177782', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (236, '赵雷', '$2a$10$H4unBuj9B4l2GXYcjZA2ReiGtgaeMuCFuXpaJXmc8M4K/VA1AX29e', '20189032', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (237, '赵磊', '$2a$10$WGYBdEvAGqH34K..yIn9Oelrrq.3ji8jSWaGm6DiKylaSzQDycc7.', '20184309', 2, '女', 1, 18, NULL);
INSERT INTO `student` VALUES (238, '赵蕾', '$2a$10$LKWmh/52nwUmMHJZvNk6B.XBbA2r4J6WZmEmxfcGtwnthyoBaFQ0u', '20179343', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (239, '李斯', '$2a$10$k7ap5wcblI27qhhO2RUmjux60XROYXGdRtHDMmrR6Shep/EDcaXnq', '20170404', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (240, '李偲', '$2a$10$muOoWec2KPygpLwCxsErGeozgToTKkbU5NM6n6AE7S47KtDrHtk.G', '20173020', 2, '女', 1, 17, NULL);
INSERT INTO `student` VALUES (241, '梁宇', '$2a$10$QPEzMTtsStSETFN.AKANfeCGg37mqAR3PlGxAP.FVZ7SW9NoB7L9u', '20172082', 2, '女', 1, 18, NULL);
INSERT INTO `student` VALUES (242, '梁玉', '$2a$10$R2gQpDvlTQBjEeFR7KQN0O8lnhY5w3hOT5zEq4UxgrpYYjjC7/eL6', '20180392', 2, '男', 1, 19, NULL);
INSERT INTO `student` VALUES (243, '梁钰', '$2a$10$PI2QU.Y2uILHOC5DuBwMYuPJ1sSAH9CY.dQUbRhgkfFv/mm15IKie', '20192203', 2, '男', 1, 19, NULL);
INSERT INTO `student` VALUES (244, '郑悦', '$2a$10$yEunc1QDEezcC/1FqPRTAOxe6XBZPZwyZUFfZ647rI9CxEuCSkK7y', '20193301', 2, '女', 1, 19, NULL);
INSERT INTO `student` VALUES (245, '郑越', '$2a$10$/OxCjsMAGAh0QerZEpLTFe3TsUNFwaNJr6ZLndWbaG21Dvwq.ThQC', '20193485', 2, '男', 1, 19, NULL);
INSERT INTO `student` VALUES (246, '郑玥', '$2a$10$U6TRz4MgFN333w6mopJVceA1JhsKq2xpdCTRRDSSQvGd6p9ReGElK', '20187702', 2, '男', 1, 18, NULL);
INSERT INTO `student` VALUES (247, '蔡二', '$2a$10$GD125P7LHCaE5GgqHeJnsecLDrkakIH.g992cARurJrTTGyFsflAu', '202164', 2, '男', 1, 21, '33');
INSERT INTO `student` VALUES (248, '芜湖', '$2a$10$XHWq7Zif/6kvjmdcyzPuDeDV/FflblLJ/TK15d4NjEa1qHGSaDqkK', '20210334', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (249, '李飞', '$2a$10$MZ7CkTPh5g2kwTE.e2BOH.YstEPudPsFp4IcymirMXKpJY55VHTgi', '20214343', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (250, '张松', '$2a$10$lypCQEo9sqazXqcF5kHOB.k45ggXgBO3YEnMDdQAYKL5NVA6DAoSm', '20216607', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (251, '林安', '$2a$10$EFLuCjAxDAiEg6j2EMvSaO7wjnb1smYsP6coyoS.ZQanccovD8joC', '20219796', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (252, '李楠', '$2a$10$GGGCBlG2wfMlk2M6wGI1H.U5oWQxNjTO03eYZnY1hyQglB0m6aCmG', '20216695', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (253, '吴航', '$2a$10$5uU7lkysMtR2LZBslZgc3.amVe7Qp0F9bI0yINObbef0rVDAdEEXO', '20212291', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (254, '张之洞', '$2a$10$My93.OgsZrwuPIo4vX5aCO/B3Dqsa80XE6R48tMLWeoarv0jkQBiy', '20219123', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (255, '韩航', '$2a$10$LfPTLYH4VTyWOMnVr8ZGrOmZW9ndqwSaYUUbU2xjvB9nG2tUvyfO.', '20216950', 2, '男', 1, 21, NULL);
INSERT INTO `student` VALUES (256, '徐峰', '$2a$10$Z7.OlO90mg1YyCwn7JkE8.pfKbcWg7MpGzHYGXHLrFdLNlUz19Kri', '20205594', 2, '男', 1, 20, NULL);
INSERT INTO `student` VALUES (257, '陈云', '$2a$10$NuR7SoDBislot7Tglw33E.28OOVAzq8oQBvmMtlSoHWm7ivcST9ze', '20217796', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (258, '陈悦', '$2a$10$bNYO5wrKllXoK3oRVASdlOUMojSqGaIZ7MgspanQ96Jne0Cn6DGj.', '20205591', 2, '女', 1, 20, NULL);
INSERT INTO `student` VALUES (259, '李安然', '$2a$10$WhwbrKKxLuXjPZkjjDbLkO7D6PccfSmkHYUSfIWwnkOLJtnbPh60K', '20215903', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (260, '苏楷红', '$2a$10$mlVLc7IxXHeE77ryffFkxOoSva/W.E7yb5ZY0hv/Ok0HvBMQKaUha', '20216320', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (261, '李沐风', '$2a$10$rkhCwfXmbP0mWOJaSisqA.XBe6q8DJL.bV/RCD.3hLgEHY/s8n4hS', '20217782', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (262, '赵雷', '$2a$10$D3DU1QW9F5xNhPzHo9HM4uUKIWPOEjx.XAlAMXMukrhWW/t70Znxi', '20219032', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (263, '赵磊', '$2a$10$Wh4vwJrxTd8I06drFvb5ue1aMaiZaKrCBeoPA60tSetwLPGPIOK1O', '20214309', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (264, '赵蕾', '$2a$10$GQyqtuSAeBACYxMpu/jSF.CGCJJzO70UuFN3lL/zq84NmvxHTVqVu', '20219343', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (265, '李斯', '$2a$10$HT9YY3oHaleIbhlbf8r9MebOcYeA5yCUUL8yL6vogvOsIx9wqIyU6', '20210404', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (266, '李偲', '$2a$10$IWnJYmJ86OgZkATBE2FsgOsJohEm45TEUCg..M4AQMO1JlbmSulBq', '20213020', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (267, '梁宇', '$2a$10$baWMx8k2guPMD1VtavWxw.WkrxuKDc1AExor96OAOUfhC8Z72Zi3W', '20212082', 2, '女', 1, 21, NULL);
INSERT INTO `student` VALUES (268, '梁玉', '$2a$10$WMTmpRadbb0fJm.oO9NiouTc/vb3yVzOW2dsFdyjphittzcoU/DCC', '20210392', 2, '男', 1, 19, NULL);
INSERT INTO `student` VALUES (269, '郑玥', '$2a$10$BdBj2gRz6v2gLfyARYXXZO9jbPsOlFXdmB/gRCyBRzgbToCZawfe2', '20217702', 2, '男', 1, 21, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `work_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `job` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位',
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `academy_id` int NULL DEFAULT NULL COMMENT '所属学院',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '张三', '123', '$2a$10$2RcqJFggXLwZdPRjkkgDJ.rKqDRYO3Z3P0acmdFvMy2.OyqGZneUq', 3, '副教授', '男', 1);
INSERT INTO `teacher` VALUES (2, '郭靖', '789', '$2a$10$3W1c19JKAxjII6350s.k3OMcBZqJSGYCzpWQQifWAk3v6SW5M3ile', 3, '副教授', '女', 1);
INSERT INTO `teacher` VALUES (3, '柯镇恶', '346', '$2a$10$68Z5YwlAUmpKhNZjlcmCeObvypnfNGNP7wdn3izO5qzMEftRvHIAW', 3, '教授', '女', 2);
INSERT INTO `teacher` VALUES (4, '湖东', '996', '$2a$10$axKB.un1TPT1acD.3f64ZevmUtPt1hhL1IhBz4aUfwdGKx/y6Rd2C', 3, '教授', '男', 1);
INSERT INTO `teacher` VALUES (5, '黄蓉', '129', '$2a$10$AQsRyyHIwmr0mkVb9XoeNuVw46k.FCMvvNDNnFWn2/JyN6ISJvxqy', 3, '高级讲师', '女', 1);
INSERT INTO `teacher` VALUES (7, '穆念慈', '780', '$2a$10$O4oQ3H8qoWwHKJR.awR9PO/nETitRBmx95RAx3vuJJ/ggQ/uKuBs2', 3, '教授', '女', 1);
INSERT INTO `teacher` VALUES (17, '苏宇星', '6690', '$2a$10$UyooT29CPaVdZjbB2EMSTuDFTvpWwgmjcs8Ufu5ybYFF28mkGsfum', 3, '教授', '男', 2);
INSERT INTO `teacher` VALUES (22, '王琦', '5425', '$2a$10$fq03x5NikoTEb6yMMnrmsO2Rn5AwH6bw2Buwf4QV8DJ4F2Gt7ruU.', 3, '教授', '男', 1);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '题目类型id',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目类型',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '各个类型题目的分数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '该类型题目说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '单选题', '5', NULL);
INSERT INTO `type` VALUES (2, '多选题', '10', NULL);
INSERT INTO `type` VALUES (3, '判断题', '5', NULL);
INSERT INTO `type` VALUES (4, '填空题', '5', NULL);
INSERT INTO `type` VALUES (5, '简答题', '20', NULL);
INSERT INTO `type` VALUES (6, '编程题', '20', NULL);

SET FOREIGN_KEY_CHECKS = 1;
