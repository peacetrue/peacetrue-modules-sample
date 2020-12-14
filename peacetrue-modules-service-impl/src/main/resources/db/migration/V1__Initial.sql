drop table if exists user;
create table user
(
    id            bigint auto_increment primary key comment '主键',
    username      varchar(32)  not null comment '用户名',
    password      varchar(255) not null comment '密码',
    creator_id    bigint       not null comment '创建者主键',
    created_time  datetime     not null comment '创建时间',
    modifier_id   bigint       not null comment '修改者主键',
    modified_time timestamp    not null comment '最近修改时间',
    constraint user_username_uindex unique (username)
);

INSERT INTO user (id, username, password, creator_id, created_time, modifier_id, modified_time)
VALUES (1, 'admin', '{noop}admin**', 1, '2020-11-22 02:29:13', 1, '2020-11-23 08:25:01');

drop table if exists attachment;
create table attachment
(
    id           bigint auto_increment primary key comment '主键',
    name         varchar(32)  not null comment '名称',
    path         varchar(255) not null comment '路径',
    sizes        bigint       not null comment '大小（字节）',
    state_id     tinyint      not null comment '状态编码. 1、临时，2、生效、3、删除',
    remark       varchar(255) not null comment '备注',
    creator_id   bigint       not null comment '创建者主键',
    created_time datetime     not null comment '创建时间'
) comment '附件';

create index attachment_name_index on attachment (name);
create index attachment_state_id_index on attachment (state_id);

drop table if exists dictionary_type;
create table dictionary_type
(
    id            bigint auto_increment primary key comment '主键',
    code          varchar(32)  not null comment '编码',
    name          varchar(32)  not null comment '名称',
    remark        varchar(255) not null comment '备注',
    creator_id    bigint       not null comment '创建者主键',
    created_time  datetime     not null comment '创建时间',
    modifier_id   bigint       not null comment '修改者主键',
    modified_time datetime     not null comment '最近修改时间',
    constraint dictionary_type_code_uindex unique (code)
) comment '字典类型';

create index dictionary_type_name_index on dictionary_type (name);

insert into dictionary_type (code, name, remark, creator_id, created_time, modifier_id, modified_time)
values ('businessType', '业务类型', '', 1, current_timestamp, 1, current_timestamp);

insert into dictionary_type (code, name, remark, creator_id, created_time, modifier_id, modified_time)
values ('registration', '报名类型', '', 1, current_timestamp, 1, current_timestamp);

insert into dictionary_type (code, name, remark, creator_id, created_time, modifier_id, modified_time)
values ('formFieldType', '表单字段类型', '', 1, current_timestamp, 1, current_timestamp);

insert into dictionary_type (code, name, remark, creator_id, created_time, modifier_id, modified_time)
values ('classifyType', '分类类别', '', 1, current_timestamp, 1, current_timestamp);

insert into dictionary_type (code, name, remark, creator_id, created_time, modifier_id, modified_time)
values ('collegeType', '学院类别', '', 1, current_timestamp, 1, current_timestamp);

drop table if exists dictionary_value;
create table dictionary_value
(
    id                   bigint auto_increment primary key comment '主键',
    dictionary_type_id   bigint       not null comment '字典类型. 主键',
    dictionary_type_code varchar(32)  not null comment '字典类型. 冗余编码方便查询',
    code                 varchar(32)  not null comment '编码',
    name                 varchar(255) not null comment '名称',
    remark               varchar(255) not null comment '备注',
    serial_number        tinyint      not null comment '序号',
    creator_id           bigint       not null comment '创建者主键',
    created_time         datetime     not null comment '创建时间',
    modifier_id          bigint       not null comment '修改者主键',
    modified_time        datetime     not null comment '最近修改时间',
    constraint dictionary_value_dictionary_type_id_code_uindex unique (dictionary_type_id, code)
) comment '字典项值';

create index dictionary_value_dictionary_type_code_index on dictionary_value (dictionary_type_code);



insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time,
                              modifier_id, modified_time)
values ((select id from dictionary_type where code = 'businessType'), 'businessType', 'childrenArt', '少儿美术', '', 1, 1,
        current_timestamp,
        1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time,
                              modifier_id, modified_time)
