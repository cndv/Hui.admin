/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hui_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-29 15:42:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hui_addons`
-- ----------------------------
DROP TABLE IF EXISTS `hui_addons`;
CREATE TABLE `hui_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of hui_addons
-- ----------------------------
INSERT INTO `hui_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `hui_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `hui_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `hui_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `hui_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
INSERT INTO `hui_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `hui_addons` VALUES ('16', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1497855619', '1');

-- ----------------------------
-- Table structure for `hui_articles`
-- ----------------------------
DROP TABLE IF EXISTS `hui_articles`;
CREATE TABLE `hui_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `aid` int(11) NOT NULL COMMENT '主表关联ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `author` varchar(500) NOT NULL DEFAULT '' COMMENT '作者',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='文章模型';

-- ----------------------------
-- Records of hui_articles
-- ----------------------------
INSERT INTO `hui_articles` VALUES ('23', '13', '1501430400', '2412842937@qq.com', '黄旭辉', '1516673850');

-- ----------------------------
-- Table structure for `hui_attach`
-- ----------------------------
DROP TABLE IF EXISTS `hui_attach`;
CREATE TABLE `hui_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `aid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档id',
  `uid` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `name` varchar(500) NOT NULL,
  `url` varchar(300) NOT NULL,
  `thumb` varchar(300) NOT NULL DEFAULT '' COMMENT '缩略图',
  `ext` varchar(20) NOT NULL DEFAULT '' COMMENT '文件格式',
  `size` varchar(20) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of hui_attach
-- ----------------------------
INSERT INTO `hui_attach` VALUES ('1', '13', '27', 'photo', 'pic_03.jpg', '3e7cdb24f9ec4fdd09394e43d0119585.jpg', 'images/20170722/3e7cdb24f9ec4fdd09394e43d0119585.jpg', '', 'jpg', '13608', '1500735393');
INSERT INTO `hui_attach` VALUES ('79', '0', '27', 'attach', '华泰-大地接口文档V2.2-20180117.docx', '0ee1b2d4a1db3c4efbb4e6b2cfb42b49.docx', 'attach/20180129/0ee1b2d4a1db3c4efbb4e6b2cfb42b49.docx', '', 'docx', '69291', '1517209378');

-- ----------------------------
-- Table structure for `hui_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `hui_auth_group`;
CREATE TABLE `hui_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of hui_auth_group
-- ----------------------------
INSERT INTO `hui_auth_group` VALUES ('2', '超级管理员', '1', '1,2,3,4,5');
INSERT INTO `hui_auth_group` VALUES ('5', '普通管理员', '1', '1,2,3,4,5');

-- ----------------------------
-- Table structure for `hui_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `hui_auth_group_access`;
CREATE TABLE `hui_auth_group_access` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of hui_auth_group_access
-- ----------------------------
INSERT INTO `hui_auth_group_access` VALUES ('1', '2');
INSERT INTO `hui_auth_group_access` VALUES ('27', '5');

-- ----------------------------
-- Table structure for `hui_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `hui_auth_rule`;
CREATE TABLE `hui_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of hui_auth_rule
-- ----------------------------
INSERT INTO `hui_auth_rule` VALUES ('1', '0', 'channel', '栏目导航', '1', '1', '');
INSERT INTO `hui_auth_rule` VALUES ('2', '1', 'channel/lis', '栏目列表', '1', '1', '');
INSERT INTO `hui_auth_rule` VALUES ('3', '2', 'channel/add', '添加栏目', '1', '1', '');
INSERT INTO `hui_auth_rule` VALUES ('4', '2', 'channel/edit', '编辑栏目', '1', '1', '');
INSERT INTO `hui_auth_rule` VALUES ('5', '2', 'channel/del', '删除栏目', '1', '1', '');

-- ----------------------------
-- Table structure for `hui_backup`
-- ----------------------------
DROP TABLE IF EXISTS `hui_backup`;
CREATE TABLE `hui_backup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '操作人员',
  `filename` varchar(200) NOT NULL COMMENT '文件名',
  `create_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='备份文件表';

-- ----------------------------
-- Records of hui_backup
-- ----------------------------
INSERT INTO `hui_backup` VALUES ('6', '27', '20180123110342_all_v1.sql', '1516676622');

-- ----------------------------
-- Table structure for `hui_channel`
-- ----------------------------
DROP TABLE IF EXISTS `hui_channel`;
CREATE TABLE `hui_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '所属栏目ID',
  `cname` varchar(100) NOT NULL COMMENT '栏目名称',
  `icon` int(11) NOT NULL COMMENT '栏目图标',
  `ename` varchar(100) NOT NULL DEFAULT '' COMMENT '英文名称',
  `mname` varchar(100) NOT NULL COMMENT '模块名称',
  `model` int(11) NOT NULL COMMENT '栏目模型',
  `curl` varchar(1000) NOT NULL DEFAULT '' COMMENT '栏目链接',
  `outurl` varchar(1000) NOT NULL DEFAULT '' COMMENT '外部地址',
  `sorting` int(11) NOT NULL COMMENT '栏目排序',
  `listnum` int(11) NOT NULL COMMENT '列表分页',
  `keywords` varchar(300) NOT NULL DEFAULT '' COMMENT '优化关键词',
  `describle` varchar(500) NOT NULL DEFAULT '' COMMENT '优化描述',
  `status` int(11) unsigned NOT NULL COMMENT '栏目状态',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='栏目导航表';

-- ----------------------------
-- Records of hui_channel
-- ----------------------------
INSERT INTO `hui_channel` VALUES ('12', '0', '首页', '0', '', '', '-1', '', 'index/index/index', '1', '0', '', '', '1', '1500807878');
INSERT INTO `hui_channel` VALUES ('13', '12', '置顶文章', '0', '', 'article', '17', '/index/article/index/cid/13', '', '1', '10', '', '', '1', '1500736060');
INSERT INTO `hui_channel` VALUES ('16', '0', '百度', '0', '', '', '-1', '', 'http://baidu.com', '3', '0', '', '', '1', '1499498429');
INSERT INTO `hui_channel` VALUES ('17', '0', 'GitHub', '0', '', '', '-1', '', 'https://github.com/', '5', '0', '', '', '1', '1499498440');
INSERT INTO `hui_channel` VALUES ('18', '17', '开源项目', '0', '', 'git', '17', '/home/git/index/cid/18', '', '1', '10', '', '', '1', '1504071656');
INSERT INTO `hui_channel` VALUES ('20', '0', '关于Hui', '0', '', 'about', '17', '/index/about/index/cid/20', '', '2', '10', '', '', '1', '1499498541');

-- ----------------------------
-- Table structure for `hui_config`
-- ----------------------------
DROP TABLE IF EXISTS `hui_config`;
CREATE TABLE `hui_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='配置项表';

-- ----------------------------
-- Records of hui_config
-- ----------------------------
INSERT INTO `hui_config` VALUES ('2', '2', 'Snoop博客', 'keywords', '网站关键词', '2', '', '1497971834', '1498990515', '1', 'Hui.admin', '2');
INSERT INTO `hui_config` VALUES ('3', '2', 'Snoop博客', 'describle', '网站描述', '2', '', '1497971887', '1498988874', '1', 'Hui.admin', '3');
INSERT INTO `hui_config` VALUES ('4', '4', '1:开启,0:关闭', 'status', '是否关闭网站', '2', '', '1497971996', '1498319842', '1', '1', '4');
INSERT INTO `hui_config` VALUES ('5', '3', '网站系统正在努力建设中，请稍后访问......', 'stopinfo', '暂停原因', '2', '', '1497972982', '1497972982', '1', '网站系统正在努力建设中，请稍后访问......', '5');
INSERT INTO `hui_config` VALUES ('6', '2', 'http://127.0.0.4', 'siteurl', '网站域名', '2', '', '1497973052', '1497973052', '1', 'http://127.0.0.4', '6');
INSERT INTO `hui_config` VALUES ('7', '2', '952612251@qq.com', 'email', '网站邮箱', '2', '', '1497973121', '1497973121', '1', '952612251@qq.com', '7');
INSERT INTO `hui_config` VALUES ('8', '2', '2017-1-1', 'sitetime', '网站建立时间', '2', '', '1497973207', '1497973207', '1', '2017-1-1', '8');
INSERT INTO `hui_config` VALUES ('9', '5', '1:1小时,2:2小时,3:3小时,4:4小时', 'clearcache', '自动清空缓存', '2', '', '1497973473', '1498025913', '1', '3', '9');
INSERT INTO `hui_config` VALUES ('10', '2', '123456abcde', 'codeset', '验证码字符', '2', '', '1497973542', '1497973542', '1', '123456abc', '10');
INSERT INTO `hui_config` VALUES ('13', '2', '', 'mailer_host', 'SMTP服务器', '3', '', '1498141880', '1498141880', '1', 'smtp.qq.com', '1');
INSERT INTO `hui_config` VALUES ('14', '2', '', 'mailer_char', '邮件编码', '3', '', '1498142000', '1498142000', '1', 'UTF-8', '2');
INSERT INTO `hui_config` VALUES ('15', '2', '', 'mailer_port', '端口号', '3', '', '1498142100', '1498142100', '1', '465', '3');
INSERT INTO `hui_config` VALUES ('16', '2', '', 'mailer_secure', '安全协议', '3', '', '1498142171', '1498142171', '1', 'ssl', '4');
INSERT INTO `hui_config` VALUES ('17', '2', '', 'mailer_username', 'SMTP账号', '3', '', '1498142408', '1498142408', '1', '952612251@qq.com', '5');
INSERT INTO `hui_config` VALUES ('18', '2', '', 'mailer_password', 'SMTP密码', '3', '', '1498142451', '1498142451', '1', 'vzyyflbdpmfobcfd', '6');
INSERT INTO `hui_config` VALUES ('19', '2', '', 'mailer_from_email', '发件人邮箱', '3', '', '1498142499', '1498142499', '1', '952612251@qq.com', '7');
INSERT INTO `hui_config` VALUES ('20', '2', '', 'mailer_from_name', '发件人名称', '3', '', '1498142553', '1498142553', '1', 'Hui.admin系统邮件', '8');
INSERT INTO `hui_config` VALUES ('21', '2', '', 'mailer_reply_email', '收件人邮箱', '3', '', '1498142613', '1498142613', '1', '952612251@qq.com', '9');
INSERT INTO `hui_config` VALUES ('22', '2', '', 'mailer_reply_name', '收件人名称', '3', '', '1498177729', '1498177729', '1', 'Hui.admin系统邮件', '10');
INSERT INTO `hui_config` VALUES ('23', '2', '', 'sitename', '网站名称', '2', '', '1498318324', '1498318324', '1', 'Hui.admin', '1');
INSERT INTO `hui_config` VALUES ('24', '2', '', 'codelength', '验证码长度', '2', '', '1498318412', '1498318412', '1', '3', '11');
INSERT INTO `hui_config` VALUES ('26', '4', '1:开启,0:关闭', 'is_upload', '开启上传功能', '4', '', '1498319517', '1498319859', '1', '1', '1');
INSERT INTO `hui_config` VALUES ('27', '2', '', 'photodir', '图片存放位置', '4', '', '1498319602', '1498319602', '1', 'images', '2');
INSERT INTO `hui_config` VALUES ('28', '2', '', 'photosize', '允许图片大小', '4', '', '1498319664', '1498319664', '1', '2097152', '3');
INSERT INTO `hui_config` VALUES ('29', '2', '', 'photoext', '允许图片类型', '4', '', '1498319703', '1498319703', '1', 'png,jpg,jpeg,bmp,gif', '4');
INSERT INTO `hui_config` VALUES ('30', '4', '1:开启,0:关闭', 'logs', '开启系统日志', '2', '', '1498326136', '1498326174', '1', '1', '13');
INSERT INTO `hui_config` VALUES ('31', '2', '', 'swftools', 'SWFTools软件', '4', 'SWFTools文档转换软件安装路径', '1498652538', '1498652683', '1', 'F:\\SWFTools\\pdf2swf.exe', '5');
INSERT INTO `hui_config` VALUES ('32', '2', '', 'backup_dir', '数据备份目录', '4', '', '1498709845', '1498829190', '1', 'backup', '6');
INSERT INTO `hui_config` VALUES ('33', '2', '', 'export_dir', '导出文件目录', '4', '', '1498753629', '1498809329', '1', 'export', '7');
INSERT INTO `hui_config` VALUES ('34', '2', '', 'convert_dir', '转换文件目录', '4', '', '1498828230', '1498828230', '1', 'convert', '8');
INSERT INTO `hui_config` VALUES ('35', '2', '', 'office_dir', 'Office上传目录', '4', '', '1498828379', '1498828622', '1', 'office', '9');
INSERT INTO `hui_config` VALUES ('36', '2', '', 'photo_dir', '图片上传目录', '4', '', '1498828439', '1498828439', '1', 'images', '10');
INSERT INTO `hui_config` VALUES ('37', '2', '', 'video_dir', '视频上传目录', '4', '', '1498828486', '1498828486', '1', 'video', '12');
INSERT INTO `hui_config` VALUES ('38', '2', '', 'attach_dir', '附件上传目录', '4', '', '1498828517', '1498828517', '1', 'attach', '13');
INSERT INTO `hui_config` VALUES ('42', '2', '', 'wechat_appid', '微信公众号-开发者ID(AppID)', '3', '', '1512385999', '1512386208', '1', 'wx8ac4d4f726859e80', '10');
INSERT INTO `hui_config` VALUES ('43', '2', '', 'wechat_appsercert', '微信公众号-开发者密码(AppSecret)', '3', '', '1512386051', '1512386239', '1', '3577d39564ddb1c8a0d91afcdac99aa0', '11');
INSERT INTO `hui_config` VALUES ('44', '2', '', 'wechat_token', '微信公众号-令牌(Token)', '3', '', '1512386107', '1512386257', '1', 'EBEFDCvE5raTCu6An7Gd', '12');
INSERT INTO `hui_config` VALUES ('45', '4', '1:开启,0:关闭', 'logs_api', '开启接口日志', '2', '', '1517148648', '1517148699', '1', '1', '14');

-- ----------------------------
-- Table structure for `hui_convert`
-- ----------------------------
DROP TABLE IF EXISTS `hui_convert`;
CREATE TABLE `hui_convert` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '管理员id',
  `title` varchar(300) NOT NULL COMMENT '原文件名称',
  `name` varchar(20) NOT NULL COMMENT '文件名称',
  `ext` varchar(10) NOT NULL COMMENT '文件格式',
  `url` varchar(100) NOT NULL COMMENT '文件地址',
  `page` int(11) NOT NULL COMMENT '文档页数',
  `create_time` varchar(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='文件转换表';

-- ----------------------------
-- Records of hui_convert
-- ----------------------------
INSERT INTO `hui_convert` VALUES ('1', '27', '黄徐辉的简历.doc', '5973682de45ca.swf', 'swf', 'convert/5973682de45ca.swf', '3', '1500735535');
INSERT INTO `hui_convert` VALUES ('4', '27', 'UMPAY_SW_设计_接口设计_资金服务接入接口文档_v1.9.docx', '5975964977eb4.swf', 'swf', 'convert/5975964977eb4.swf', '265', '1500878438');
INSERT INTO `hui_convert` VALUES ('5', '27', 'iNumenA8361数据字典描述.doc', '597596a281769.swf', 'swf', 'convert/597596a281769.swf', '29', '1500878502');
INSERT INTO `hui_convert` VALUES ('6', '27', 'iNumenA8361 0.5软件概要设计.doc', '597596b1d9148.swf', 'swf', 'convert/597596b1d9148.swf', '90', '1500878523');
INSERT INTO `hui_convert` VALUES ('11', '27', '华泰-大地接口文档V2.2-20180117.docx', '5a69356745893.swf', 'swf', 'convert/5a69356745893.swf', '11', '1516844400');
INSERT INTO `hui_convert` VALUES ('12', '27', '华泰衡度V1.0-2.0数据迁移操作文档.doc', '5a69359cbbf56.swf', 'swf', 'convert/5a69359cbbf56.swf', '9', '1516844446');
INSERT INTO `hui_convert` VALUES ('13', '27', '大地分期项目流程.docx', '5a6935c0b0027.swf', 'swf', 'convert/5a6935c0b0027.swf', '1', '1516844481');
INSERT INTO `hui_convert` VALUES ('14', '27', 'e签宝快捷签SDK接口说明-PHP- 2_0_10.docx', '5a6935eeed724.swf', 'swf', 'convert/5a6935eeed724.swf', '61', '1516844535');
INSERT INTO `hui_convert` VALUES ('15', '27', '车险分期用户服务协议-奇乐融-e签宝.docx', '5a6936889b5d1.swf', 'swf', 'convert/5a6936889b5d1.swf', '27', '1516844685');
INSERT INTO `hui_convert` VALUES ('16', '27', '车险分期用户服务协议-中原-君子签.doc', '5a6936a383d04.swf', 'swf', 'convert/5a6936a383d04.swf', '8', '1516844709');
INSERT INTO `hui_convert` VALUES ('17', '27', '直投类奇乐融接口v3.0-20171214.docx', '5a6936ba30a24.swf', 'swf', 'convert/5a6936ba30a24.swf', '4', '1516844731');
INSERT INTO `hui_convert` VALUES ('19', '27', '增加驾意险金额-衡度2.0.xlsx', '5a6eb35f1d9b0.swf', 'swf', 'convert/5a6eb35f1d9b0.swf', '3', '1517204325');

-- ----------------------------
-- Table structure for `hui_doc`
-- ----------------------------
DROP TABLE IF EXISTS `hui_doc`;
CREATE TABLE `hui_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mark` varchar(200) NOT NULL COMMENT '标识',
  `name` varchar(300) NOT NULL COMMENT '标题',
  `sorting` int(11) unsigned NOT NULL COMMENT '排序',
  `status` int(1) unsigned NOT NULL COMMENT '状态',
  `update_time` int(14) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文档属性表';

-- ----------------------------
-- Records of hui_doc
-- ----------------------------
INSERT INTO `hui_doc` VALUES ('2', 'r', '推荐', '1', '0', '1501425172');
INSERT INTO `hui_doc` VALUES ('3', 'h', '热门', '2', '1', '1499537541');

-- ----------------------------
-- Table structure for `hui_document`
-- ----------------------------
DROP TABLE IF EXISTS `hui_document`;
CREATE TABLE `hui_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `topic` varchar(3000) NOT NULL COMMENT '信息标题',
  `color` varchar(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `property` varchar(1000) NOT NULL DEFAULT '' COMMENT '文档属性',
  `aurl` varchar(2000) NOT NULL COMMENT '文档地址',
  `isout` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用外部链接',
  `outurl` varchar(2000) NOT NULL DEFAULT '' COMMENT '外部链接',
  `keywords` varchar(200) NOT NULL DEFAULT '' COMMENT '优化关键词',
  `describle` varchar(500) NOT NULL DEFAULT '' COMMENT '优化描述',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `sorting` int(11) NOT NULL DEFAULT '0' COMMENT '文档排序',
  `photo` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `photos` varchar(500) NOT NULL DEFAULT '' COMMENT '图片列表',
  `attach` varchar(500) NOT NULL DEFAULT '' COMMENT '附件信息',
  `content` text NOT NULL COMMENT '文档内容',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `isrec` int(11) NOT NULL DEFAULT '0' COMMENT '是否放入回收站',
  `tags` varchar(1000) NOT NULL COMMENT '标签',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `isrec` (`isrec`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文档信息表';

-- ----------------------------
-- Records of hui_document
-- ----------------------------
INSERT INTO `hui_document` VALUES ('13', '13', '27', 'Hui.dmin发展史', '', 'a:1:{i:0;s:1:\"h\";}', '', '0', '', '', '', '137', '1', '1', 'a:1:{i:0;s:1:\"1\";}', '', '<p style=\"line-height: 16px;\"><img src=\"/uploads/images/20170722/3e7cdb24f9ec4fdd09394e43d0119585.jpg\" title=\"pic_03.jpg\" alt=\"1\"/></p><p style=\"line-height: 16px;\"><img src=\"http://img.baidu.com/hi/jx2/j_0012.gif\"/></p><p style=\"line-height: 16px;\"><br/></p>', '1', '0', '', '1516673860');

-- ----------------------------
-- Table structure for `hui_email`
-- ----------------------------
DROP TABLE IF EXISTS `hui_email`;
CREATE TABLE `hui_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `email` varchar(100) NOT NULL COMMENT '邮箱地址',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `time` int(14) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邮箱地址信息表';

-- ----------------------------
-- Records of hui_email
-- ----------------------------
INSERT INTO `hui_email` VALUES ('1', '952612251@qq.com', '1', '1517194452');
INSERT INTO `hui_email` VALUES ('2', '2412842937@qq.com', '2', '1517194454');
INSERT INTO `hui_email` VALUES ('3', 'huangxuhui@icloud-power.com', '阿里云邮箱', '1517194431');

-- ----------------------------
-- Table structure for `hui_export`
-- ----------------------------
DROP TABLE IF EXISTS `hui_export`;
CREATE TABLE `hui_export` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '文件标题',
  `name` varchar(100) NOT NULL COMMENT '文件名称',
  `url` varchar(100) NOT NULL COMMENT '文件路径',
  `ext` varchar(20) NOT NULL DEFAULT '' COMMENT '文件格式',
  `create_time` int(14) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='数据导出文件表';

-- ----------------------------
-- Records of hui_export
-- ----------------------------
INSERT INTO `hui_export` VALUES ('29', '27', 'Hui.admin系统日志信息', '20170730150959.xlsx', 'export\\20170730150959.xlsx', 'csv', '1501427399');

-- ----------------------------
-- Table structure for `hui_fields`
-- ----------------------------
DROP TABLE IF EXISTS `hui_fields`;
CREATE TABLE `hui_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '模型ID',
  `ename` varchar(200) NOT NULL COMMENT '字段名称',
  `cname` varchar(200) NOT NULL COMMENT '提示文字',
  `type` varchar(50) NOT NULL COMMENT '字段类型',
  `tips` varchar(200) DEFAULT NULL COMMENT '注释文字',
  `values` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `isneed` int(11) NOT NULL COMMENT '是否必填',
  `sorting` int(11) NOT NULL COMMENT '排序',
  `mark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='模型字段表';

-- ----------------------------
-- Records of hui_fields
-- ----------------------------
INSERT INTO `hui_fields` VALUES ('52', '17', 'author', '作者', 'varchar', '请填写作者', '', '0', '1', '1', '', '1499102678');
INSERT INTO `hui_fields` VALUES ('53', '17', 'email', '邮箱', 'email', '请填写邮箱', '', '0', '1', '3', '', '1499101434');
INSERT INTO `hui_fields` VALUES ('56', '17', 'addtime', '时间', 'date', '请选择时间', '', '0', '1', '7', '', '1499356249');

-- ----------------------------
-- Table structure for `hui_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `hui_hooks`;
CREATE TABLE `hui_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of hui_hooks
-- ----------------------------
INSERT INTO `hui_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `hui_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `hui_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `hui_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'SocialComment,Attachment');
INSERT INTO `hui_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `hui_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `hui_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `hui_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `hui_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `hui_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `hui_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for `hui_logs`
-- ----------------------------
DROP TABLE IF EXISTS `hui_logs`;
CREATE TABLE `hui_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `operate` varchar(500) NOT NULL,
  `status` int(1) NOT NULL,
  `time` int(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=913 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of hui_logs
-- ----------------------------
INSERT INTO `hui_logs` VALUES ('1', 'admin', '127.0.0.1', '登录系统', '1', '1500809657');
INSERT INTO `hui_logs` VALUES ('2', 'admin', '127.0.0.1', '数据表优化', '1', '1500809879');
INSERT INTO `hui_logs` VALUES ('3', 'admin', '127.0.0.1', '清除缓存', '1', '1500809898');
INSERT INTO `hui_logs` VALUES ('4', 'admin', '127.0.0.1', '上传文件5b4c30fbf25bcc3a9494d6e878084293.doc', '1', '1500809942');
INSERT INTO `hui_logs` VALUES ('5', 'admin', '127.0.0.1', '文件转换', '1', '1500809952');
INSERT INTO `hui_logs` VALUES ('6', 'admin', '127.0.0.1', '清除上传文件', '1', '1500809954');
INSERT INTO `hui_logs` VALUES ('7', 'admin', '127.0.0.1', '删除转换文件', '1', '1500810109');
INSERT INTO `hui_logs` VALUES ('8', 'admin', '127.0.0.1', '删除导出文件', '1', '1500810123');
INSERT INTO `hui_logs` VALUES ('9', 'admin', '127.0.0.1', '登录系统', '1', '1500810494');
INSERT INTO `hui_logs` VALUES ('10', 'admin', '127.0.0.1', '清除缓存', '1', '1500810546');
INSERT INTO `hui_logs` VALUES ('11', 'admin', '127.0.0.1', '清除缓存', '1', '1500810949');
INSERT INTO `hui_logs` VALUES ('12', 'admin', '127.0.0.1', '清除缓存', '1', '1500811188');
INSERT INTO `hui_logs` VALUES ('13', 'admin', '127.0.0.1', '清除缓存', '1', '1500811379');
INSERT INTO `hui_logs` VALUES ('14', 'admin', '127.0.0.1', '上传文件ef41223e792b37eba962180b701f761b.doc', '1', '1500811415');
INSERT INTO `hui_logs` VALUES ('15', 'admin', '127.0.0.1', '发送邮件', '1', '1500811466');
INSERT INTO `hui_logs` VALUES ('16', 'admin', '127.0.0.1', '清理未使用上传文件', '1', '1500811478');
INSERT INTO `hui_logs` VALUES ('17', 'admin', '127.0.0.1', '上传文件224fc524a638501022310097751b76f2.zip', '1', '1500812137');
INSERT INTO `hui_logs` VALUES ('18', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812153');
INSERT INTO `hui_logs` VALUES ('19', 'admin', '127.0.0.1', '上传文件3b48416e121ac95a743a3b06764ce680.zip', '1', '1500812175');
INSERT INTO `hui_logs` VALUES ('20', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812177');
INSERT INTO `hui_logs` VALUES ('21', 'admin', '127.0.0.1', '上传文件15499e07c88f4c3f9e6e1de4d04c5847.zip', '1', '1500812371');
INSERT INTO `hui_logs` VALUES ('22', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812374');
INSERT INTO `hui_logs` VALUES ('23', 'admin', '127.0.0.1', '上传文件9d1699ec82c9054d4b1886716b6b6126.zip', '1', '1500812388');
INSERT INTO `hui_logs` VALUES ('24', 'admin', '127.0.0.1', '清除缓存', '1', '1500812530');
INSERT INTO `hui_logs` VALUES ('25', 'admin', '127.0.0.1', '上传文件074edd7550799d648ceb0c174b0e7c63.zip', '1', '1500812546');
INSERT INTO `hui_logs` VALUES ('26', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812548');
INSERT INTO `hui_logs` VALUES ('27', 'admin', '127.0.0.1', '上传文件612a2c61acabf3af8b6c8ae9cfd84fa2.zip', '1', '1500812591');
INSERT INTO `hui_logs` VALUES ('28', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812593');
INSERT INTO `hui_logs` VALUES ('29', 'admin', '127.0.0.1', '登录系统', '1', '1500812737');
INSERT INTO `hui_logs` VALUES ('30', 'admin', '127.0.0.1', '上传文件7c1d922c641ae1d02308025a86dd7676.zip', '1', '1500812784');
INSERT INTO `hui_logs` VALUES ('31', 'admin', '127.0.0.1', '清除上传文件', '1', '1500812786');
INSERT INTO `hui_logs` VALUES ('32', 'admin', '127.0.0.1', '清除缓存', '1', '1500812792');
INSERT INTO `hui_logs` VALUES ('33', 'admin', '127.0.0.1', '登录系统', '1', '1500812817');
INSERT INTO `hui_logs` VALUES ('34', 'admin', '127.0.0.1', '清除缓存', '1', '1500812822');
INSERT INTO `hui_logs` VALUES ('35', 'admin', '127.0.0.1', '清除缓存', '1', '1500813721');
INSERT INTO `hui_logs` VALUES ('36', 'admin', '127.0.0.1', '上传文件48ea48ce423cea96ec5e5072f826fc8d.zip', '1', '1500813740');
INSERT INTO `hui_logs` VALUES ('37', 'admin', '127.0.0.1', '清除上传文件', '1', '1500813742');
INSERT INTO `hui_logs` VALUES ('38', 'admin', '127.0.0.1', '登录系统', '1', '1500813929');
INSERT INTO `hui_logs` VALUES ('39', 'admin', '127.0.0.1', '退出系统', '1', '1500813934');
INSERT INTO `hui_logs` VALUES ('40', 'admin', '127.0.0.1', '登录系统', '1', '1500813937');
INSERT INTO `hui_logs` VALUES ('41', 'admin', '127.0.0.1', '退出系统', '1', '1500813941');
INSERT INTO `hui_logs` VALUES ('42', 'admin', '127.0.0.1', '登录系统', '1', '1500813946');
INSERT INTO `hui_logs` VALUES ('43', 'admin', '127.0.0.1', '登录系统', '1', '1500814021');
INSERT INTO `hui_logs` VALUES ('44', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500814047');
INSERT INTO `hui_logs` VALUES ('45', 'admin', '127.0.0.1', '清除缓存', '1', '1500814082');
INSERT INTO `hui_logs` VALUES ('46', 'admin', '127.0.0.1', '清理未使用上传文件', '1', '1500814282');
INSERT INTO `hui_logs` VALUES ('47', 'admin', '127.0.0.1', '清除缓存', '1', '1500814405');
INSERT INTO `hui_logs` VALUES ('48', 'admin', '127.0.0.1', '清除缓存', '0', '1500814408');
INSERT INTO `hui_logs` VALUES ('49', 'admin', '127.0.0.1', '上传文件8f5a1f21a40547664f2289d58da775fb.zip', '1', '1500814422');
INSERT INTO `hui_logs` VALUES ('50', 'admin', '127.0.0.1', '清除上传文件', '1', '1500814424');
INSERT INTO `hui_logs` VALUES ('51', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500814612');
INSERT INTO `hui_logs` VALUES ('52', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500814626');
INSERT INTO `hui_logs` VALUES ('53', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1500814642');
INSERT INTO `hui_logs` VALUES ('54', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1500814646');
INSERT INTO `hui_logs` VALUES ('55', 'admin', '127.0.0.1', '查看配置文件', '1', '1500814865');
INSERT INTO `hui_logs` VALUES ('56', 'admin', '127.0.0.1', '查看配置文件', '1', '1500814875');
INSERT INTO `hui_logs` VALUES ('57', 'admin', '127.0.0.1', '账号设置', '1', '1500814887');
INSERT INTO `hui_logs` VALUES ('58', 'admin', '127.0.0.1', '登录系统', '1', '1500814972');
INSERT INTO `hui_logs` VALUES ('59', 'admin', '127.0.0.1', '清除缓存', '1', '1500814978');
INSERT INTO `hui_logs` VALUES ('60', 'admin', '127.0.0.1', '清除缓存', '1', '1500819752');
INSERT INTO `hui_logs` VALUES ('61', 'admin', '127.0.0.1', '清除缓存', '1', '1500820666');
INSERT INTO `hui_logs` VALUES ('62', 'admin', '127.0.0.1', '删除导出文件', '1', '1500820695');
INSERT INTO `hui_logs` VALUES ('63', 'admin', '127.0.0.1', '清除缓存', '1', '1500820699');
INSERT INTO `hui_logs` VALUES ('64', 'admin', '127.0.0.1', '登录系统', '1', '1500859732');
INSERT INTO `hui_logs` VALUES ('65', 'admin', '127.0.0.1', '登录系统', '1', '1500859817');
INSERT INTO `hui_logs` VALUES ('66', 'admin', '127.0.0.1', '清除缓存', '1', '1500859850');
INSERT INTO `hui_logs` VALUES ('67', 'admin', '127.0.0.1', '登录系统', '1', '1500862129');
INSERT INTO `hui_logs` VALUES ('68', 'admin', '127.0.0.1', '网站配置更新', '1', '1500862142');
INSERT INTO `hui_logs` VALUES ('69', 'admin', '127.0.0.1', '网站配置更新', '1', '1500862149');
INSERT INTO `hui_logs` VALUES ('70', 'admin', '127.0.0.1', '退出系统', '1', '1500862152');
INSERT INTO `hui_logs` VALUES ('71', 'admin', '127.0.0.1', '网站配置更新', '1', '1500862190');
INSERT INTO `hui_logs` VALUES ('72', 'admin', '127.0.0.1', '查看配置文件', '1', '1500862194');
INSERT INTO `hui_logs` VALUES ('73', 'admin', '127.0.0.1', '查看配置文件', '1', '1500862209');
INSERT INTO `hui_logs` VALUES ('74', 'admin', '127.0.0.1', '登录系统', '1', '1500862221');
INSERT INTO `hui_logs` VALUES ('75', 'admin', '127.0.0.1', '清除缓存', '1', '1500862224');
INSERT INTO `hui_logs` VALUES ('76', 'admin', '127.0.0.1', '清除缓存', '1', '1500862461');
INSERT INTO `hui_logs` VALUES ('77', 'admin', '127.0.0.1', '文件配置更新', '1', '1500862468');
INSERT INTO `hui_logs` VALUES ('78', 'admin', '127.0.0.1', '清除缓存', '1', '1500863365');
INSERT INTO `hui_logs` VALUES ('79', 'admin', '127.0.0.1', '登录系统', '1', '1500864183');
INSERT INTO `hui_logs` VALUES ('80', 'admin', '127.0.0.1', '清除缓存', '1', '1500864190');
INSERT INTO `hui_logs` VALUES ('81', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500864200');
INSERT INTO `hui_logs` VALUES ('82', 'admin', '127.0.0.1', '清除缓存', '1', '1500864523');
INSERT INTO `hui_logs` VALUES ('83', 'admin', '127.0.0.1', '清除缓存', '1', '1500864543');
INSERT INTO `hui_logs` VALUES ('84', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500864554');
INSERT INTO `hui_logs` VALUES ('85', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1500864561');
INSERT INTO `hui_logs` VALUES ('86', 'admin', '127.0.0.1', '清除缓存', '1', '1500868395');
INSERT INTO `hui_logs` VALUES ('87', 'admin', '127.0.0.1', '清除缓存', '0', '1500868399');
INSERT INTO `hui_logs` VALUES ('88', 'admin', '127.0.0.1', '清除缓存', '0', '1500868401');
INSERT INTO `hui_logs` VALUES ('89', 'admin', '127.0.0.1', '清除缓存', '0', '1500868403');
INSERT INTO `hui_logs` VALUES ('90', 'admin', '127.0.0.1', '清除缓存', '0', '1500868404');
INSERT INTO `hui_logs` VALUES ('91', 'admin', '127.0.0.1', '清除缓存', '0', '1500868405');
INSERT INTO `hui_logs` VALUES ('92', 'admin', '127.0.0.1', '清除缓存', '1', '1500869282');
INSERT INTO `hui_logs` VALUES ('93', 'admin', '127.0.0.1', '账号设置', '1', '1500869288');
INSERT INTO `hui_logs` VALUES ('94', 'admin', '127.0.0.1', '清除缓存', '1', '1500878354');
INSERT INTO `hui_logs` VALUES ('95', 'admin', '127.0.0.1', '上传文件c1bde60d3ed822dbbd10dc865fc18984.zip', '1', '1500878378');
INSERT INTO `hui_logs` VALUES ('96', 'admin', '127.0.0.1', '清除上传文件', '1', '1500878387');
INSERT INTO `hui_logs` VALUES ('97', 'admin', '127.0.0.1', '上传文件bcbc9f11c3fe74b6a8c58e06fda41991.docx', '1', '1500878401');
INSERT INTO `hui_logs` VALUES ('98', 'admin', '127.0.0.1', '文件转换', '1', '1500878438');
INSERT INTO `hui_logs` VALUES ('99', 'admin', '127.0.0.1', '清除上传文件', '1', '1500878441');
INSERT INTO `hui_logs` VALUES ('100', 'admin', '127.0.0.1', '上传文件568e42722530f74ab3207ee1740669bd.doc', '1', '1500878495');
INSERT INTO `hui_logs` VALUES ('101', 'admin', '127.0.0.1', '文件转换', '1', '1500878502');
INSERT INTO `hui_logs` VALUES ('102', 'admin', '127.0.0.1', '清除上传文件', '1', '1500878504');
INSERT INTO `hui_logs` VALUES ('103', 'admin', '127.0.0.1', '上传文件179a804864dc718138e97bef21358a28.doc', '1', '1500878512');
INSERT INTO `hui_logs` VALUES ('104', 'admin', '127.0.0.1', '文件转换', '1', '1500878523');
INSERT INTO `hui_logs` VALUES ('105', 'admin', '127.0.0.1', '清除上传文件', '1', '1500878525');
INSERT INTO `hui_logs` VALUES ('106', 'admin', '127.0.0.1', '上传文件05e248dbc882434cbd2f8117256a2a83.docx', '1', '1500878539');
INSERT INTO `hui_logs` VALUES ('107', 'admin', '127.0.0.1', '文件转换', '1', '1500878543');
INSERT INTO `hui_logs` VALUES ('108', 'admin', '127.0.0.1', '清除上传文件', '1', '1500878545');
INSERT INTO `hui_logs` VALUES ('109', 'admin', '127.0.0.1', '删除转换文件', '1', '1500878587');
INSERT INTO `hui_logs` VALUES ('110', 'admin', '127.0.0.1', '模型添加', '1', '1500879345');
INSERT INTO `hui_logs` VALUES ('111', 'admin', '127.0.0.1', '模型【王红玲】删除', '1', '1500879417');
INSERT INTO `hui_logs` VALUES ('112', 'admin', '127.0.0.1', '模型编辑', '1', '1500879724');
INSERT INTO `hui_logs` VALUES ('113', 'admin', '127.0.0.1', '登录系统', '1', '1500882386');
INSERT INTO `hui_logs` VALUES ('114', 'admin', '127.0.0.1', '数据表优化', '1', '1500882484');
INSERT INTO `hui_logs` VALUES ('115', 'admin', '127.0.0.1', '清除缓存', '1', '1500885924');
INSERT INTO `hui_logs` VALUES ('116', 'admin', '127.0.0.1', '备份数据库', '1', '1500885932');
INSERT INTO `hui_logs` VALUES ('117', 'admin', '127.0.0.1', '删除备份文件', '1', '1500885936');
INSERT INTO `hui_logs` VALUES ('118', 'admin', '127.0.0.1', '上传文件9fbbad1d4ed30e5494feb0a5121ee346.zip', '1', '1500885979');
INSERT INTO `hui_logs` VALUES ('119', 'admin', '127.0.0.1', '清除上传文件', '1', '1500885982');
INSERT INTO `hui_logs` VALUES ('120', 'admin', '127.0.0.1', '查看配置文件', '1', '1500885997');
INSERT INTO `hui_logs` VALUES ('121', 'admin', '127.0.0.1', '清除缓存', '1', '1500887522');
INSERT INTO `hui_logs` VALUES ('122', 'admin', '127.0.0.1', '模型编辑', '1', '1500887538');
INSERT INTO `hui_logs` VALUES ('123', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1500887543');
INSERT INTO `hui_logs` VALUES ('124', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1500887546');
INSERT INTO `hui_logs` VALUES ('125', 'admin', '127.0.0.1', '清除缓存', '1', '1500887575');
INSERT INTO `hui_logs` VALUES ('126', 'admin', '127.0.0.1', '清除缓存', '1', '1500896383');
INSERT INTO `hui_logs` VALUES ('127', 'admin', '127.0.0.1', '清除缓存', '0', '1500896437');
INSERT INTO `hui_logs` VALUES ('128', 'admin', '127.0.0.1', '登录系统', '1', '1500988930');
INSERT INTO `hui_logs` VALUES ('129', 'admin', '127.0.0.1', '清除缓存', '1', '1500989428');
INSERT INTO `hui_logs` VALUES ('130', 'admin', '127.0.0.1', '清除缓存', '1', '1500993027');
INSERT INTO `hui_logs` VALUES ('131', 'admin', '127.0.0.1', '清除缓存', '1', '1500996174');
INSERT INTO `hui_logs` VALUES ('132', 'admin', '127.0.0.1', '清除缓存', '1', '1500999366');
INSERT INTO `hui_logs` VALUES ('133', 'admin', '127.0.0.1', '删除导出文件', '1', '1500999429');
INSERT INTO `hui_logs` VALUES ('134', 'admin', '127.0.0.1', '删除导出文件', '1', '1500999433');
INSERT INTO `hui_logs` VALUES ('135', 'admin', '127.0.0.1', '删除导出文件', '1', '1500999436');
INSERT INTO `hui_logs` VALUES ('136', 'admin', '127.0.0.1', '删除导出文件', '1', '1500999439');
INSERT INTO `hui_logs` VALUES ('137', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1500999511');
INSERT INTO `hui_logs` VALUES ('138', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1500999514');
INSERT INTO `hui_logs` VALUES ('139', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1500999517');
INSERT INTO `hui_logs` VALUES ('140', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1500999521');
INSERT INTO `hui_logs` VALUES ('141', 'admin', '127.0.0.1', '模型编辑', '1', '1500999566');
INSERT INTO `hui_logs` VALUES ('142', 'admin', '127.0.0.1', '模型编辑', '1', '1500999572');
INSERT INTO `hui_logs` VALUES ('143', 'admin', '127.0.0.1', '清除缓存', '1', '1500999714');
INSERT INTO `hui_logs` VALUES ('144', 'admin', '127.0.0.1', '登录系统', '1', '1501071710');
INSERT INTO `hui_logs` VALUES ('145', 'admin', '127.0.0.1', '清除缓存', '1', '1501071751');
INSERT INTO `hui_logs` VALUES ('146', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501077519');
INSERT INTO `hui_logs` VALUES ('147', 'admin', '127.0.0.1', '删除导出文件', '1', '1501078223');
INSERT INTO `hui_logs` VALUES ('148', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501079212');
INSERT INTO `hui_logs` VALUES ('149', 'admin', '127.0.0.1', '清除缓存', '1', '1501079450');
INSERT INTO `hui_logs` VALUES ('150', 'admin', '127.0.0.1', '清除缓存', '0', '1501079453');
INSERT INTO `hui_logs` VALUES ('151', 'admin', '127.0.0.1', '退出系统', '1', '1501079457');
INSERT INTO `hui_logs` VALUES ('152', 'admin', '127.0.0.1', '登录系统', '1', '1501079463');
INSERT INTO `hui_logs` VALUES ('153', 'admin', '127.0.0.1', '清除缓存', '1', '1501079466');
INSERT INTO `hui_logs` VALUES ('154', 'admin', '127.0.0.1', '上传文件41d53abbf02dfbca5faef889e4d7459a.xml', '1', '1501079488');
INSERT INTO `hui_logs` VALUES ('155', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079563');
INSERT INTO `hui_logs` VALUES ('156', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079565');
INSERT INTO `hui_logs` VALUES ('157', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079567');
INSERT INTO `hui_logs` VALUES ('158', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079567');
INSERT INTO `hui_logs` VALUES ('159', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079568');
INSERT INTO `hui_logs` VALUES ('160', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079569');
INSERT INTO `hui_logs` VALUES ('161', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079570');
INSERT INTO `hui_logs` VALUES ('162', 'admin', '127.0.0.1', '上传文件3068cc83e886fd84f28ee48315ee0adf.xml', '1', '1501079592');
INSERT INTO `hui_logs` VALUES ('163', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079598');
INSERT INTO `hui_logs` VALUES ('164', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079600');
INSERT INTO `hui_logs` VALUES ('165', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079601');
INSERT INTO `hui_logs` VALUES ('166', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1501079602');
INSERT INTO `hui_logs` VALUES ('167', 'admin', '127.0.0.1', '发送邮件', '1', '1501079739');
INSERT INTO `hui_logs` VALUES ('168', 'admin', '127.0.0.1', '清除上传文件', '1', '1501079742');
INSERT INTO `hui_logs` VALUES ('169', 'admin', '127.0.0.1', '清除缓存', '1', '1501081657');
INSERT INTO `hui_logs` VALUES ('170', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501081857');
INSERT INTO `hui_logs` VALUES ('171', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501081955');
INSERT INTO `hui_logs` VALUES ('172', 'admin', '127.0.0.1', '清除缓存', '1', '1501082887');
INSERT INTO `hui_logs` VALUES ('173', 'admin', '127.0.0.1', '删除导出文件', '1', '1501082967');
INSERT INTO `hui_logs` VALUES ('174', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501083006');
INSERT INTO `hui_logs` VALUES ('175', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501083427');
INSERT INTO `hui_logs` VALUES ('176', 'admin', '127.0.0.1', '清除缓存', '1', '1501083738');
INSERT INTO `hui_logs` VALUES ('177', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501083977');
INSERT INTO `hui_logs` VALUES ('178', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501083980');
INSERT INTO `hui_logs` VALUES ('179', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501084309');
INSERT INTO `hui_logs` VALUES ('180', 'admin', '127.0.0.1', '清除缓存', '1', '1501084385');
INSERT INTO `hui_logs` VALUES ('181', 'admin', '127.0.0.1', '登录系统', '1', '1501161334');
INSERT INTO `hui_logs` VALUES ('182', 'admin', '127.0.0.1', '清除缓存', '1', '1501163028');
INSERT INTO `hui_logs` VALUES ('183', 'admin', '127.0.0.1', '清除缓存', '0', '1501163031');
INSERT INTO `hui_logs` VALUES ('184', 'admin', '127.0.0.1', '清除缓存', '0', '1501163033');
INSERT INTO `hui_logs` VALUES ('185', 'admin', '127.0.0.1', '清除缓存', '0', '1501163037');
INSERT INTO `hui_logs` VALUES ('186', 'admin', '127.0.0.1', '清除缓存', '1', '1501163046');
INSERT INTO `hui_logs` VALUES ('187', 'admin', '127.0.0.1', '清除缓存', '0', '1501163051');
INSERT INTO `hui_logs` VALUES ('188', 'admin', '127.0.0.1', '清除缓存', '1', '1501167143');
INSERT INTO `hui_logs` VALUES ('189', 'admin', '127.0.0.1', '查看配置文件', '1', '1501167219');
INSERT INTO `hui_logs` VALUES ('190', 'admin', '127.0.0.1', '清除缓存', '1', '1501167227');
INSERT INTO `hui_logs` VALUES ('191', 'admin', '127.0.0.1', '清除缓存', '1', '1501167477');
INSERT INTO `hui_logs` VALUES ('192', 'admin', '127.0.0.1', '上传文件ea071d45a3ada1efab1086a2cdab29a9.doc', '1', '1501167508');
INSERT INTO `hui_logs` VALUES ('193', 'admin', '127.0.0.1', '文件转换：转换失败', '0', '1501167516');
INSERT INTO `hui_logs` VALUES ('194', 'admin', '127.0.0.1', '清除上传文件', '1', '1501167519');
INSERT INTO `hui_logs` VALUES ('195', 'admin', '127.0.0.1', '清除缓存', '1', '1501167575');
INSERT INTO `hui_logs` VALUES ('196', 'admin', '127.0.0.1', '清除缓存', '1', '1501167593');
INSERT INTO `hui_logs` VALUES ('197', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501167596');
INSERT INTO `hui_logs` VALUES ('198', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501167605');
INSERT INTO `hui_logs` VALUES ('199', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501167609');
INSERT INTO `hui_logs` VALUES ('200', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501167613');
INSERT INTO `hui_logs` VALUES ('201', 'admin', '127.0.0.1', '清除缓存', '1', '1501167642');
INSERT INTO `hui_logs` VALUES ('202', 'admin', '127.0.0.1', '登录系统', '1', '1501167881');
INSERT INTO `hui_logs` VALUES ('203', 'admin', '127.0.0.1', '登录系统', '1', '1501404710');
INSERT INTO `hui_logs` VALUES ('204', 'admin', '127.0.0.1', '退出系统', '1', '1501410406');
INSERT INTO `hui_logs` VALUES ('205', 'admin', '127.0.0.1', '登录系统', '1', '1501410412');
INSERT INTO `hui_logs` VALUES ('206', 'admin', '127.0.0.1', '删除转换文件', '1', '1501410892');
INSERT INTO `hui_logs` VALUES ('207', 'admin', '127.0.0.1', '清除缓存', '1', '1501422092');
INSERT INTO `hui_logs` VALUES ('208', 'admin', '127.0.0.1', '清除缓存', '0', '1501422094');
INSERT INTO `hui_logs` VALUES ('209', 'admin', '127.0.0.1', '清除缓存', '1', '1501422301');
INSERT INTO `hui_logs` VALUES ('210', 'admin', '127.0.0.1', '清除缓存', '0', '1501422303');
INSERT INTO `hui_logs` VALUES ('211', 'admin', '127.0.0.1', '清除缓存', '0', '1501422306');
INSERT INTO `hui_logs` VALUES ('212', 'admin', '127.0.0.1', '清除缓存', '0', '1501422307');
INSERT INTO `hui_logs` VALUES ('213', 'admin', '127.0.0.1', '清除缓存', '1', '1501422466');
INSERT INTO `hui_logs` VALUES ('214', 'admin', '127.0.0.1', '上传文件4222dccbb7fd1a131d759613505bfde6.rar', '1', '1501423464');
INSERT INTO `hui_logs` VALUES ('215', 'admin', '127.0.0.1', '清除上传文件', '1', '1501423466');
INSERT INTO `hui_logs` VALUES ('216', 'admin', '127.0.0.1', '上传文件a20fccdbdbf239c6a002168597d33276.xls', '1', '1501423469');
INSERT INTO `hui_logs` VALUES ('217', 'admin', '127.0.0.1', '清除上传文件', '1', '1501423472');
INSERT INTO `hui_logs` VALUES ('218', 'admin', '127.0.0.1', '清除缓存', '1', '1501423747');
INSERT INTO `hui_logs` VALUES ('219', 'admin', '127.0.0.1', '清除缓存', '1', '1501423751');
INSERT INTO `hui_logs` VALUES ('220', 'admin', '127.0.0.1', '清除缓存', '0', '1501423754');
INSERT INTO `hui_logs` VALUES ('221', 'admin', '127.0.0.1', '清除缓存', '1', '1501423774');
INSERT INTO `hui_logs` VALUES ('222', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501423785');
INSERT INTO `hui_logs` VALUES ('223', 'admin', '127.0.0.1', '清除缓存', '1', '1501424200');
INSERT INTO `hui_logs` VALUES ('224', 'admin', '127.0.0.1', '清除缓存', '0', '1501424202');
INSERT INTO `hui_logs` VALUES ('225', 'admin', '127.0.0.1', '上传文件f2da5d03563849c08d690a11c0ccf9b4.rar', '1', '1501424566');
INSERT INTO `hui_logs` VALUES ('226', 'admin', '127.0.0.1', '清除上传文件', '1', '1501424570');
INSERT INTO `hui_logs` VALUES ('227', 'admin', '127.0.0.1', '上传文件be520e42e34bbe60f06e9180eab170eb.rar', '1', '1501424637');
INSERT INTO `hui_logs` VALUES ('228', 'admin', '127.0.0.1', '清除上传文件', '1', '1501424640');
INSERT INTO `hui_logs` VALUES ('229', 'admin', '127.0.0.1', '清除缓存', '1', '1501424768');
INSERT INTO `hui_logs` VALUES ('230', 'admin', '127.0.0.1', '清除缓存', '1', '1501425146');
INSERT INTO `hui_logs` VALUES ('231', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501425154');
INSERT INTO `hui_logs` VALUES ('232', 'admin', '127.0.0.1', '文档属性状态设置启用', '1', '1501425167');
INSERT INTO `hui_logs` VALUES ('233', 'admin', '127.0.0.1', '文档属性状态设置禁用', '1', '1501425172');
INSERT INTO `hui_logs` VALUES ('234', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501425177');
INSERT INTO `hui_logs` VALUES ('235', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501425181');
INSERT INTO `hui_logs` VALUES ('236', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501425184');
INSERT INTO `hui_logs` VALUES ('237', 'admin', '127.0.0.1', '文档状态设置隐藏', '1', '1501425370');
INSERT INTO `hui_logs` VALUES ('238', 'admin', '127.0.0.1', '文档状态设置审核', '1', '1501425374');
INSERT INTO `hui_logs` VALUES ('239', 'admin', '127.0.0.1', '账号设置', '1', '1501425548');
INSERT INTO `hui_logs` VALUES ('240', 'admin', '127.0.0.1', '账号设置', '1', '1501425552');
INSERT INTO `hui_logs` VALUES ('241', 'admin', '127.0.0.1', '账号设置', '1', '1501425559');
INSERT INTO `hui_logs` VALUES ('242', 'admin', '127.0.0.1', '账号设置', '1', '1501426458');
INSERT INTO `hui_logs` VALUES ('243', 'admin', '127.0.0.1', '账号设置', '1', '1501426463');
INSERT INTO `hui_logs` VALUES ('244', 'admin', '127.0.0.1', '账号设置', '1', '1501426466');
INSERT INTO `hui_logs` VALUES ('245', 'admin', '127.0.0.1', '清除缓存', '1', '1501426493');
INSERT INTO `hui_logs` VALUES ('246', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501426502');
INSERT INTO `hui_logs` VALUES ('247', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501426509');
INSERT INTO `hui_logs` VALUES ('248', 'admin', '127.0.0.1', '查看配置文件', '1', '1501426617');
INSERT INTO `hui_logs` VALUES ('249', 'admin', '127.0.0.1', '查看配置文件', '1', '1501426860');
INSERT INTO `hui_logs` VALUES ('250', 'admin', '127.0.0.1', '批量删除导出文件', '1', '1501426934');
INSERT INTO `hui_logs` VALUES ('251', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501426964');
INSERT INTO `hui_logs` VALUES ('252', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501426972');
INSERT INTO `hui_logs` VALUES ('253', 'admin', '127.0.0.1', '清除上传文件', '1', '1501427009');
INSERT INTO `hui_logs` VALUES ('254', 'admin', '127.0.0.1', '清除缓存', '1', '1501427081');
INSERT INTO `hui_logs` VALUES ('255', 'admin', '127.0.0.1', '清除缓存', '1', '1501427333');
INSERT INTO `hui_logs` VALUES ('256', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501427349');
INSERT INTO `hui_logs` VALUES ('257', 'admin', '127.0.0.1', '账号设置', '1', '1501427355');
INSERT INTO `hui_logs` VALUES ('258', 'admin', '127.0.0.1', '账号设置', '1', '1501427357');
INSERT INTO `hui_logs` VALUES ('259', 'admin', '127.0.0.1', '账号设置', '1', '1501427358');
INSERT INTO `hui_logs` VALUES ('260', 'admin', '127.0.0.1', '账号设置', '1', '1501427359');
INSERT INTO `hui_logs` VALUES ('261', 'admin', '127.0.0.1', '账号设置', '1', '1501427360');
INSERT INTO `hui_logs` VALUES ('262', 'admin', '127.0.0.1', '账号设置', '0', '1501427360');
INSERT INTO `hui_logs` VALUES ('263', 'admin', '127.0.0.1', '账号设置', '0', '1501427361');
INSERT INTO `hui_logs` VALUES ('264', 'admin', '127.0.0.1', '账号设置', '1', '1501427361');
INSERT INTO `hui_logs` VALUES ('265', 'admin', '127.0.0.1', '账号设置', '0', '1501427361');
INSERT INTO `hui_logs` VALUES ('266', 'admin', '127.0.0.1', '账号设置', '0', '1501427361');
INSERT INTO `hui_logs` VALUES ('267', 'admin', '127.0.0.1', '账号设置', '1', '1501427362');
INSERT INTO `hui_logs` VALUES ('268', 'admin', '127.0.0.1', '账号设置', '0', '1501427362');
INSERT INTO `hui_logs` VALUES ('269', 'admin', '127.0.0.1', '账号设置', '0', '1501427362');
INSERT INTO `hui_logs` VALUES ('270', 'admin', '127.0.0.1', '账号设置', '1', '1501427363');
INSERT INTO `hui_logs` VALUES ('271', 'admin', '127.0.0.1', '账号设置', '0', '1501427363');
INSERT INTO `hui_logs` VALUES ('272', 'admin', '127.0.0.1', '账号设置', '0', '1501427363');
INSERT INTO `hui_logs` VALUES ('273', 'admin', '127.0.0.1', '账号设置', '1', '1501427368');
INSERT INTO `hui_logs` VALUES ('274', 'admin', '127.0.0.1', '账号设置', '1', '1501427369');
INSERT INTO `hui_logs` VALUES ('275', 'admin', '127.0.0.1', '账号设置', '1', '1501427370');
INSERT INTO `hui_logs` VALUES ('276', 'admin', '127.0.0.1', '账号设置', '0', '1501427370');
INSERT INTO `hui_logs` VALUES ('277', 'admin', '127.0.0.1', '账号设置', '1', '1501427371');
INSERT INTO `hui_logs` VALUES ('278', 'admin', '127.0.0.1', '账号设置', '0', '1501427371');
INSERT INTO `hui_logs` VALUES ('279', 'admin', '127.0.0.1', '账号设置', '1', '1501427372');
INSERT INTO `hui_logs` VALUES ('280', 'admin', '127.0.0.1', '账号设置', '0', '1501427372');
INSERT INTO `hui_logs` VALUES ('281', 'admin', '127.0.0.1', '账号设置', '1', '1501427373');
INSERT INTO `hui_logs` VALUES ('282', 'admin', '127.0.0.1', '账号设置', '0', '1501427373');
INSERT INTO `hui_logs` VALUES ('283', 'admin', '127.0.0.1', '账号设置', '1', '1501427374');
INSERT INTO `hui_logs` VALUES ('284', 'admin', '127.0.0.1', '账号设置', '0', '1501427374');
INSERT INTO `hui_logs` VALUES ('285', 'admin', '127.0.0.1', '账号设置', '1', '1501427375');
INSERT INTO `hui_logs` VALUES ('286', 'admin', '127.0.0.1', '账号设置', '0', '1501427375');
INSERT INTO `hui_logs` VALUES ('287', 'admin', '127.0.0.1', '账号设置', '0', '1501427375');
INSERT INTO `hui_logs` VALUES ('288', 'admin', '127.0.0.1', '账号设置', '1', '1501427376');
INSERT INTO `hui_logs` VALUES ('289', 'admin', '127.0.0.1', '账号设置', '0', '1501427376');
INSERT INTO `hui_logs` VALUES ('290', 'admin', '127.0.0.1', '账号设置', '0', '1501427376');
INSERT INTO `hui_logs` VALUES ('291', 'admin', '127.0.0.1', '账号设置', '0', '1501427376');
INSERT INTO `hui_logs` VALUES ('292', 'admin', '127.0.0.1', '账号设置', '0', '1501427376');
INSERT INTO `hui_logs` VALUES ('293', 'admin', '127.0.0.1', '账号设置', '1', '1501427377');
INSERT INTO `hui_logs` VALUES ('294', 'admin', '127.0.0.1', '账号设置', '0', '1501427377');
INSERT INTO `hui_logs` VALUES ('295', 'admin', '127.0.0.1', '账号设置', '1', '1501427461');
INSERT INTO `hui_logs` VALUES ('296', 'admin', '127.0.0.1', '账号设置', '0', '1501427461');
INSERT INTO `hui_logs` VALUES ('297', 'admin', '127.0.0.1', '账号设置', '0', '1501427461');
INSERT INTO `hui_logs` VALUES ('298', 'admin', '127.0.0.1', '账号设置', '1', '1501427462');
INSERT INTO `hui_logs` VALUES ('299', 'admin', '127.0.0.1', '账号设置', '0', '1501427462');
INSERT INTO `hui_logs` VALUES ('300', 'admin', '127.0.0.1', '账号设置', '0', '1501427462');
INSERT INTO `hui_logs` VALUES ('301', 'admin', '127.0.0.1', '账号设置', '0', '1501427462');
INSERT INTO `hui_logs` VALUES ('302', 'admin', '127.0.0.1', '账号设置', '1', '1501427463');
INSERT INTO `hui_logs` VALUES ('303', 'admin', '127.0.0.1', '账号设置', '0', '1501427463');
INSERT INTO `hui_logs` VALUES ('335', 'admin', '127.0.0.1', '删除日志', '1', '1501427510');
INSERT INTO `hui_logs` VALUES ('336', 'admin', '127.0.0.1', '登录系统', '1', '1501677170');
INSERT INTO `hui_logs` VALUES ('337', 'admin', '127.0.0.1', '清除缓存', '1', '1501677175');
INSERT INTO `hui_logs` VALUES ('338', 'admin', '127.0.0.1', '清除缓存', '1', '1501677192');
INSERT INTO `hui_logs` VALUES ('339', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501677197');
INSERT INTO `hui_logs` VALUES ('340', 'admin', '127.0.0.1', '账号设置', '1', '1501682878');
INSERT INTO `hui_logs` VALUES ('341', 'admin', '127.0.0.1', '清除缓存', '1', '1501682913');
INSERT INTO `hui_logs` VALUES ('342', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501682966');
INSERT INTO `hui_logs` VALUES ('343', 'admin', '127.0.0.1', '文档状态设置隐藏', '1', '1501682976');
INSERT INTO `hui_logs` VALUES ('344', 'admin', '127.0.0.1', '文档状态设置审核', '1', '1501682978');
INSERT INTO `hui_logs` VALUES ('345', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501682988');
INSERT INTO `hui_logs` VALUES ('346', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501682995');
INSERT INTO `hui_logs` VALUES ('347', 'admin', '127.0.0.1', '清除缓存', '1', '1501683342');
INSERT INTO `hui_logs` VALUES ('348', 'admin', '127.0.0.1', '登录系统', '1', '1501725268');
INSERT INTO `hui_logs` VALUES ('349', 'admin', '127.0.0.1', '清除缓存', '1', '1501726168');
INSERT INTO `hui_logs` VALUES ('350', 'admin', '127.0.0.1', '清除缓存', '1', '1501726306');
INSERT INTO `hui_logs` VALUES ('351', 'admin', '127.0.0.1', '网站配置更新', '1', '1501726483');
INSERT INTO `hui_logs` VALUES ('352', 'admin', '127.0.0.1', '清除缓存', '1', '1501746061');
INSERT INTO `hui_logs` VALUES ('353', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501747386');
INSERT INTO `hui_logs` VALUES ('354', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1501747389');
INSERT INTO `hui_logs` VALUES ('355', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1501747392');
INSERT INTO `hui_logs` VALUES ('356', 'admin', '127.0.0.1', '清除缓存', '1', '1501748669');
INSERT INTO `hui_logs` VALUES ('357', 'admin', '127.0.0.1', '上传文件4e3f92699a924bc49164d910a3509c00.zip', '1', '1501748754');
INSERT INTO `hui_logs` VALUES ('358', 'admin', '127.0.0.1', '清除上传文件', '1', '1501748756');
INSERT INTO `hui_logs` VALUES ('359', 'admin', '127.0.0.1', '上传文件160835e49d3a7fe904d02c0068f1989c.gz', '1', '1501748764');
INSERT INTO `hui_logs` VALUES ('360', 'admin', '127.0.0.1', '清除上传文件', '1', '1501748766');
INSERT INTO `hui_logs` VALUES ('361', 'admin', '127.0.0.1', '清除缓存', '1', '1501748787');
INSERT INTO `hui_logs` VALUES ('362', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1501748790');
INSERT INTO `hui_logs` VALUES ('363', 'admin', '127.0.0.1', '登录系统', '1', '1502155110');
INSERT INTO `hui_logs` VALUES ('364', 'admin', '127.0.0.1', '清除缓存', '1', '1502155115');
INSERT INTO `hui_logs` VALUES ('365', 'admin', '127.0.0.1', '登录系统', '1', '1502363428');
INSERT INTO `hui_logs` VALUES ('366', 'admin', '127.0.0.1', '清除缓存', '1', '1502363438');
INSERT INTO `hui_logs` VALUES ('367', 'admin', '127.0.0.1', '上传文件8b9f1f45b330d547d5ab07998f103154.doc', '1', '1502363545');
INSERT INTO `hui_logs` VALUES ('368', 'admin', '127.0.0.1', '文件转换', '1', '1502363560');
INSERT INTO `hui_logs` VALUES ('369', 'admin', '127.0.0.1', '清除上传文件', '1', '1502363564');
INSERT INTO `hui_logs` VALUES ('370', 'admin', '127.0.0.1', '上传文件17f583cfed279b3e167ed32d6778c15e.docx', '1', '1502363572');
INSERT INTO `hui_logs` VALUES ('371', 'admin', '127.0.0.1', '文件转换', '1', '1502363574');
INSERT INTO `hui_logs` VALUES ('372', 'admin', '127.0.0.1', '清除上传文件', '1', '1502363576');
INSERT INTO `hui_logs` VALUES ('373', 'admin', '127.0.0.1', '上传文件10226fd1d0c68b3c3ec829cf9421b8e8.docx', '1', '1502363581');
INSERT INTO `hui_logs` VALUES ('374', 'admin', '127.0.0.1', '文件转换', '1', '1502363585');
INSERT INTO `hui_logs` VALUES ('375', 'admin', '127.0.0.1', '清除上传文件', '1', '1502363586');
INSERT INTO `hui_logs` VALUES ('376', 'admin', '127.0.0.1', '删除转换文件', '1', '1502363746');
INSERT INTO `hui_logs` VALUES ('377', 'admin', '127.0.0.1', '删除转换文件', '1', '1502363749');
INSERT INTO `hui_logs` VALUES ('378', 'admin', '127.0.0.1', '删除转换文件', '1', '1502363751');
INSERT INTO `hui_logs` VALUES ('379', 'admin', '127.0.0.1', '清除缓存', '1', '1502363758');
INSERT INTO `hui_logs` VALUES ('380', 'admin', '127.0.0.1', '登录系统', '1', '1502857256');
INSERT INTO `hui_logs` VALUES ('381', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1502857265');
INSERT INTO `hui_logs` VALUES ('382', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/static/notepad.txt', '1', '1502857273');
INSERT INTO `hui_logs` VALUES ('383', 'admin', '127.0.0.1', '登录系统', '1', '1502857705');
INSERT INTO `hui_logs` VALUES ('384', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862030');
INSERT INTO `hui_logs` VALUES ('385', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862033');
INSERT INTO `hui_logs` VALUES ('386', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862036');
INSERT INTO `hui_logs` VALUES ('387', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862043');
INSERT INTO `hui_logs` VALUES ('388', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/../config/extra/websetup.php', '1', '1502862054');
INSERT INTO `hui_logs` VALUES ('389', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862059');
INSERT INTO `hui_logs` VALUES ('390', 'admin', '127.0.0.1', '查看配置文件', '1', '1502862067');
INSERT INTO `hui_logs` VALUES ('391', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/../config/extra/websetup.php', '1', '1502862077');
INSERT INTO `hui_logs` VALUES ('392', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/../config/extra/websetup.php', '1', '1502862086');
INSERT INTO `hui_logs` VALUES ('393', 'admin', '127.0.0.1', '清除缓存', '1', '1502862278');
INSERT INTO `hui_logs` VALUES ('394', 'admin', '127.0.0.1', '清除缓存', '0', '1502862280');
INSERT INTO `hui_logs` VALUES ('395', 'admin', '127.0.0.1', '清除缓存', '0', '1502862282');
INSERT INTO `hui_logs` VALUES ('396', 'admin', '127.0.0.1', '清除缓存', '0', '1502862283');
INSERT INTO `hui_logs` VALUES ('397', 'admin', '127.0.0.1', '清除缓存', '0', '1502862284');
INSERT INTO `hui_logs` VALUES ('398', 'admin', '127.0.0.1', '清除缓存', '0', '1502862285');
INSERT INTO `hui_logs` VALUES ('399', 'admin', '127.0.0.1', '清除缓存', '0', '1502862286');
INSERT INTO `hui_logs` VALUES ('400', 'admin', '127.0.0.1', '清除缓存', '0', '1502862287');
INSERT INTO `hui_logs` VALUES ('401', 'admin', '127.0.0.1', '清除缓存', '0', '1502862288');
INSERT INTO `hui_logs` VALUES ('402', 'admin', '127.0.0.1', '清除缓存', '0', '1502862289');
INSERT INTO `hui_logs` VALUES ('403', 'admin', '127.0.0.1', '账号设置', '1', '1502862303');
INSERT INTO `hui_logs` VALUES ('404', 'admin', '127.0.0.1', '账号设置', '1', '1502862306');
INSERT INTO `hui_logs` VALUES ('405', 'admin', '127.0.0.1', '登录系统', '1', '1503367323');
INSERT INTO `hui_logs` VALUES ('406', 'admin', '127.0.0.1', '账号设置', '1', '1503367329');
INSERT INTO `hui_logs` VALUES ('407', 'admin', '127.0.0.1', '清除缓存', '1', '1503367336');
INSERT INTO `hui_logs` VALUES ('408', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1503367348');
INSERT INTO `hui_logs` VALUES ('409', 'admin', '127.0.0.1', '清除缓存', '1', '1503367353');
INSERT INTO `hui_logs` VALUES ('410', 'admin', '127.0.0.1', '网站配置更新', '1', '1503367361');
INSERT INTO `hui_logs` VALUES ('411', 'admin', '127.0.0.1', '网站配置更新', '1', '1503367371');
INSERT INTO `hui_logs` VALUES ('412', 'admin', '127.0.0.1', '网站配置更新', '1', '1503367377');
INSERT INTO `hui_logs` VALUES ('413', 'admin', '127.0.0.1', '网站配置更新', '1', '1503367506');
INSERT INTO `hui_logs` VALUES ('414', 'admin', '127.0.0.1', '登录系统', '1', '1504071524');
INSERT INTO `hui_logs` VALUES ('415', 'admin', '127.0.0.1', '清除缓存', '1', '1504071547');
INSERT INTO `hui_logs` VALUES ('416', 'admin', '127.0.0.1', '清除缓存', '1', '1504071564');
INSERT INTO `hui_logs` VALUES ('417', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1504071574');
INSERT INTO `hui_logs` VALUES ('418', 'admin', '127.0.0.1', '查看配置文件', '1', '1504071666');
INSERT INTO `hui_logs` VALUES ('419', 'admin', '127.0.0.1', '登录系统', '1', '1505118032');
INSERT INTO `hui_logs` VALUES ('420', 'admin', '127.0.0.1', '清除缓存', '1', '1505118040');
INSERT INTO `hui_logs` VALUES ('421', 'admin', '127.0.0.1', '清除缓存', '0', '1505118041');
INSERT INTO `hui_logs` VALUES ('422', 'admin', '127.0.0.1', '清除缓存', '0', '1505118043');
INSERT INTO `hui_logs` VALUES ('423', 'admin', '127.0.0.1', '清除缓存', '0', '1505118044');
INSERT INTO `hui_logs` VALUES ('424', 'admin', '127.0.0.1', '清除缓存', '0', '1505118044');
INSERT INTO `hui_logs` VALUES ('425', 'admin', '127.0.0.1', '登录系统', '1', '1505183403');
INSERT INTO `hui_logs` VALUES ('426', 'admin', '127.0.0.1', '清除缓存', '1', '1505183471');
INSERT INTO `hui_logs` VALUES ('427', 'admin', '127.0.0.1', '登录系统', '1', '1505378696');
INSERT INTO `hui_logs` VALUES ('428', 'admin', '127.0.0.1', '数据表优化', '1', '1505378752');
INSERT INTO `hui_logs` VALUES ('429', 'admin', '127.0.0.1', '数据表优化', '1', '1505378763');
INSERT INTO `hui_logs` VALUES ('430', 'admin', '127.0.0.1', '数据表优化', '1', '1505378768');
INSERT INTO `hui_logs` VALUES ('431', 'admin', '127.0.0.1', '清除缓存', '1', '1505378790');
INSERT INTO `hui_logs` VALUES ('432', 'admin', '127.0.0.1', '清除缓存', '0', '1505378791');
INSERT INTO `hui_logs` VALUES ('433', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1505378802');
INSERT INTO `hui_logs` VALUES ('434', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1505378812');
INSERT INTO `hui_logs` VALUES ('435', 'admin', '127.0.0.1', '查看配置文件', '1', '1505378819');
INSERT INTO `hui_logs` VALUES ('436', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1505378831');
INSERT INTO `hui_logs` VALUES ('437', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1505378839');
INSERT INTO `hui_logs` VALUES ('438', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1505378848');
INSERT INTO `hui_logs` VALUES ('439', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1505378853');
INSERT INTO `hui_logs` VALUES ('440', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1505378857');
INSERT INTO `hui_logs` VALUES ('441', 'admin', '127.0.0.1', '清除缓存', '1', '1505378891');
INSERT INTO `hui_logs` VALUES ('442', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378898');
INSERT INTO `hui_logs` VALUES ('443', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378901');
INSERT INTO `hui_logs` VALUES ('444', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378902');
INSERT INTO `hui_logs` VALUES ('445', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378903');
INSERT INTO `hui_logs` VALUES ('446', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378904');
INSERT INTO `hui_logs` VALUES ('447', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378904');
INSERT INTO `hui_logs` VALUES ('448', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378905');
INSERT INTO `hui_logs` VALUES ('449', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378905');
INSERT INTO `hui_logs` VALUES ('450', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378905');
INSERT INTO `hui_logs` VALUES ('451', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378907');
INSERT INTO `hui_logs` VALUES ('452', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378908');
INSERT INTO `hui_logs` VALUES ('453', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378908');
INSERT INTO `hui_logs` VALUES ('454', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378909');
INSERT INTO `hui_logs` VALUES ('455', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378909');
INSERT INTO `hui_logs` VALUES ('456', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378910');
INSERT INTO `hui_logs` VALUES ('457', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378910');
INSERT INTO `hui_logs` VALUES ('458', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378910');
INSERT INTO `hui_logs` VALUES ('459', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378910');
INSERT INTO `hui_logs` VALUES ('460', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378911');
INSERT INTO `hui_logs` VALUES ('461', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378911');
INSERT INTO `hui_logs` VALUES ('462', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378911');
INSERT INTO `hui_logs` VALUES ('463', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378911');
INSERT INTO `hui_logs` VALUES ('464', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378911');
INSERT INTO `hui_logs` VALUES ('465', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('466', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('467', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('468', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('469', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('470', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378912');
INSERT INTO `hui_logs` VALUES ('471', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378913');
INSERT INTO `hui_logs` VALUES ('472', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378988');
INSERT INTO `hui_logs` VALUES ('473', 'admin', '127.0.0.1', '网站配置更新', '1', '1505378992');
INSERT INTO `hui_logs` VALUES ('474', 'admin', '127.0.0.1', '登录系统', '1', '1505812746');
INSERT INTO `hui_logs` VALUES ('475', 'admin', '127.0.0.1', '清除缓存', '1', '1505812753');
INSERT INTO `hui_logs` VALUES ('476', 'admin', '127.0.0.1', '清除缓存', '0', '1505812755');
INSERT INTO `hui_logs` VALUES ('477', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1505812788');
INSERT INTO `hui_logs` VALUES ('478', 'admin', '127.0.0.1', '查看配置文件', '1', '1505812825');
INSERT INTO `hui_logs` VALUES ('479', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/../config/extra/websetup.php', '1', '1505812839');
INSERT INTO `hui_logs` VALUES ('480', 'admin', '127.0.0.1', '查看配置文件', '1', '1505812853');
INSERT INTO `hui_logs` VALUES ('481', 'admin', '127.0.0.1', '登录系统', '1', '1507514122');
INSERT INTO `hui_logs` VALUES ('482', 'admin', '127.0.0.1', '清除缓存', '1', '1507522406');
INSERT INTO `hui_logs` VALUES ('483', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507522416');
INSERT INTO `hui_logs` VALUES ('484', 'admin', '127.0.0.1', '登录系统', '1', '1507522729');
INSERT INTO `hui_logs` VALUES ('485', 'admin', '127.0.0.1', '清除缓存', '1', '1507523067');
INSERT INTO `hui_logs` VALUES ('486', 'admin', '127.0.0.1', '登录系统', '1', '1507528189');
INSERT INTO `hui_logs` VALUES ('487', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507528259');
INSERT INTO `hui_logs` VALUES ('488', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/static/notepad.txt', '1', '1507528287');
INSERT INTO `hui_logs` VALUES ('489', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507528294');
INSERT INTO `hui_logs` VALUES ('490', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/static/notepad.txt', '1', '1507528307');
INSERT INTO `hui_logs` VALUES ('491', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui/public/static/notepad.txt', '1', '1507528313');
INSERT INTO `hui_logs` VALUES ('492', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507528317');
INSERT INTO `hui_logs` VALUES ('493', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507528346');
INSERT INTO `hui_logs` VALUES ('494', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507528351');
INSERT INTO `hui_logs` VALUES ('495', 'admin', '127.0.0.1', '清除缓存', '1', '1507528463');
INSERT INTO `hui_logs` VALUES ('496', 'admin', '127.0.0.1', '上传文件ffeec0951a7852adf4deb43d22b7824a.docx', '1', '1507528516');
INSERT INTO `hui_logs` VALUES ('497', 'admin', '127.0.0.1', '清除上传文件', '1', '1507528519');
INSERT INTO `hui_logs` VALUES ('498', 'admin', '127.0.0.1', '上传文件2919a1fff2741035efa8c4d991f41b43.doc', '1', '1507528527');
INSERT INTO `hui_logs` VALUES ('499', 'admin', '127.0.0.1', '清除上传文件', '1', '1507528529');
INSERT INTO `hui_logs` VALUES ('500', 'admin', '127.0.0.1', '退出系统', '1', '1507532790');
INSERT INTO `hui_logs` VALUES ('501', 'admin', '127.0.0.1', '登录系统', '1', '1507532815');
INSERT INTO `hui_logs` VALUES ('502', 'admin', '127.0.0.1', '清除缓存', '1', '1507532824');
INSERT INTO `hui_logs` VALUES ('503', 'admin', '127.0.0.1', '清除缓存', '0', '1507532826');
INSERT INTO `hui_logs` VALUES ('504', 'admin', '127.0.0.1', '清除缓存', '1', '1507533449');
INSERT INTO `hui_logs` VALUES ('505', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\public/static/notepad.txt', '1', '1507533452');
INSERT INTO `hui_logs` VALUES ('506', 'admin', '127.0.0.1', '登录系统', '1', '1507538786');
INSERT INTO `hui_logs` VALUES ('507', 'admin', '127.0.0.1', '清除缓存', '1', '1507538811');
INSERT INTO `hui_logs` VALUES ('508', 'admin', '127.0.0.1', '登录系统', '1', '1507598230');
INSERT INTO `hui_logs` VALUES ('509', 'admin', '127.0.0.1', '清除缓存', '1', '1507598600');
INSERT INTO `hui_logs` VALUES ('510', 'admin', '127.0.0.1', '登录系统', '1', '1507614007');
INSERT INTO `hui_logs` VALUES ('511', 'admin', '127.0.0.1', '清除缓存', '1', '1507614014');
INSERT INTO `hui_logs` VALUES ('512', 'admin', '127.0.0.1', '清除缓存', '1', '1507615588');
INSERT INTO `hui_logs` VALUES ('513', 'admin', '127.0.0.1', '清除缓存', '0', '1507615590');
INSERT INTO `hui_logs` VALUES ('514', 'admin', '127.0.0.1', '清除缓存', '0', '1507615591');
INSERT INTO `hui_logs` VALUES ('515', 'admin', '127.0.0.1', '清除缓存', '0', '1507615610');
INSERT INTO `hui_logs` VALUES ('516', 'admin', '127.0.0.1', '管理员【snoop】禁用', '1', '1507615698');
INSERT INTO `hui_logs` VALUES ('517', 'admin', '127.0.0.1', '管理员【snoop】启用', '1', '1507615702');
INSERT INTO `hui_logs` VALUES ('518', 'admin', '127.0.0.1', '管理员【admin】禁用', '1', '1507615705');
INSERT INTO `hui_logs` VALUES ('519', 'admin', '127.0.0.1', '管理员【admin】启用', '1', '1507615708');
INSERT INTO `hui_logs` VALUES ('520', 'admin', '127.0.0.1', '管理员【snoop】禁用', '1', '1507615711');
INSERT INTO `hui_logs` VALUES ('521', 'admin', '127.0.0.1', '管理员【snoop】启用', '1', '1507615715');
INSERT INTO `hui_logs` VALUES ('522', 'admin', '127.0.0.1', '清除缓存', '1', '1507615723');
INSERT INTO `hui_logs` VALUES ('523', 'admin', '127.0.0.1', '登录系统', '1', '1507619052');
INSERT INTO `hui_logs` VALUES ('524', 'admin', '127.0.0.1', '清除缓存', '1', '1507619056');
INSERT INTO `hui_logs` VALUES ('525', 'admin', '127.0.0.1', '清除缓存', '1', '1507619063');
INSERT INTO `hui_logs` VALUES ('526', 'admin', '127.0.0.1', '清除缓存', '1', '1507621509');
INSERT INTO `hui_logs` VALUES ('527', 'admin', '127.0.0.1', '账号设置', '1', '1507627772');
INSERT INTO `hui_logs` VALUES ('528', 'admin', '127.0.0.1', '登录系统', '1', '1507707156');
INSERT INTO `hui_logs` VALUES ('529', 'admin', '127.0.0.1', '清除缓存', '1', '1507711827');
INSERT INTO `hui_logs` VALUES ('530', 'admin', '127.0.0.1', '清除缓存', '0', '1507711828');
INSERT INTO `hui_logs` VALUES ('531', 'admin', '127.0.0.1', '清除缓存', '1', '1507712475');
INSERT INTO `hui_logs` VALUES ('532', 'admin', '127.0.0.1', '清除缓存', '1', '1507712491');
INSERT INTO `hui_logs` VALUES ('533', 'admin', '127.0.0.1', '登录系统', '1', '1507769912');
INSERT INTO `hui_logs` VALUES ('534', 'admin', '127.0.0.1', '清除缓存', '1', '1507769920');
INSERT INTO `hui_logs` VALUES ('535', 'admin', '127.0.0.1', '清除缓存', '0', '1507769922');
INSERT INTO `hui_logs` VALUES ('536', 'admin', '127.0.0.1', '登录系统', '1', '1507865030');
INSERT INTO `hui_logs` VALUES ('537', 'admin', '127.0.0.1', '清除缓存', '1', '1507872817');
INSERT INTO `hui_logs` VALUES ('538', 'admin', '127.0.0.1', '登录系统', '1', '1507964932');
INSERT INTO `hui_logs` VALUES ('539', 'admin', '127.0.0.1', '清除缓存', '1', '1507964936');
INSERT INTO `hui_logs` VALUES ('540', 'admin', '127.0.0.1', '清除缓存', '1', '1507966220');
INSERT INTO `hui_logs` VALUES ('541', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1507966286');
INSERT INTO `hui_logs` VALUES ('542', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1507966293');
INSERT INTO `hui_logs` VALUES ('543', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/model/Articles.php', '1', '1507966297');
INSERT INTO `hui_logs` VALUES ('544', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui\\app/common/validate/Articles.php', '1', '1507966302');
INSERT INTO `hui_logs` VALUES ('545', 'admin', '127.0.0.1', '清除缓存', '1', '1507966372');
INSERT INTO `hui_logs` VALUES ('546', 'admin', '127.0.0.1', '清除缓存', '0', '1507966373');
INSERT INTO `hui_logs` VALUES ('547', 'admin', '127.0.0.1', '清除缓存', '1', '1507966411');
INSERT INTO `hui_logs` VALUES ('548', 'admin', '127.0.0.1', '清除缓存', '0', '1507966413');
INSERT INTO `hui_logs` VALUES ('549', 'admin', '127.0.0.1', '清除缓存', '1', '1507966962');
INSERT INTO `hui_logs` VALUES ('550', 'admin', '127.0.0.1', '清除缓存', '0', '1507966963');
INSERT INTO `hui_logs` VALUES ('551', 'admin', '127.0.0.1', '清除缓存', '1', '1507966985');
INSERT INTO `hui_logs` VALUES ('552', 'admin', '127.0.0.1', '清除缓存', '1', '1507969381');
INSERT INTO `hui_logs` VALUES ('553', 'admin', '127.0.0.1', '清除缓存', '0', '1507969383');
INSERT INTO `hui_logs` VALUES ('554', 'admin', '127.0.0.1', '清除缓存', '0', '1507969384');
INSERT INTO `hui_logs` VALUES ('555', 'admin', '127.0.0.1', '清除缓存', '0', '1507969385');
INSERT INTO `hui_logs` VALUES ('556', 'admin', '127.0.0.1', '清除缓存', '1', '1507969454');
INSERT INTO `hui_logs` VALUES ('557', 'admin', '127.0.0.1', '清除缓存', '0', '1507969455');
INSERT INTO `hui_logs` VALUES ('558', 'admin', '127.0.0.1', '清除缓存', '1', '1507969461');
INSERT INTO `hui_logs` VALUES ('559', 'admin', '127.0.0.1', '清除缓存', '1', '1507970483');
INSERT INTO `hui_logs` VALUES ('560', 'admin', '127.0.0.1', '清除缓存', '0', '1507970484');
INSERT INTO `hui_logs` VALUES ('561', 'admin', '127.0.0.1', '清除缓存', '0', '1507970486');
INSERT INTO `hui_logs` VALUES ('562', 'admin', '127.0.0.1', '清除缓存', '0', '1507970486');
INSERT INTO `hui_logs` VALUES ('563', 'admin', '127.0.0.1', '清除缓存', '0', '1507970487');
INSERT INTO `hui_logs` VALUES ('564', 'admin', '127.0.0.1', '清除缓存', '0', '1507970488');
INSERT INTO `hui_logs` VALUES ('565', 'admin', '127.0.0.1', '清除缓存', '1', '1507970497');
INSERT INTO `hui_logs` VALUES ('566', 'admin', '127.0.0.1', '清除缓存', '1', '1507970659');
INSERT INTO `hui_logs` VALUES ('567', 'admin', '127.0.0.1', '清除缓存', '0', '1507970660');
INSERT INTO `hui_logs` VALUES ('568', 'admin', '127.0.0.1', '清除缓存', '0', '1507970661');
INSERT INTO `hui_logs` VALUES ('569', 'admin', '127.0.0.1', '清除缓存', '1', '1507971064');
INSERT INTO `hui_logs` VALUES ('570', 'admin', '127.0.0.1', '登录系统', '1', '1508119926');
INSERT INTO `hui_logs` VALUES ('571', 'admin', '127.0.0.1', '登录系统', '1', '1508121976');
INSERT INTO `hui_logs` VALUES ('572', 'admin', '127.0.0.1', '清除缓存', '1', '1508121979');
INSERT INTO `hui_logs` VALUES ('573', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508121982');
INSERT INTO `hui_logs` VALUES ('574', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508122001');
INSERT INTO `hui_logs` VALUES ('575', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508122010');
INSERT INTO `hui_logs` VALUES ('576', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508122400');
INSERT INTO `hui_logs` VALUES ('577', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508122549');
INSERT INTO `hui_logs` VALUES ('578', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508123262');
INSERT INTO `hui_logs` VALUES ('579', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508135876');
INSERT INTO `hui_logs` VALUES ('580', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508142220');
INSERT INTO `hui_logs` VALUES ('581', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508142222');
INSERT INTO `hui_logs` VALUES ('582', 'admin', '127.0.0.1', '修改源代码F:/phpStudy/WWW/Hui.admin/public/static/notepad.txt', '1', '1508142223');
INSERT INTO `hui_logs` VALUES ('583', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508142228');
INSERT INTO `hui_logs` VALUES ('584', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508142290');
INSERT INTO `hui_logs` VALUES ('585', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508146952');
INSERT INTO `hui_logs` VALUES ('586', 'admin', '127.0.0.1', '登录系统', '1', '1508202921');
INSERT INTO `hui_logs` VALUES ('587', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508214457');
INSERT INTO `hui_logs` VALUES ('588', 'admin', '127.0.0.1', '登录系统', '1', '1508910755');
INSERT INTO `hui_logs` VALUES ('589', 'admin', '127.0.0.1', '清除缓存', '1', '1508910770');
INSERT INTO `hui_logs` VALUES ('590', 'admin', '127.0.0.1', '网站配置更新', '1', '1508917725');
INSERT INTO `hui_logs` VALUES ('591', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508918262');
INSERT INTO `hui_logs` VALUES ('592', 'admin', '127.0.0.1', '登录系统', '1', '1508927612');
INSERT INTO `hui_logs` VALUES ('593', 'admin', '127.0.0.1', '清除缓存', '1', '1508927691');
INSERT INTO `hui_logs` VALUES ('594', 'admin', '127.0.0.1', '清除缓存', '0', '1508927693');
INSERT INTO `hui_logs` VALUES ('595', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1508927699');
INSERT INTO `hui_logs` VALUES ('596', 'admin', '127.0.0.1', '登录系统', '1', '1509000054');
INSERT INTO `hui_logs` VALUES ('597', 'admin', '127.0.0.1', '清除缓存', '1', '1509004821');
INSERT INTO `hui_logs` VALUES ('598', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1509004893');
INSERT INTO `hui_logs` VALUES ('599', 'admin', '127.0.0.1', '清除缓存', '1', '1509005191');
INSERT INTO `hui_logs` VALUES ('600', 'admin', '127.0.0.1', '清除缓存', '0', '1509005192');
INSERT INTO `hui_logs` VALUES ('601', 'admin', '127.0.0.1', '清除缓存', '0', '1509005193');
INSERT INTO `hui_logs` VALUES ('602', 'admin', '127.0.0.1', '登录系统', '1', '1509008301');
INSERT INTO `hui_logs` VALUES ('603', 'admin', '127.0.0.1', '登录系统', '1', '1512385907');
INSERT INTO `hui_logs` VALUES ('604', 'admin', '127.0.0.1', '添加配置项', '1', '1512385999');
INSERT INTO `hui_logs` VALUES ('605', 'admin', '127.0.0.1', '添加配置项', '1', '1512386051');
INSERT INTO `hui_logs` VALUES ('606', 'admin', '127.0.0.1', '添加配置项', '1', '1512386107');
INSERT INTO `hui_logs` VALUES ('607', 'admin', '127.0.0.1', '接口配置更新', '1', '1512386141');
INSERT INTO `hui_logs` VALUES ('608', 'admin', '127.0.0.1', '接口配置更新', '1', '1512386144');
INSERT INTO `hui_logs` VALUES ('609', 'admin', '127.0.0.1', '查看配置文件', '1', '1512386148');
INSERT INTO `hui_logs` VALUES ('610', 'admin', '127.0.0.1', '编辑配置项', '1', '1512386208');
INSERT INTO `hui_logs` VALUES ('611', 'admin', '127.0.0.1', '编辑配置项', '1', '1512386239');
INSERT INTO `hui_logs` VALUES ('612', 'admin', '127.0.0.1', '编辑配置项', '1', '1512386257');
INSERT INTO `hui_logs` VALUES ('613', 'admin', '127.0.0.1', '接口配置更新', '1', '1512386262');
INSERT INTO `hui_logs` VALUES ('614', 'admin', '127.0.0.1', '查看配置文件', '1', '1512386273');
INSERT INTO `hui_logs` VALUES ('615', 'admin', '127.0.0.1', '查看配置文件', '1', '1512386573');
INSERT INTO `hui_logs` VALUES ('616', 'admin', '127.0.0.1', '登录系统', '1', '1512386904');
INSERT INTO `hui_logs` VALUES ('617', 'admin', '127.0.0.1', '接口配置更新', '1', '1512387116');
INSERT INTO `hui_logs` VALUES ('618', 'admin', '127.0.0.1', '接口配置更新', '1', '1512387117');
INSERT INTO `hui_logs` VALUES ('619', 'admin', '127.0.0.1', '登录系统', '1', '1512646080');
INSERT INTO `hui_logs` VALUES ('620', 'admin', '127.0.0.1', '接口配置更新', '1', '1512646095');
INSERT INTO `hui_logs` VALUES ('621', 'admin', '127.0.0.1', '登录系统', '1', '1513304081');
INSERT INTO `hui_logs` VALUES ('622', 'admin', '127.0.0.1', '登录系统', '1', '1513742143');
INSERT INTO `hui_logs` VALUES ('623', 'admin', '127.0.0.1', '清除缓存', '1', '1513742170');
INSERT INTO `hui_logs` VALUES ('624', 'admin', '127.0.0.1', '清除缓存', '0', '1513742171');
INSERT INTO `hui_logs` VALUES ('625', 'admin', '127.0.0.1', '登录系统', '1', '1513765545');
INSERT INTO `hui_logs` VALUES ('626', 'admin', '127.0.0.1', '退出系统', '1', '1513765570');
INSERT INTO `hui_logs` VALUES ('628', 'admin', '127.0.0.1', '登录系统', '1', '1513904771');
INSERT INTO `hui_logs` VALUES ('629', 'admin', '127.0.0.1', '登录系统', '1', '1514170376');
INSERT INTO `hui_logs` VALUES ('630', 'admin', '127.0.0.1', '登录系统', '1', '1514338057');
INSERT INTO `hui_logs` VALUES ('631', 'admin', '127.0.0.1', '登录系统', '1', '1514442358');
INSERT INTO `hui_logs` VALUES ('632', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1514442366');
INSERT INTO `hui_logs` VALUES ('633', 'admin', '127.0.0.1', '登录系统', '1', '1514509499');
INSERT INTO `hui_logs` VALUES ('634', 'admin', '127.0.0.1', '清除缓存', '1', '1514532926');
INSERT INTO `hui_logs` VALUES ('635', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1514532931');
INSERT INTO `hui_logs` VALUES ('636', 'admin', '127.0.0.1', '登录系统', '1', '1516176789');
INSERT INTO `hui_logs` VALUES ('637', 'admin', '127.0.0.1', '清除缓存', '1', '1516177552');
INSERT INTO `hui_logs` VALUES ('643', 'admin', '127.0.0.1', '删除日志', '1', '1516177952');
INSERT INTO `hui_logs` VALUES ('644', 'admin', '127.0.0.1', '清除缓存', '1', '1516178149');
INSERT INTO `hui_logs` VALUES ('645', 'admin', '127.0.0.1', '清除缓存', '1', '1516178182');
INSERT INTO `hui_logs` VALUES ('646', 'admin', '127.0.0.1', '清除缓存', '1', '1516178237');
INSERT INTO `hui_logs` VALUES ('647', 'admin', '127.0.0.1', '退出系统', '1', '1516178504');
INSERT INTO `hui_logs` VALUES ('648', 'admin', '127.0.0.1', '登录系统', '1', '1516178511');
INSERT INTO `hui_logs` VALUES ('649', 'admin', '127.0.0.1', '登录系统', '1', '1516178537');
INSERT INTO `hui_logs` VALUES ('652', 'admin', '127.0.0.1', '删除日志', '1', '1516178814');
INSERT INTO `hui_logs` VALUES ('653', 'admin', '127.0.0.1', '登录系统', '1', '1516326406');
INSERT INTO `hui_logs` VALUES ('654', 'admin', '127.0.0.1', '登录系统', '1', '1516602615');
INSERT INTO `hui_logs` VALUES ('655', 'admin', '127.0.0.1', '登录系统', '1', '1516609991');
INSERT INTO `hui_logs` VALUES ('656', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516610010');
INSERT INTO `hui_logs` VALUES ('657', 'admin', '127.0.0.1', '登录系统', '1', '1516670908');
INSERT INTO `hui_logs` VALUES ('658', 'admin', '127.0.0.1', '清除缓存', '1', '1516670916');
INSERT INTO `hui_logs` VALUES ('659', 'admin', '127.0.0.1', '清除缓存', '1', '1516671009');
INSERT INTO `hui_logs` VALUES ('660', 'admin', '127.0.0.1', '清除缓存', '0', '1516671012');
INSERT INTO `hui_logs` VALUES ('661', 'admin', '127.0.0.1', '清除缓存', '0', '1516671015');
INSERT INTO `hui_logs` VALUES ('662', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516671032');
INSERT INTO `hui_logs` VALUES ('663', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516671041');
INSERT INTO `hui_logs` VALUES ('664', 'admin', '127.0.0.1', '上传文件e774d7f401df5e6f521f5389bed4356b.xls', '1', '1516671830');
INSERT INTO `hui_logs` VALUES ('665', 'admin', '127.0.0.1', '清除上传文件', '1', '1516671835');
INSERT INTO `hui_logs` VALUES ('666', 'admin', '127.0.0.1', '上传文件5c64396e4711dad8f2c0c21623987c24.pptx', '1', '1516671839');
INSERT INTO `hui_logs` VALUES ('667', 'admin', '127.0.0.1', '清除上传文件', '1', '1516671841');
INSERT INTO `hui_logs` VALUES ('668', 'admin', '127.0.0.1', '上传文件14116724cf8fe515a1cc9a19b386e4b3.pdf', '1', '1516671845');
INSERT INTO `hui_logs` VALUES ('669', 'admin', '127.0.0.1', '清除上传文件', '1', '1516671846');
INSERT INTO `hui_logs` VALUES ('670', 'admin', '127.0.0.1', '上传文件2c23b632f3eab2a6c32fe61659fd587c.pdf', '1', '1516671850');
INSERT INTO `hui_logs` VALUES ('671', 'admin', '127.0.0.1', '清除上传文件', '1', '1516671852');
INSERT INTO `hui_logs` VALUES ('672', 'admin', '127.0.0.1', '上传文件9f398dc5541ad42897b3782e6a889d5a.zip', '1', '1516671925');
INSERT INTO `hui_logs` VALUES ('673', 'admin', '127.0.0.1', '清除上传文件', '1', '1516671928');
INSERT INTO `hui_logs` VALUES ('674', 'admin', '127.0.0.1', '上传文件ed257d8be457f8ca372311c99b80f7f2.zip', '1', '1516672174');
INSERT INTO `hui_logs` VALUES ('675', 'admin', '127.0.0.1', '发送邮件', '1', '1516672365');
INSERT INTO `hui_logs` VALUES ('676', 'admin', '127.0.0.1', '清除上传文件', '1', '1516672806');
INSERT INTO `hui_logs` VALUES ('677', 'admin', '127.0.0.1', '清除上传文件', '1', '1516673841');
INSERT INTO `hui_logs` VALUES ('678', 'admin', '127.0.0.1', '清除上传文件', '1', '1516673843');
INSERT INTO `hui_logs` VALUES ('679', 'admin', '127.0.0.1', '文档状态设置隐藏', '1', '1516673857');
INSERT INTO `hui_logs` VALUES ('680', 'admin', '127.0.0.1', '文档状态设置审核', '1', '1516673860');
INSERT INTO `hui_logs` VALUES ('681', 'admin', '127.0.0.1', '数据表优化', '1', '1516674409');
INSERT INTO `hui_logs` VALUES ('682', 'admin', '127.0.0.1', '备份数据库', '1', '1516675043');
INSERT INTO `hui_logs` VALUES ('683', 'admin', '127.0.0.1', '备份数据库', '1', '1516675048');
INSERT INTO `hui_logs` VALUES ('684', 'admin', '127.0.0.1', '备份数据库', '1', '1516675050');
INSERT INTO `hui_logs` VALUES ('685', 'admin', '127.0.0.1', '删除备份文件', '1', '1516675131');
INSERT INTO `hui_logs` VALUES ('686', 'admin', '127.0.0.1', '删除备份文件', '1', '1516675137');
INSERT INTO `hui_logs` VALUES ('687', 'admin', '127.0.0.1', '删除备份文件', '1', '1516675143');
INSERT INTO `hui_logs` VALUES ('688', 'admin', '127.0.0.1', '备份数据库', '1', '1516675207');
INSERT INTO `hui_logs` VALUES ('689', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/backup/20180123104007_all_v1.sql', '1', '1516675921');
INSERT INTO `hui_logs` VALUES ('690', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\./public/backup/20180123104007_all_v1.sql', '1', '1516675945');
INSERT INTO `hui_logs` VALUES ('691', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\./public/backup/20180123104007_all_v1.sql', '1', '1516675949');
INSERT INTO `hui_logs` VALUES ('692', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/backup/20180123104007_all_v1.sql', '1', '1516675979');
INSERT INTO `hui_logs` VALUES ('693', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/backup/20180123104007_all_v1.sql', '1', '1516675983');
INSERT INTO `hui_logs` VALUES ('694', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/backup/20180123104007_all_v1.sql', '1', '1516676005');
INSERT INTO `hui_logs` VALUES ('695', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\uploads/public/backup/20180123104007_all_v1.sql', '1', '1516676009');
INSERT INTO `hui_logs` VALUES ('696', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676055');
INSERT INTO `hui_logs` VALUES ('697', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676081');
INSERT INTO `hui_logs` VALUES ('698', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676090');
INSERT INTO `hui_logs` VALUES ('699', 'admin', '127.0.0.1', '查看配置文件', '1', '1516676105');
INSERT INTO `hui_logs` VALUES ('700', 'admin', '127.0.0.1', '查看配置文件', '1', '1516676112');
INSERT INTO `hui_logs` VALUES ('701', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676423');
INSERT INTO `hui_logs` VALUES ('702', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676434');
INSERT INTO `hui_logs` VALUES ('703', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676515');
INSERT INTO `hui_logs` VALUES ('704', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123104007_all_v1.sql', '1', '1516676608');
INSERT INTO `hui_logs` VALUES ('705', 'admin', '127.0.0.1', '删除备份文件', '1', '1516676620');
INSERT INTO `hui_logs` VALUES ('706', 'admin', '127.0.0.1', '备份数据库', '1', '1516676622');
INSERT INTO `hui_logs` VALUES ('707', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123110342_all_v1.sql', '1', '1516676628');
INSERT INTO `hui_logs` VALUES ('708', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/uploads/backup/20180123110342_all_v1.sql', '1', '1516676673');
INSERT INTO `hui_logs` VALUES ('709', 'admin', '127.0.0.1', '清除缓存', '1', '1516680332');
INSERT INTO `hui_logs` VALUES ('710', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516680922');
INSERT INTO `hui_logs` VALUES ('711', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516691663');
INSERT INTO `hui_logs` VALUES ('712', 'admin', '127.0.0.1', '清除缓存', '1', '1516691686');
INSERT INTO `hui_logs` VALUES ('713', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516767001');
INSERT INTO `hui_logs` VALUES ('714', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516767009');
INSERT INTO `hui_logs` VALUES ('715', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516767075');
INSERT INTO `hui_logs` VALUES ('716', 'admin', '127.0.0.1', '登录系统', '1', '1516775872');
INSERT INTO `hui_logs` VALUES ('717', 'admin', '127.0.0.1', '上传文件35abb16ce85cbce057cfd83645aa7d46.zip', '1', '1516776257');
INSERT INTO `hui_logs` VALUES ('718', 'admin', '127.0.0.1', '清除上传文件', '1', '1516776260');
INSERT INTO `hui_logs` VALUES ('719', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516776364');
INSERT INTO `hui_logs` VALUES ('720', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516776405');
INSERT INTO `hui_logs` VALUES ('721', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516776421');
INSERT INTO `hui_logs` VALUES ('722', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516776439');
INSERT INTO `hui_logs` VALUES ('723', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516776464');
INSERT INTO `hui_logs` VALUES ('724', 'admin', '127.0.0.1', '查看配置文件', '1', '1516776504');
INSERT INTO `hui_logs` VALUES ('725', 'admin', '127.0.0.1', '查看配置文件', '1', '1516776512');
INSERT INTO `hui_logs` VALUES ('726', 'admin', '127.0.0.1', '查看配置文件', '1', '1516776526');
INSERT INTO `hui_logs` VALUES ('727', 'admin', '127.0.0.1', '查看配置文件', '1', '1516776535');
INSERT INTO `hui_logs` VALUES ('728', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\app/common/model/Articles.php', '1', '1516776542');
INSERT INTO `hui_logs` VALUES ('729', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\app/common/validate/Articles.php', '1', '1516776547');
INSERT INTO `hui_logs` VALUES ('730', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\app/common/model/Articles.php', '1', '1516776550');
INSERT INTO `hui_logs` VALUES ('731', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\app/common/validate/Articles.php', '1', '1516776553');
INSERT INTO `hui_logs` VALUES ('732', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516777439');
INSERT INTO `hui_logs` VALUES ('733', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516777450');
INSERT INTO `hui_logs` VALUES ('734', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516778126');
INSERT INTO `hui_logs` VALUES ('735', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516782978');
INSERT INTO `hui_logs` VALUES ('736', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516787105');
INSERT INTO `hui_logs` VALUES ('737', 'admin', '127.0.0.1', '查看配置文件', '1', '1516787112');
INSERT INTO `hui_logs` VALUES ('738', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516788453');
INSERT INTO `hui_logs` VALUES ('739', 'admin', '127.0.0.1', '清除缓存', '1', '1516788639');
INSERT INTO `hui_logs` VALUES ('740', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516788659');
INSERT INTO `hui_logs` VALUES ('741', 'admin', '127.0.0.1', '登录系统', '1', '1516789193');
INSERT INTO `hui_logs` VALUES ('742', 'admin', '127.0.0.1', '登录系统', '1', '1516843488');
INSERT INTO `hui_logs` VALUES ('743', 'admin', '127.0.0.1', '清除缓存', '1', '1516843522');
INSERT INTO `hui_logs` VALUES ('744', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516843659');
INSERT INTO `hui_logs` VALUES ('745', 'admin', '127.0.0.1', '登录系统', '1', '1516844320');
INSERT INTO `hui_logs` VALUES ('746', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516844330');
INSERT INTO `hui_logs` VALUES ('747', 'admin', '127.0.0.1', '上传文件ee59eb80f36a785c5f8010ee0f66ceb5.docx', '1', '1516844383');
INSERT INTO `hui_logs` VALUES ('748', 'admin', '127.0.0.1', '文件转换', '1', '1516844400');
INSERT INTO `hui_logs` VALUES ('749', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844409');
INSERT INTO `hui_logs` VALUES ('750', 'admin', '127.0.0.1', '上传文件7883ab14a140bf89fa84392258ff5130.doc', '1', '1516844442');
INSERT INTO `hui_logs` VALUES ('751', 'admin', '127.0.0.1', '文件转换', '1', '1516844446');
INSERT INTO `hui_logs` VALUES ('752', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844448');
INSERT INTO `hui_logs` VALUES ('753', 'admin', '127.0.0.1', '上传文件1001477f156b67ba0ee468f7afa317b6.docx', '1', '1516844479');
INSERT INTO `hui_logs` VALUES ('754', 'admin', '127.0.0.1', '文件转换', '1', '1516844481');
INSERT INTO `hui_logs` VALUES ('755', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844482');
INSERT INTO `hui_logs` VALUES ('756', 'admin', '127.0.0.1', '上传文件6c6f9d5b48d313c50e827ef9c556b77e.docx', '1', '1516844524');
INSERT INTO `hui_logs` VALUES ('757', 'admin', '127.0.0.1', '文件转换', '1', '1516844535');
INSERT INTO `hui_logs` VALUES ('758', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844537');
INSERT INTO `hui_logs` VALUES ('759', 'admin', '127.0.0.1', '上传文件16013e5962192dfc21de5ae684507c1a.docx', '1', '1516844678');
INSERT INTO `hui_logs` VALUES ('760', 'admin', '127.0.0.1', '文件转换', '1', '1516844685');
INSERT INTO `hui_logs` VALUES ('761', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844686');
INSERT INTO `hui_logs` VALUES ('762', 'admin', '127.0.0.1', '上传文件bd244b0839951e6fd9b6f373610fa504.doc', '1', '1516844705');
INSERT INTO `hui_logs` VALUES ('763', 'admin', '127.0.0.1', '文件转换', '1', '1516844709');
INSERT INTO `hui_logs` VALUES ('764', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844710');
INSERT INTO `hui_logs` VALUES ('765', 'admin', '127.0.0.1', '上传文件63fbc329940d3f3a18f4d8c36f4c4909.docx', '1', '1516844728');
INSERT INTO `hui_logs` VALUES ('766', 'admin', '127.0.0.1', '文件转换', '1', '1516844731');
INSERT INTO `hui_logs` VALUES ('767', 'admin', '127.0.0.1', '清除上传文件', '1', '1516844732');
INSERT INTO `hui_logs` VALUES ('768', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516845650');
INSERT INTO `hui_logs` VALUES ('769', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516845862');
INSERT INTO `hui_logs` VALUES ('770', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516845867');
INSERT INTO `hui_logs` VALUES ('771', 'admin', '127.0.0.1', '上传文件3b89ad9f8813ea53b0e4c076a4012e25.xls', '1', '1516860615');
INSERT INTO `hui_logs` VALUES ('772', 'admin', '127.0.0.1', '清除上传文件', '1', '1516860618');
INSERT INTO `hui_logs` VALUES ('773', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862319');
INSERT INTO `hui_logs` VALUES ('774', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862329');
INSERT INTO `hui_logs` VALUES ('775', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862331');
INSERT INTO `hui_logs` VALUES ('776', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862389');
INSERT INTO `hui_logs` VALUES ('777', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862390');
INSERT INTO `hui_logs` VALUES ('778', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862396');
INSERT INTO `hui_logs` VALUES ('779', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862446');
INSERT INTO `hui_logs` VALUES ('780', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862835');
INSERT INTO `hui_logs` VALUES ('781', 'admin', '127.0.0.1', '添加邮箱', '1', '1516862876');
INSERT INTO `hui_logs` VALUES ('782', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '0', '1516864768');
INSERT INTO `hui_logs` VALUES ('783', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '0', '1516864770');
INSERT INTO `hui_logs` VALUES ('784', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516864794');
INSERT INTO `hui_logs` VALUES ('785', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516864798');
INSERT INTO `hui_logs` VALUES ('786', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516864815');
INSERT INTO `hui_logs` VALUES ('787', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '1', '1516864817');
INSERT INTO `hui_logs` VALUES ('788', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516864820');
INSERT INTO `hui_logs` VALUES ('789', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '1', '1516864826');
INSERT INTO `hui_logs` VALUES ('790', 'admin', '127.0.0.1', '添加邮箱', '1', '1516867910');
INSERT INTO `hui_logs` VALUES ('791', 'admin', '127.0.0.1', '编辑邮箱huangxuhui@icloud-power.com', '1', '1516867920');
INSERT INTO `hui_logs` VALUES ('792', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '1', '1516867939');
INSERT INTO `hui_logs` VALUES ('793', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516867945');
INSERT INTO `hui_logs` VALUES ('794', 'admin', '127.0.0.1', '发送邮件：邮件标题为空！', '0', '1516868917');
INSERT INTO `hui_logs` VALUES ('795', 'admin', '127.0.0.1', '发送邮件：邮件内容为空！', '0', '1516868921');
INSERT INTO `hui_logs` VALUES ('796', 'admin', '127.0.0.1', '发送邮件：邮件内容为空！', '0', '1516868922');
INSERT INTO `hui_logs` VALUES ('797', 'admin', '127.0.0.1', '发送邮件：邮件内容为空！', '0', '1516868923');
INSERT INTO `hui_logs` VALUES ('798', 'admin', '127.0.0.1', '发送邮件', '1', '1516868930');
INSERT INTO `hui_logs` VALUES ('799', 'admin', '127.0.0.1', '发送邮件', '1', '1516868962');
INSERT INTO `hui_logs` VALUES ('800', 'admin', '127.0.0.1', '上传文件09b3b39ce2cf48871e5243de3db6deea.xls', '1', '1516869003');
INSERT INTO `hui_logs` VALUES ('801', 'admin', '127.0.0.1', '发送邮件', '1', '1516869008');
INSERT INTO `hui_logs` VALUES ('802', 'admin', '127.0.0.1', '清除上传文件', '1', '1516869011');
INSERT INTO `hui_logs` VALUES ('803', 'admin', '127.0.0.1', '上传文件df65cffdcbb08fefb8af2ed7b0e21239.docx', '1', '1516869471');
INSERT INTO `hui_logs` VALUES ('804', 'admin', '127.0.0.1', '发送邮件', '1', '1516869484');
INSERT INTO `hui_logs` VALUES ('805', 'admin', '127.0.0.1', '清除上传文件', '1', '1516869489');
INSERT INTO `hui_logs` VALUES ('806', 'admin', '127.0.0.1', '清除缓存', '1', '1516870574');
INSERT INTO `hui_logs` VALUES ('807', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1516870640');
INSERT INTO `hui_logs` VALUES ('808', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '1', '1516870643');
INSERT INTO `hui_logs` VALUES ('809', 'admin', '127.0.0.1', '上传文件94c858daa44b051c38404b848c801600.docx', '1', '1516870986');
INSERT INTO `hui_logs` VALUES ('810', 'admin', '127.0.0.1', '发送邮件', '1', '1516871021');
INSERT INTO `hui_logs` VALUES ('811', 'admin', '127.0.0.1', '清除上传文件', '1', '1516871031');
INSERT INTO `hui_logs` VALUES ('812', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516871156');
INSERT INTO `hui_logs` VALUES ('813', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516871430');
INSERT INTO `hui_logs` VALUES ('814', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516873554');
INSERT INTO `hui_logs` VALUES ('815', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516929843');
INSERT INTO `hui_logs` VALUES ('816', 'admin', '127.0.0.1', '数据表优化', '1', '1516929987');
INSERT INTO `hui_logs` VALUES ('817', 'admin', '127.0.0.1', '登录系统', '1', '1516930278');
INSERT INTO `hui_logs` VALUES ('818', 'admin', '127.0.0.1', '登录系统', '1', '1516930528');
INSERT INTO `hui_logs` VALUES ('819', 'admin', '127.0.0.1', '退出系统', '1', '1516930680');
INSERT INTO `hui_logs` VALUES ('820', 'admin', '127.0.0.1', '登录系统', '1', '1516930693');
INSERT INTO `hui_logs` VALUES ('821', 'admin', '127.0.0.1', '上传文件284cf17af3ed7ed1655130635fed2ba3.doc', '1', '1516930840');
INSERT INTO `hui_logs` VALUES ('822', 'admin', '127.0.0.1', '发送邮件', '1', '1516930861');
INSERT INTO `hui_logs` VALUES ('823', 'admin', '127.0.0.1', '清除上传文件', '1', '1516930864');
INSERT INTO `hui_logs` VALUES ('824', 'admin', '127.0.0.1', '清除缓存', '1', '1516931930');
INSERT INTO `hui_logs` VALUES ('825', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1516931960');
INSERT INTO `hui_logs` VALUES ('826', 'admin', '127.0.0.1', '登录系统', '1', '1516933294');
INSERT INTO `hui_logs` VALUES ('827', 'admin', '127.0.0.1', '上传文件0cfdaa1037b3f8e6cea00171251dc345.docx', '1', '1516944818');
INSERT INTO `hui_logs` VALUES ('828', 'admin', '127.0.0.1', '发送邮件', '1', '1516944836');
INSERT INTO `hui_logs` VALUES ('829', 'admin', '127.0.0.1', '清除上传文件', '1', '1516944841');
INSERT INTO `hui_logs` VALUES ('830', 'admin', '127.0.0.1', '清除缓存', '1', '1516947702');
INSERT INTO `hui_logs` VALUES ('831', 'admin', '127.0.0.1', '上传文件bf38447fc3e54343acbcda3456d62db5.docx', '1', '1516947738');
INSERT INTO `hui_logs` VALUES ('832', 'admin', '127.0.0.1', '文件转换', '1', '1516947753');
INSERT INTO `hui_logs` VALUES ('833', 'admin', '127.0.0.1', '清除上传文件', '1', '1516947754');
INSERT INTO `hui_logs` VALUES ('834', 'admin', '127.0.0.1', '删除转换文件', '1', '1516947787');
INSERT INTO `hui_logs` VALUES ('835', 'admin', '127.0.0.1', '登录系统', '1', '1516948132');
INSERT INTO `hui_logs` VALUES ('836', 'admin', '127.0.0.1', '添加配置项', '1', '1517148648');
INSERT INTO `hui_logs` VALUES ('837', 'admin', '127.0.0.1', '编辑配置项', '1', '1517148666');
INSERT INTO `hui_logs` VALUES ('838', 'admin', '127.0.0.1', '编辑配置项', '1', '1517148699');
INSERT INTO `hui_logs` VALUES ('839', 'admin', '127.0.0.1', '查看配置文件', '1', '1517148702');
INSERT INTO `hui_logs` VALUES ('840', 'admin', '127.0.0.1', '网站配置更新', '1', '1517148717');
INSERT INTO `hui_logs` VALUES ('841', 'admin', '127.0.0.1', '查看配置文件', '1', '1517148720');
INSERT INTO `hui_logs` VALUES ('842', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151464');
INSERT INTO `hui_logs` VALUES ('843', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151499');
INSERT INTO `hui_logs` VALUES ('844', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151503');
INSERT INTO `hui_logs` VALUES ('845', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151507');
INSERT INTO `hui_logs` VALUES ('846', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151508');
INSERT INTO `hui_logs` VALUES ('847', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151509');
INSERT INTO `hui_logs` VALUES ('848', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151509');
INSERT INTO `hui_logs` VALUES ('849', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151510');
INSERT INTO `hui_logs` VALUES ('850', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151510');
INSERT INTO `hui_logs` VALUES ('851', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151511');
INSERT INTO `hui_logs` VALUES ('852', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151511');
INSERT INTO `hui_logs` VALUES ('853', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151512');
INSERT INTO `hui_logs` VALUES ('854', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151512');
INSERT INTO `hui_logs` VALUES ('855', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151513');
INSERT INTO `hui_logs` VALUES ('856', 'admin', '127.0.0.1', '发送邮件：SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting', '0', '1517151514');
INSERT INTO `hui_logs` VALUES ('857', 'admin', '127.0.0.1', '清除缓存', '1', '1517153291');
INSERT INTO `hui_logs` VALUES ('858', 'admin', '127.0.0.1', '清除缓存', '0', '1517153292');
INSERT INTO `hui_logs` VALUES ('859', 'admin', '127.0.0.1', '清除缓存', '1', '1517154381');
INSERT INTO `hui_logs` VALUES ('860', 'admin', '127.0.0.1', '清除缓存', '1', '1517154398');
INSERT INTO `hui_logs` VALUES ('861', 'admin', '127.0.0.1', '清除缓存', '1', '1517154639');
INSERT INTO `hui_logs` VALUES ('862', 'admin', '127.0.0.1', '查看源代码D:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1517154650');
INSERT INTO `hui_logs` VALUES ('863', 'admin', '127.0.0.1', '清除缓存', '1', '1517154664');
INSERT INTO `hui_logs` VALUES ('864', 'admin', '127.0.0.1', '清除缓存', '1', '1517188716');
INSERT INTO `hui_logs` VALUES ('865', 'admin', '127.0.0.1', '文件上传成功，文件名称：2bd57ad225ac05e21c5f780780907f7b.docx', '1', '1517188744');
INSERT INTO `hui_logs` VALUES ('866', 'admin', '127.0.0.1', '发送邮件', '1', '1517188756');
INSERT INTO `hui_logs` VALUES ('867', 'admin', '127.0.0.1', '清除上传文件', '1', '1517188758');
INSERT INTO `hui_logs` VALUES ('868', 'admin', '127.0.0.1', '文件上传成功，文件名称：1496817130e363c5bf21428f994ca650.pdf', '1', '1517188883');
INSERT INTO `hui_logs` VALUES ('869', 'admin', '127.0.0.1', '发送邮件', '1', '1517188898');
INSERT INTO `hui_logs` VALUES ('870', 'admin', '127.0.0.1', '清除上传文件', '1', '1517188936');
INSERT INTO `hui_logs` VALUES ('871', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1517189292');
INSERT INTO `hui_logs` VALUES ('872', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1517194417');
INSERT INTO `hui_logs` VALUES ('873', 'admin', '127.0.0.1', '编辑邮箱huangxuhui@icloud-power.com', '1', '1517194431');
INSERT INTO `hui_logs` VALUES ('874', 'admin', '127.0.0.1', '编辑邮箱952612251@qq.com', '1', '1517194452');
INSERT INTO `hui_logs` VALUES ('875', 'admin', '127.0.0.1', '编辑邮箱2412842937@qq.com', '1', '1517194454');
INSERT INTO `hui_logs` VALUES ('876', 'admin', '127.0.0.1', '文件上传成功，文件名称：3f8e1c082d4950d9b96c3d2664507761.zip', '1', '1517194831');
INSERT INTO `hui_logs` VALUES ('877', 'admin', '127.0.0.1', '清除上传文件', '1', '1517194832');
INSERT INTO `hui_logs` VALUES ('878', 'admin', '127.0.0.1', '文件上传成功，文件名称：6da2412a0a7f920ec74cb6790a21e6ca.zip', '1', '1517194842');
INSERT INTO `hui_logs` VALUES ('879', 'admin', '127.0.0.1', '清除上传文件', '1', '1517194844');
INSERT INTO `hui_logs` VALUES ('880', 'admin', '127.0.0.1', '文件上传成功，文件名称：90ee2de7e4bbfb91528d6eb10cf7e103.zip', '1', '1517195627');
INSERT INTO `hui_logs` VALUES ('881', 'admin', '127.0.0.1', '清除上传文件', '1', '1517195630');
INSERT INTO `hui_logs` VALUES ('882', 'admin', '127.0.0.1', '文件上传成功，文件名称：aa123920f4c0f0b1eca1a6f23b6715b0.zip', '1', '1517195697');
INSERT INTO `hui_logs` VALUES ('883', 'admin', '127.0.0.1', '清除上传文件', '1', '1517195700');
INSERT INTO `hui_logs` VALUES ('884', 'admin', '127.0.0.1', '文件上传成功，文件名称：79810ae428c042de8b1840fd6aa72eeb.zip', '1', '1517195756');
INSERT INTO `hui_logs` VALUES ('885', 'admin', '127.0.0.1', '文件上传成功，文件名称：922f154a620a26bd21e02d5dec190a96.zip', '1', '1517195805');
INSERT INTO `hui_logs` VALUES ('886', 'admin', '127.0.0.1', '文件上传成功，文件名称：491121b9d59c113293daef68acfa803d.zip', '1', '1517195898');
INSERT INTO `hui_logs` VALUES ('887', 'admin', '127.0.0.1', '文件上传成功，文件名称：d9937a514c757cf5b87b1f4004be2c7f.zip', '1', '1517195964');
INSERT INTO `hui_logs` VALUES ('888', 'admin', '127.0.0.1', '清除上传文件', '1', '1517195966');
INSERT INTO `hui_logs` VALUES ('889', 'admin', '127.0.0.1', '文件上传成功，文件名称：99a1121664c94ddd7c2fdbe69660de4f.zip', '1', '1517195995');
INSERT INTO `hui_logs` VALUES ('890', 'admin', '127.0.0.1', '文件上传成功，文件名称：3870563f794f10b3b3da82c2dcf292cc.zip', '1', '1517196018');
INSERT INTO `hui_logs` VALUES ('891', 'admin', '127.0.0.1', '文件上传成功，文件名称：ff114f50bbc7b4aeade2ed504874a869.zip', '1', '1517196036');
INSERT INTO `hui_logs` VALUES ('892', 'admin', '127.0.0.1', '清除上传文件', '1', '1517196039');
INSERT INTO `hui_logs` VALUES ('893', 'admin', '127.0.0.1', '文件上传成功，文件名称：a12bd252775aa22bee93a30fe95b9746.zip', '1', '1517196108');
INSERT INTO `hui_logs` VALUES ('894', 'admin', '127.0.0.1', '清除上传文件', '1', '1517196109');
INSERT INTO `hui_logs` VALUES ('895', 'admin', '127.0.0.1', '清理未使用上传文件', '1', '1517196152');
INSERT INTO `hui_logs` VALUES ('896', 'admin', '127.0.0.1', '文件上传成功，文件名称：c5540aefa929716c627eedb1763ba822.zip', '1', '1517196566');
INSERT INTO `hui_logs` VALUES ('897', 'admin', '127.0.0.1', '清除上传文件', '1', '1517196567');
INSERT INTO `hui_logs` VALUES ('898', 'admin', '127.0.0.1', '文件上传成功，文件名称：919858cc959b14a33422319e3148b630.zip', '1', '1517197255');
INSERT INTO `hui_logs` VALUES ('899', 'admin', '127.0.0.1', '清除上传文件', '1', '1517197256');
INSERT INTO `hui_logs` VALUES ('900', 'admin', '127.0.0.1', '文件上传成功，文件名称：181acc1906a45b3810f8f9f232595298.zip', '1', '1517198165');
INSERT INTO `hui_logs` VALUES ('901', 'admin', '127.0.0.1', '清除上传文件', '1', '1517198167');
INSERT INTO `hui_logs` VALUES ('902', 'admin', '127.0.0.1', '文件上传成功，文件名称：21dd8443b2ab45f35d0c13b091ca1e7b.zip', '1', '1517198266');
INSERT INTO `hui_logs` VALUES ('903', 'admin', '127.0.0.1', '清除上传文件', '1', '1517198267');
INSERT INTO `hui_logs` VALUES ('904', 'admin', '127.0.0.1', '文件上传成功，文件名称：e29a6c9913061866b39fa733c1e72d75.docx', '1', '1517204285');
INSERT INTO `hui_logs` VALUES ('905', 'admin', '127.0.0.1', '清除上传文件', '1', '1517204291');
INSERT INTO `hui_logs` VALUES ('906', 'admin', '127.0.0.1', '文件上传成功，文件名称：9d2652c2042ffb853180065bda70234d.doc', '1', '1517204300');
INSERT INTO `hui_logs` VALUES ('907', 'admin', '127.0.0.1', '清除上传文件', '1', '1517204303');
INSERT INTO `hui_logs` VALUES ('908', 'admin', '127.0.0.1', '文件上传成功，文件名称：7083dbcbc9e7d4175b268d599f3e9666.xlsx', '1', '1517204309');
INSERT INTO `hui_logs` VALUES ('909', 'admin', '127.0.0.1', '文件转换', '1', '1517204325');
INSERT INTO `hui_logs` VALUES ('910', 'admin', '127.0.0.1', '清除上传文件', '1', '1517204330');
INSERT INTO `hui_logs` VALUES ('911', 'admin', '127.0.0.1', '文件上传成功，文件名称：0ee1b2d4a1db3c4efbb4e6b2cfb42b49.docx', '1', '1517209378');
INSERT INTO `hui_logs` VALUES ('912', 'admin', '127.0.0.1', '查看源代码F:\\phpStudy\\WWW\\Hui.admin\\public/static/notepad.txt', '1', '1517211679');

-- ----------------------------
-- Table structure for `hui_logs_api`
-- ----------------------------
DROP TABLE IF EXISTS `hui_logs_api`;
CREATE TABLE `hui_logs_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '接口类型 1：邮箱接口',
  `request` text NOT NULL COMMENT '请求信息',
  `response` text COMMENT '响应信息',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `time` varchar(15) NOT NULL DEFAULT '' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='接口日志表';

-- ----------------------------
-- Records of hui_logs_api
-- ----------------------------
INSERT INTO `hui_logs_api` VALUES ('1', '1', '{\"title\":\"青岛大车类型\",\"content\":\"<p>星期一<\\/p>\",\"email\":[\"huangxuhui@icloud-power.com\"],\"file\":\".\\/uploads\\/attach\\/20180129\\/1496817130e363c5bf21428f994ca650.pdf\"}', 'true', '', '1517188898');

-- ----------------------------
-- Table structure for `hui_map_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `hui_map_statistics`;
CREATE TABLE `hui_map_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `province` varchar(45) NOT NULL COMMENT '地区',
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='地图信息统计表';

-- ----------------------------
-- Records of hui_map_statistics
-- ----------------------------
INSERT INTO `hui_map_statistics` VALUES ('1', '北京', '2');
INSERT INTO `hui_map_statistics` VALUES ('2', '天津', '2');
INSERT INTO `hui_map_statistics` VALUES ('3', '上海', '3');
INSERT INTO `hui_map_statistics` VALUES ('4', '重庆', '2');
INSERT INTO `hui_map_statistics` VALUES ('5', '河北', '3');
INSERT INTO `hui_map_statistics` VALUES ('6', '河南', '4');
INSERT INTO `hui_map_statistics` VALUES ('7', '云南', '1');
INSERT INTO `hui_map_statistics` VALUES ('8', '辽宁', '3');
INSERT INTO `hui_map_statistics` VALUES ('9', '黑龙江', '2');
INSERT INTO `hui_map_statistics` VALUES ('10', '安徽', '2');
INSERT INTO `hui_map_statistics` VALUES ('11', '山东', '6');
INSERT INTO `hui_map_statistics` VALUES ('12', '新疆', '1');
INSERT INTO `hui_map_statistics` VALUES ('13', '江苏', '7');
INSERT INTO `hui_map_statistics` VALUES ('14', '浙江', '4');
INSERT INTO `hui_map_statistics` VALUES ('15', '江西', '2');
INSERT INTO `hui_map_statistics` VALUES ('16', '湖北', '3');
INSERT INTO `hui_map_statistics` VALUES ('17', '广西', '2');
INSERT INTO `hui_map_statistics` VALUES ('18', '甘肃', '1');
INSERT INTO `hui_map_statistics` VALUES ('19', '山西', '1');
INSERT INTO `hui_map_statistics` VALUES ('20', '内蒙古', '2');
INSERT INTO `hui_map_statistics` VALUES ('21', '陕西', '30');
INSERT INTO `hui_map_statistics` VALUES ('22', '吉林', '1');
INSERT INTO `hui_map_statistics` VALUES ('23', '福建', '3');
INSERT INTO `hui_map_statistics` VALUES ('24', '贵州', '1');
INSERT INTO `hui_map_statistics` VALUES ('25', '广东', '7');
INSERT INTO `hui_map_statistics` VALUES ('26', '青海', '2');
INSERT INTO `hui_map_statistics` VALUES ('27', '西藏', '10');
INSERT INTO `hui_map_statistics` VALUES ('28', '四川', '3');
INSERT INTO `hui_map_statistics` VALUES ('29', '宁夏', '3');
INSERT INTO `hui_map_statistics` VALUES ('30', '海南', '5');
INSERT INTO `hui_map_statistics` VALUES ('31', '台湾', '7');
INSERT INTO `hui_map_statistics` VALUES ('32', '香港', '20');
INSERT INTO `hui_map_statistics` VALUES ('33', '澳门', '11');
INSERT INTO `hui_map_statistics` VALUES ('34', '湖南', '3');

-- ----------------------------
-- Table structure for `hui_models`
-- ----------------------------
DROP TABLE IF EXISTS `hui_models`;
CREATE TABLE `hui_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(100) NOT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '模型名称',
  `sorting` int(11) NOT NULL COMMENT '排序',
  `mark` varchar(500) DEFAULT NULL,
  `is_attach` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启大附件上传',
  `status` int(1) NOT NULL COMMENT '状态',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of hui_models
-- ----------------------------
INSERT INTO `hui_models` VALUES ('17', 'Articles', '文章模型', '1', '', '1', '1', '1500999572');

-- ----------------------------
-- Table structure for `hui_user`
-- ----------------------------
DROP TABLE IF EXISTS `hui_user`;
CREATE TABLE `hui_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户账号',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '用户密码',
  `head_portrait` int(11) NOT NULL DEFAULT '0' COMMENT '用户头像',
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `logintime` int(11) NOT NULL COMMENT '登录时间',
  `loginnumber` int(11) NOT NULL COMMENT '登陆次数',
  `loginip` varchar(30) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `state` int(1) DEFAULT '1' COMMENT '账号状态',
  `utime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='管理人员表';

-- ----------------------------
-- Records of hui_user
-- ----------------------------
INSERT INTO `hui_user` VALUES ('1', 'snoop', '195e3ea51a813d3806a37eb4ae4e8671', '0', '952612251@qq.com', '18710366574', '1487319295', '1500536010', '122', '127.0.0.1', '1', '1507615715');
INSERT INTO `hui_user` VALUES ('27', 'admin', '195e3ea51a813d3806a37eb4ae4e8671', '0', '2412842937@qq.com', '187103665746', '1498665763', '1516948132', '127', '127.0.0.1', '1', '1507627772');