values ((select id from dictionary_type where code = 'businessType'), 'businessType', 'skillTest', '统招艺考', '', 2, 1,
        current_timestamp,
        1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time,
                              modifier_id, modified_time)
values ((select id from dictionary_type where code = 'businessType'), 'businessType', 'studyAbroad', '出国留学', '', 3, 1,
        current_timestamp,
        1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time,
                              modifier_id, modified_time)
values ((select id from dictionary_type where code = 'businessType'), 'businessType', 'ceramicArt', '陶瓷艺术', '', 4, 1,
        current_timestamp,
        1, current_timestamp);



insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'registration'), 'registration', 'childrenArt', '少儿美术', '', 1, 1,
        current_timestamp, 1, current_timestamp);


insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'formFieldType'), 'formFieldType', 'text', '简单文本', '', 1, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'formFieldType'), 'formFieldType', 'rich-text', '富文本', '', 2, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'formFieldType'), 'formFieldType', 'photo', '单图', '', 10, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'formFieldType'), 'formFieldType', 'photos', '多图', '', 11, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'formFieldType'), 'formFieldType', 'file', '文件', '', 12, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'classifyType'), 'classifyType', 'pageArea', '页面区域', '', 1, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'collegeType'), 'collegeType', 'artCollege', '各大美院', '', 1, 1,
        current_timestamp, 1, current_timestamp);

insert into dictionary_value (dictionary_type_id, dictionary_type_code, code, name, remark, serial_number, creator_id,
                              created_time, modifier_id, modified_time)
values ((select id from dictionary_type where code = 'collegeType'), 'collegeType', 'otherCollege', '其他院校', '',
        2, 1, current_timestamp, 1, current_timestamp);


DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT comment '主键',
    code          VARCHAR(64)  NOT NULL COMMENT '编码',
    name          VARCHAR(32)  NOT NULL COMMENT '名称',
    remark        VARCHAR(255) NOT NULL DEFAULT '' COMMENT '备注',
    type_id       BIGINT       NOT NULL COMMENT '类型',
    type_code     VARCHAR(32)  NOT NULL COMMENT '类型编码. 冗余字段',
    parent_id     BIGINT       NOT NULL COMMENT '父节点',
    level         TINYINT      NOT NULL COMMENT '层级',
    leaf          BIT          NOT NULL COMMENT '叶子节点',
    serial_number SMALLINT     NOT NULL COMMENT '序号',
    creator_id    BIGINT       NOT NULL COMMENT '创建者主键',
    created_time  DATETIME     NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT       NOT NULL COMMENT '修改者主键',
    modified_time DATETIME     NOT NULL COMMENT '最近修改时间'
) comment '分类';

insert into classify (id, code, name, remark, type_id, type_code, parent_id, level, leaf, serial_number, creator_id,
                      created_time, modifier_id, modified_time)
values (1, 'pageArea', '页面区域', '', (select id from dictionary_value where code = 'pageArea'), 'pageArea', 1, 1, true, 1,
        1, current_timestamp, 1, current_timestamp);


DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY comment '主键',
    name          VARCHAR(32)  NOT NULL COMMENT '姓名',
    age           TINYINT      NOT NULL COMMENT '年龄',
    mobile        VARCHAR(32)  NOT NULL COMMENT '手机',
    type_id       BIGINT       NOT NULL COMMENT '报名类型',
    email         VARCHAR(32)  NOT NULL COMMENT '电子邮箱',
    remark        VARCHAR(255) NOT NULL COMMENT '备注',
    creator_id    bigint       not null comment '创建者主键',
    created_time  datetime     not null comment '创建时间',
    modifier_id   bigint       not null comment '修改者主键',
    modified_time datetime     not null comment '最近修改时间'
) comment '在线报名';

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY comment '主键',
    title          VARCHAR(255)  NOT NULL COMMENT '标题',
    content        VARCHAR(2048) NOT NULL COMMENT '内容',
    state_id       tinyint       NOT NULL COMMENT '状态. 1、草稿；2、发布',
    published_time datetime      not null comment '发布时间',
    view_count     int           NOT NULL COMMENT '浏览次数',
    remark         VARCHAR(255)  NOT NULL COMMENT '备注',
    creator_id     bigint        not null comment '创建者主键',
    created_time   datetime      not null comment '创建时间',
    modifier_id    bigint        not null comment '修改者主键',
    modified_time  datetime      not null comment '最近修改时间'
) comment '通知公告';

DROP TABLE IF EXISTS college;
CREATE TABLE college
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    type_id       BIGINT                            NOT NULL comment '类别. 关联字典表 collegeType',
    type_code     VARCHAR(32)                       NOT NULL comment '类别编码',
    name          VARCHAR(32)                       NOT NULL COMMENT '名称',
    alias_name    VARCHAR(32)                       NOT NULL COMMENT '别名',
    intro         VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail        VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark        VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number bigint                            not null comment '序号',
    creator_id    BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time  DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time DATETIME                          NOT NULL COMMENT '修改时间'
) comment '院校';

insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '清华美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 1, 1,
        current_timestamp, 1, current_timestamp);

insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '中央美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 1, 1,
        current_timestamp, 1,
        current_timestamp);

insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '中国美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 2, 1,
        current_timestamp, 1,
        current_timestamp);

insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '鲁迅美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 3, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '四川美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 4, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '西安美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 5, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '天津美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 6, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'artCollege'), 'artCollege', '广州美术学院',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 7, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id,
                     modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '北京服装院校',
        'Tsinghua Academy of Fine Arts', '', '', '2019斩获清华美院合格证<span>149</span>张 / 设计类合格证 <br/>
						应届生斩获合格证<span>128</span>张，总量名列前茅', 10, 1,
        current_timestamp,
        1, current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '东华大学',
        'Tsinghua Academy of Fine Arts', '', '', '', 11, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '江南大学',
        'Tsinghua Academy of Fine Arts', '', '', '', 12, 1,
        current_timestamp, 1,
        current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '北京印刷大学',
        'Tsinghua Academy of Fine Arts', '', '', '', 13, 1,
        current_timestamp,
        1, current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '北京传媒大学',
        'Tsinghua Academy of Fine Arts', '', '', '', 14, 1,
        current_timestamp,
        1, current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '天津工业大学',
        'Tsinghua Academy of Fine Arts', '', '', '', 15, 1,
        current_timestamp,
        1, current_timestamp);


insert into college (type_id, type_code, name, alias_name, intro, detail, remark, serial_number, creator_id,
                     created_time,
                     modifier_id, modified_time)
values ((select id from dictionary_value where code = 'otherCollege'), 'otherCollege', '北京戏曲学院',
        'Tsinghua Academy of Fine Arts', '', '', '', 16, 1,
        current_timestamp,
        1, current_timestamp);


DROP TABLE IF EXISTS class_grade;
CREATE TABLE class_grade
(
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
#     business_type_id   BIGINT                            NOT NULL COMMENT '业务类型',
#     business_type_code VARCHAR(32)                       NOT NULL COMMENT '业务类型编码',
    pc_photo           VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo       VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    title              VARCHAR(32)                       NOT NULL COMMENT '标题',
    intro              VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail             VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark             VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number      bigint                            not null comment '序号',
    creator_id         BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time       DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id        BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time      DATETIME                          NOT NULL COMMENT '修改时间'
) comment '班级';



DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    pc_photo      VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo  VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    domain_id     BIGINT                            NOT NULL COMMENT '领域',
    domain_code   VARCHAR(32)                       NOT NULL COMMENT '领域编码',
    name          VARCHAR(32)                       NOT NULL COMMENT '姓名',
    intro         VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail        VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark        VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number bigint                            not null comment '序号',
    creator_id    BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time  DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time DATETIME                          NOT NULL COMMENT '修改时间'
) comment '导师';

DROP TABLE IF EXISTS student;
CREATE TABLE student
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    pc_photo      VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo  VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    name          VARCHAR(32)                       NOT NULL COMMENT '姓名',
    intro         VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail        VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark        VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number bigint                            not null comment '序号',
    creator_id    BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time  DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time DATETIME                          NOT NULL COMMENT '修改时间'
) comment '学生';

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

insert into student (pc_photo, mobile_photo, name, intro, detail, remark, serial_number, creator_id, created_time,
                     modifier_id, modified_time)
values ('student/default.png', 'student/default.png', '瑞秋', '瑞秋', '瑞秋', '瑞秋', 1, 1, current_timestamp, 1,
        current_timestamp);

drop table if exists success_case;
CREATE TABLE success_case
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    title          VARCHAR(255)                      NOT NULL COMMENT '标题',
    pc_photo       VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo   VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    student_id     bigint                            NOT NULL COMMENT '学生. 主键',
    student_name   VARCHAR(32)                       NOT NULL COMMENT '学生姓名',
    college_id     BIGINT                            NOT NULL COMMENT '学院',
    art_score      smallint                          NOT NULL COMMENT '美术鉴赏评分',
    course_score   smallint                          NOT NULL COMMENT '专业课评分',
    ranks          smallint                          NOT NULL COMMENT '专业排名',
    published_date date                              NOT NULL COMMENT '公布日期',
    remark         VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number  bigint                            not null comment '序号',
    creator_id     BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time   DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id    BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time  DATETIME                          NOT NULL COMMENT '修改时间'
) comment '成功案例';


# qualification
drop table if exists case_summary;
CREATE TABLE case_summary
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    college_id     BIGINT                            NOT NULL COMMENT '学院',
    published_date DATE                              NOT NULL COMMENT '发布日期',
    total_count    SMALLINT                          NOT NULL COMMENT '合格证数量',
    design_count   SMALLINT                          NOT NULL COMMENT '设计类合格证数量',
    graduate_count SMALLINT                          NOT NULL COMMENT '毕业生合格证数量',
    remark         VARCHAR(255)                      NOT NULL COMMENT '备注',
    creator_id     BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time   DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id    BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time  DATETIME                          NOT NULL COMMENT '修改时间'
) comment '案例总结';

DROP TABLE IF EXISTS activity;
CREATE TABLE activity
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    pc_photo      VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo  VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    title         VARCHAR(32)                       NOT NULL COMMENT '标题',
    intro         VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail        VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark        VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number bigint                            not null comment '序号',
    creator_id    BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time  DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time DATETIME                          NOT NULL COMMENT '修改时间'
) comment '活动';

DROP TABLE IF EXISTS research;
CREATE TABLE research
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    pc_photo      VARCHAR(255)                      NOT NULL COMMENT '电脑端照片',
    mobile_photo  VARCHAR(255)                      NOT NULL COMMENT '手机端照片',
    title         VARCHAR(32)                       NOT NULL COMMENT '标题',
    intro         VARCHAR(255)                      NOT NULL COMMENT '简介',
    detail        VARCHAR(1024)                     NOT NULL COMMENT '详情',
    remark        VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number bigint                            not null comment '序号',
    creator_id    BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time  DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id   BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time DATETIME                          NOT NULL COMMENT '修改时间'
) comment '主题研学';


DROP TABLE IF EXISTS page_area_config;
CREATE TABLE page_area_config
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL comment '主键',
    page_area_id   BIGINT                            NOT NULL COMMENT '页面区域',
    page_area_code VARCHAR(64)                       NOT NULL COMMENT '页面区域编码. 冗余字段',
    type_id        BIGINT                            NOT NULL COMMENT '类别',
    type_code      VARCHAR(32)                       NOT NULL COMMENT '类别编码. 冗余字段',
    content        VARCHAR(2048)                     NOT NULL COMMENT '内容',
    remark         VARCHAR(255)                      NOT NULL COMMENT '备注',
    serial_number  int                               not null comment '序号',
    creator_id     BIGINT                            NOT NULL COMMENT '创建者主键',
    created_time   DATETIME                          NOT NULL COMMENT '创建时间',
    modifier_id    BIGINT                            NOT NULL COMMENT '修改者主键',
    modified_time  DATETIME                          NOT NULL COMMENT '修改时间'
) comment '页面区域配置';

