#
# TABLE STRUCTURE FOR: ci_account
#

DROP TABLE IF EXISTS ci_account;

CREATE TABLE `ci_account` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `amount` double DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_account (`id`, `name`, `number`, `status`, `amount`, `date`, `type`, `isDelete`) VALUES (1, '現金', '01', 1, '0', '2016-04-16', 1, 0);


#
# TABLE STRUCTURE FOR: ci_account_info
#

DROP TABLE IF EXISTS ci_account_info;

CREATE TABLE `ci_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billNo` varchar(25) DEFAULT '' COMMENT '销售单号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `accId` int(11) DEFAULT '0' COMMENT '结算账户ID',
  `payment` double DEFAULT '0' COMMENT '收款金额  采购退回为正',
  `wayId` int(11) DEFAULT '0' COMMENT '结算方式ID',
  `settlement` varchar(50) DEFAULT '' COMMENT '结算号',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `transType` int(11) DEFAULT '0',
  `transTypeName` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `billdate` (`billDate`) USING BTREE,
  KEY `iid` (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (1, 4, 1, 'CG201006090236073', 'PUR', '2016-01-17', 0, '0', 0, '', '', 150501, '普通采购', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (2, 16, 20, 'XS201604240200546', 'SALE', '2016-04-24', 1, '11.8', 0, '', '', 150601, '普通销售', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (3, 17, 20, 'SKD201604290041402', 'RECEIPT', '2016-04-26', 1, '0', 0, '', '', 153001, '收款', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (4, 18, 20, 'SKD201605010920543', 'RECEIPT', '2016-05-01', 1, '100', 9, '', '', 153001, '收款', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (5, 19, 20, 'SKD201605020043233', 'RECEIPT', '2016-05-01', 1, '10', 9, '', '', 153001, '收款', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (11, 22, 18, 'XS201605022238279', 'SALE', '2016-05-02', 1, '8', 0, '', '', 150601, '普通销售', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (10, 24, 17, 'XS201605022310118', 'SALE', '2016-05-02', 0, '0', 0, '', '', 150601, '普通销售', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (9, 20, 21, 'CG201605022104538', 'PUR', '2016-05-02', 1, '-600', 0, '', '', 150501, '普通采购', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (12, 29, 18, 'SKD201605032344085', 'RECEIPT', '2016-05-03', 1, '1.5', 9, '', '', 153001, '收款', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (13, 30, 18, 'SKD201605032344217', 'RECEIPT', '2016-05-03', 1, '1.5', 9, '', '', 153001, '收款', 0);
INSERT INTO ci_account_info (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES (14, 40, 19, 'SKD201605050128303', 'RECEIPT', '2016-05-05', 1, '100', 9, '', '', 153001, '收款', 0);


#
# TABLE STRUCTURE FOR: ci_address
#

DROP TABLE IF EXISTS ci_address;

CREATE TABLE `ci_address` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `shortName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT ' ',
  `postalcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkman` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`postalcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: ci_admin
#

DROP TABLE IF EXISTS ci_admin;

CREATE TABLE `ci_admin` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (1, 'admin', '7fef6171469e80d32c0559f88b377245', 1, '系統管理員', '13888888888', NULL, 0);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (2, 'kychan', '73b796238fa32b16e9ea81b17deb07a8', 1, '陳康愉', '13726233135', '6,7,88', 1);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (3, 'zhhuaspace', '4f9f7f5a74e3f5183a1e7aa902ed9ca2', 1, 'zhhuaspace', '13726233133', NULL, 1);
INSERT INTO ci_admin (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES (4, 'test', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 'test', '13726233333', NULL, 1);


#
# TABLE STRUCTURE FOR: ci_assistingprop
#

DROP TABLE IF EXISTS ci_assistingprop;

CREATE TABLE `ci_assistingprop` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: ci_assistsku
#

DROP TABLE IF EXISTS ci_assistsku;

CREATE TABLE `ci_assistsku` (
  `skuId` int(11) NOT NULL AUTO_INCREMENT,
  `skuClassId` int(11) DEFAULT '0',
  `skuAssistId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`skuId`),
  KEY `id` (`skuClassId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: ci_category
#

DROP TABLE IF EXISTS ci_category;

CREATE TABLE `ci_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(6) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '区别',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(4) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (1, '厂家', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (2, '麪粉', 0, '2', 1, 0, 1, 'trade', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (3, '祐漢', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (4, '筷子基', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (5, '三盞燈', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (6, '台山', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (7, '中區 新口岸', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (8, '氹仔', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (9, '現付', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (10, '月結', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (11, '1234', 2, '2,11', 2, 0, 1, 'trade', '', 1, 0, 1);
INSERT INTO ci_category (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES (12, '載', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0);


#
# TABLE STRUCTURE FOR: ci_contact
#

DROP TABLE IF EXISTS ci_contact;

CREATE TABLE `ci_contact` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '客户名称',
  `number` varchar(50) DEFAULT '0' COMMENT '客户编号',
  `cCategory` smallint(6) DEFAULT '0' COMMENT '客户类别',
  `cCategoryName` varchar(50) DEFAULT '' COMMENT '分类名称',
  `taxRate` double DEFAULT '0' COMMENT '税率',
  `amount` double DEFAULT '0' COMMENT '期初应付款',
  `periodMoney` double DEFAULT '0' COMMENT '期初预付款',
  `difMoney` double DEFAULT '0' COMMENT '初期往来余额',
  `beginDate` date DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `linkMans` text COMMENT '客户联系方式',
  `type` tinyint(1) DEFAULT '-10' COMMENT '-10客户  10供应商',
  `contact` text,
  `cLevel` smallint(5) DEFAULT '1' COMMENT '客户等级ID',
  `cLevelName` varchar(50) DEFAULT '' COMMENT '客户等级',
  `pinYin` varchar(50) DEFAULT '',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常 1删除',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (1, '中顺洁柔', '0025114', 1, '厂家', '10', '12', '144', '0', '2016-04-26', '0', '[{\"linkName\":\"1\",\"linkMobile\":\"\",\"linkPhone\":\"1\",\"linkIm\":\"1\",\"linkFirst\":1,\"id\":0}]', 10, NULL, 0, '0', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (2, '榮譽', '14', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[{\"linkName\":\"周生\",\"linkMobile\":\"68414433\",\"linkPhone\":\"\",\"linkIm\":\"\",\"linkFirst\":1,\"province\":\"澳门特别行政区\",\"city\":\"离岛\",\"county\":\"\",\"address\":\"好好學習，天天向上\",\"id\":0}]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (3, '花蓮一品香', '27', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (4, '周根記', '30', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (5, '順德建華', '39', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (6, '齊歡樂', '52', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (7, '002美食', 'D001', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (8, '002美食', 'D002', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (9, '其記（鋪）', 'D003', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (10, '其記（街市）', 'D003A', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (11, '牛記', 'D004', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (12, '皇子', 'D005', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (13, '肥佬', 'D006', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (14, '麵店王', 'D007', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (15, '好連來', 'D008', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (16, '耀發', 'D009', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (17, '廣豐', 'D011', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (18, '利盛', 'D012', 3, '祐漢', '0', '0', '0', '0', '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (19, '金豐', 'D013', 3, '祐漢', '0', '0', '0', '0', '2016-04-19', '', '[{\"linkName\":\"顧\",\"linkMobile\":\"\",\"linkPhone\":\"\",\"linkIm\":\"\",\"linkFirst\":1,\"id\":0}]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (20, '泰豐', 'D016', 3, '祐漢', '0', '12', '12', '0', '2016-04-26', '', '[{\"linkName\":\"鄭生\",\"linkMobile\":\"13726233135\",\"linkPhone\":\"\",\"linkIm\":\"\",\"linkFirst\":1,\"id\":0}]', -10, NULL, 1, '批發客戶', '', 0, 0);
INSERT INTO ci_contact (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES (21, '乐華麪粉廠', '002511', 1, '厂家', '17', '0', '0', '0', '2016-05-01', '', '[{\"linkName\":\"ggroe\",\"linkMobile\":\"\",\"linkPhone\":\"\",\"linkIm\":\"\",\"linkFirst\":1,\"id\":0}]', 10, NULL, 0, '0', '', 0, 0);


#
# TABLE STRUCTURE FOR: ci_goods
#

DROP TABLE IF EXISTS ci_goods;

CREATE TABLE `ci_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商品编号',
  `quantity` double DEFAULT '0' COMMENT '起初数量',
  `spec` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规格',
  `baseUnitId` smallint(6) DEFAULT '0' COMMENT '单位ID',
  `unitName` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单位名称',
  `categoryId` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `categoryName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分类名称',
  `purPrice` double DEFAULT '0' COMMENT '预计采购价',
  `salePrice` double DEFAULT '0' COMMENT '预计销售价',
  `unitCost` double DEFAULT '0' COMMENT '单位成本',
  `amount` double DEFAULT '0' COMMENT '期初总价',
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `goods` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `propertys` text COLLATE utf8_unicode_ci COMMENT '初期设置',
  `vipPrice` double DEFAULT '0' COMMENT '会员价',
  `lowQty` double DEFAULT '0',
  `length` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `height` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `highQty` double DEFAULT '0',
  `isSerNum` double DEFAULT '0',
  `barCode` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `discountRate1` double DEFAULT '0' COMMENT '0',
  `discountRate2` double DEFAULT '0',
  `locationId` int(11) DEFAULT '0',
  `locationName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wholesalePrice` double DEFAULT '0',
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `skuAssistId` text COLLATE utf8_unicode_ci COMMENT '辅助属性分类',
  `pinYin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `unitId` smallint(6) DEFAULT '0',
  `files` text COLLATE utf8_unicode_ci COMMENT '图片路径',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `unitTypeId` int(11) DEFAULT '0',
  `assistIds` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `assistName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `assistUnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `jianxing` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `josl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `skuClassId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `property` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `safeDays` double DEFAULT '0',
  `advanceDay` double DEFAULT '0',
  `isWarranty` double DEFAULT '0',
  `delete` int(11) DEFAULT '0',
  `weight` double DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常  1删除',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (1, 'C&S法柔国际版', '002511-1', '0', '1*12', 1, '条', 2, '麪粉', '4.8', '6.8', '0', '0', '', 1, '', NULL, '5.8', '12', '', '', '15', '0', '6914068008448', '0', '0', 1, '总仓', '5.8', '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (2, 'C&S可湿水面纸', '002511-2', '0', '1*12', 1, '条', 2, '麪粉', '4.8', '6.8', '0', '0', '', 1, '', NULL, '5.8', '10', '', '', '15', '0', '6914068012858', '0', '0', 1, '总仓', '5.8', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (3, '肉燕皮', 'S19', '0', '', 3, '磅', 2, '麪粉', '0', '77', '0', '0', '', 1, '', NULL, '77', '5', '', '', '57', '0', '', '0', '0', 1, '總倉', '77', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (4, '皂角米', 'Z72', '0', '', 3, '磅', 2, '麪粉', '0', '1', '0', '0', '', 1, '', NULL, '1', '0', '', '', '80', '0', '3', '0', '0', 1, '總倉', '1', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (5, '全蛋麵（幼）', '1', '0', '', 3, '磅', 2, '麪粉', '10', '15', '0', '0', '', 1, '', NULL, '15', '0', '', '', '90', '0', '', '0', '0', 0, '', '15', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (6, '全蛋生麵（粗）（明）', 'A7', '0', '12', 3, '磅', 2, '麪粉', '12', '15', '0', '0', '', 1, '', NULL, '15', '0', '', '', '50', '0', '2', '0', '0', 0, '', '15', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (7, '炒麵（扁炒麵）', 'F2', '0', '', 3, '磅', 2, '麪粉', '5', '9.5', '0', '0', '', 1, '', NULL, '9.5', '0', '', '', '50', '0', '', '0', '0', 0, '', '9.5', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);
INSERT INTO ci_goods (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES (8, '全蛋伊麵', 'B2', '0', '', 3, '磅', 2, '麪粉', '5', '9', '0', '0', '', 1, '', NULL, '9', '0', '', '', '50', '0', '', '0', '5', 1, '默認倉', '9', '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', '0', '0', '0', 0, '0', 0);


#
# TABLE STRUCTURE FOR: ci_goods_img
#

DROP TABLE IF EXISTS ci_goods_img;

CREATE TABLE `ci_goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `invId` int(11) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `thumbnailUrl` varchar(255) DEFAULT '',
  `size` int(11) DEFAULT '0',
  `deleteUrl` varchar(255) DEFAULT '',
  `deleteType` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invId` (`invId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ci_invoice
#

DROP TABLE IF EXISTS ci_invoice;

CREATE TABLE `ci_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (5, 1, 'CG201603152118516', 1, '系統管理員', 150501, '9.6', '4.8', '0', '2016-03-15', '', '4.8', '50', '4.8', '2', '0', 0, '', '0', '0', 0, 0, 'PUR', '2016-03-15 21:18:51', 0, '购货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (6, 2, 'XS201603152133541', 1, '系統管理員', 150601, '14.6', '14.6', '0', '2016-03-15', '', '14.6', '0', '0', '2', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-04-05 22:55:10', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (7, 20, 'XS201604121450524', 1, '系統管理員', 150601, '6.8', '6.8', '0', '2016-04-11', '', '0', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-02 01:35:01', 0, '销货', '0', 0, '0', '0', '0', '6.8', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (8, 20, 'XS201604162127513', 1, '系統管理員', 150601, '6.8', '6.8', '0', '2016-04-16', '', '6.8', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-04-16 21:58:41', 0, '销货', '0', 1, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (9, 1, 'CG201604162146162', 1, '系統管理員', 150501, '4.8', '4.8', '0', '2016-04-16', '', '4.8', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'PUR', '2016-04-16 21:46:16', 0, '购货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (10, 20, 'XS201604162248453', 1, '系統管理員', 150601, '6.8', '6.8', '0', '2016-04-16', '', '6.8', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-04-16 22:48:45', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (11, 20, 'XS201604162250354', 1, '系統管理員', 150601, '6.8', '6.8', '0', '2016-04-16', '', '6.8', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-04-16 22:50:35', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (12, 1, 'CG201604162253084', 1, '系統管理員', 150501, '4.8', '4.8', '0', '2016-04-16', '', '4.8', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'PUR', '2016-04-16 22:53:08', 0, '购货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (13, 0, 'QTRK201604202245450', 1, '系統管理員', 150706, '4.8', '0', '0', '2016-04-20', '', '0', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'OI', NULL, 0, '其他入库', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (14, 20, 'XS201604202258338', 1, '系統管理員', 150602, '0', '0', '0', '2016-04-20', '', '0', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-04-20 22:58:33', 2, '销退', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (15, 0, 'QTCK201604202349174', 1, '系統管理員', 150806, '0', '0', '0', '2016-04-20', '', '0', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'OO', NULL, 0, '其他出库', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (16, 20, 'XS201604240200546', 1, '系統管理員', 150601, '11.8', '11.8', '11.8', '2016-04-24', '', '0', '0', '0', '2', '0', 0, '', '0', '0', 0, 1, 'SALE', '2016-04-24 02:00:54', 2, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (17, 20, 'SKD201604290041402', 1, '系統管理員', 153001, '0', '0', '0', '2016-04-26', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (18, 20, 'SKD201605010920543', 1, '系統管理員', 153001, '0', '100', '0', '2016-05-01', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (19, 20, 'SKD201605020043233', 1, '系統管理員', 153001, '0', '10', '0', '2016-05-01', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (20, 21, 'CG201605022104538', 1, '系統管理員', 150501, '2140', '2140', '600', '2016-05-02', '', '1540', '0', '0', '420', '0', 0, '', '0', '0', 0, 1, 'PUR', '2016-05-03 00:15:56', 1, '购货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (21, 19, 'XS201605022105023', 1, '系統管理員', 150601, '24.5', '24.5', '0', '2016-05-02', '', '24.5', '0', '0', '2', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 01:42:14', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (22, 18, 'XS201605022238279', 1, '系統管理員', 150601, '49.5', '49.5', '8', '2016-05-02', '', '41.5', '0', '0', '5', '0', 0, '', '0', '0', 0, 1, 'SALE', '2016-05-03 22:41:59', 1, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (23, 20, 'XS201605022239250', 1, '系統管理員', 150601, '48.5', '48.5', '0', '2016-05-02', '', '48.5', '0', '0', '4', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 01:41:28', 0, '销货', '0', 0, '0', '0', '0', '48.5', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (24, 17, 'XS201605022310118', 1, '系統管理員', 150601, '108', '108', '0', '2016-05-02', '', '108', '0', '0', '4', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 01:49:51', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (25, 16, 'XS201605030143343', 1, '系統管理員', 150601, '116.5', '116.5', '0', '2016-05-03', '', '116.5', '0', '0', '4', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 01:49:21', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (26, 15, 'XS201605030206443', 1, '系統管理員', 150601, '39.5', '39.5', '0', '2016-05-03', '', '39.5', '0', '0', '3', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 02:08:18', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (27, 15, 'XS201605030208388', 1, '系統管理員', 150601, '87.5', '87.5', '0', '2016-05-03', '', '87.5', '0', '0', '3', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 02:08:38', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (28, 13, 'XS201605030209108', 1, '系統管理員', 150601, '77', '77', '0', '2016-05-03', '', '77', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-03 02:09:10', 0, '销货', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (29, 18, 'SKD201605032344085', 1, '系統管理員', 153001, '0', '1.5', '0', '2016-05-03', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (30, 18, 'SKD201605032344217', 1, '系統管理員', 153001, '0', '1.5', '0', '2016-05-03', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (31, 20, 'XS201605042240023', 1, '系統管理員', 150601, '9', '9', '0', '2016-05-04', '', '9', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-04 22:40:02', 0, '銷售出貨', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (32, 20, 'XS201605042356329', 1, '系統管理員', 150602, '-8.55', '-8.55', '0', '2016-05-04', '', '-8.55', '0', '0', '1', '0', 0, '', '0', '0', 0, 0, 'SALE', '2016-05-04 23:56:32', 0, '銷售退貨', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (33, 0, 'CBTZ201605050006242', 1, '系統管理員', 150807, '10', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (34, 0, 'CBTZ201605050015496', 1, '系統管理員', 150807, '20', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (35, 0, 'CBTZ201605050023003', 1, '系統管理員', 150807, '0', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (36, 0, 'CBTZ201605050023347', 1, '系統管理員', 150807, '0', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (37, 0, 'CBTZ201605050024297', 1, '系統管理員', 150807, '0', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (38, 0, 'CBTZ201605050024370', 1, '系統管理員', 150807, '0', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', NULL, 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (39, 0, 'CBTZ201605050118415', 1, '系統管理員', 150807, '60', '0', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'CADJ', '2016-05-05 01:26:12', 0, '成本调整', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO ci_invoice (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES (40, 19, 'SKD201605050128303', 1, '系統管理員', 153001, '0', '100', '0', '2016-05-05', '', '0', '0', '0', '0', '0', 0, '', '0', '0', 0, 0, 'RECEIPT', NULL, 0, '收款', '0', 0, '0', '0', '0', '0', '0', '0', '0', 0);


#
# TABLE STRUCTURE FOR: ci_invoice_info
#

DROP TABLE IF EXISTS ci_invoice_info;

CREATE TABLE `ci_invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (1, 1, 1, 'CG201006090018020', 150501, '6.8', '2016-01-16', '', 0, '6.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (2, 2, 1, 'CG201006090018093', 150501, '6.8', '2016-01-16', '', 0, '6.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (3, 3, 1, 'CG201006090019165', 150501, '6.8', '2016-01-16', '', 0, '6.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (4, 0, 0, '期初数量', 0, '0', '2001-01-01', '', 0, '0', '0', '0', '0', 1, '0', '0', '0', 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (5, 0, 0, '期初数量', 0, '0', '2001-01-01', '', 0, '0', '0', '0', '0', 1, '0', '0', '0', 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (8, 0, 0, '期初数量', 0, '0', '2001-01-01', '', 1, '0', '0', '0', '0', 1, '0', '0', '0', 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (9, 4, 1, 'CG201006090236073', 150501, '76.8', '2016-01-17', '', 1, '4.8', '0', '0', '16', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (10, 4, 1, 'CG201006090236073', 150501, '43.2', '2016-01-17', '', 2, '4.8', '0', '0', '9', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (11, 5, 1, 'CG201603152118516', 150501, '4.8', '2016-03-15', '', 2, '4.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (12, 5, 1, 'CG201603152118516', 150501, '4.8', '2016-03-15', '', 2, '4.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (14, 6, 2, 'XS201603152133541', 150601, '7.8', '2016-03-15', '', 1, '7.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (15, 6, 2, 'XS201603152133541', 150601, '6.8', '2016-03-15', '', 2, '6.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (31, 7, 20, 'XS201604121450524', 150601, '6.8', '2016-04-11', '', 2, '6.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (22, 8, 20, 'XS201604162127513', 150601, '6.8', '2016-04-16', '', 2, '6.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 1, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (20, 9, 1, 'CG201604162146162', 150501, '4.8', '2016-04-16', '', 2, '4.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (23, 10, 20, 'XS201604162248453', 150601, '6.8', '2016-04-16', '', 2, '6.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (24, 11, 20, 'XS201604162250354', 150601, '6.8', '2016-04-16', '', 1, '6.8', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (25, 12, 1, 'CG201604162253084', 150501, '4.8', '2016-04-16', '', 1, '4.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (26, 13, 0, 'QTRK201604202245450', 150706, '4.8', '2016-04-20', '', 1, '4.8', '0', '0', '1', 1, '0', '0', '0', -1, -1, 1, '其他入库', 0, 0, '', 'OI', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (27, 14, 20, 'XS201604202258338', 150602, '0', '2016-04-20', '', 1, '6.8', '6.8', '100', '1', 1, '0', '0', '0', 0, -1, 1, '销退', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (28, 15, 0, 'QTCK201604202349174', 150806, '0', '2016-04-20', '', 2, '0', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '其他出库', 0, 0, '', 'OO', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (29, 16, 20, 'XS201604240200546', 150601, '6.8', '2016-04-24', '', 2, '6.8', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (30, 16, 20, 'XS201604240200546', 150601, '5', '2016-04-24', '', 1, '5', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (63, 20, 21, 'CG201605022104538', 150501, '350', '2016-05-02', '', 7, '5', '0', '0', '70', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (64, 20, 21, 'CG201605022104538', 150501, '350', '2016-05-02', '', 8, '5', '0', '0', '70', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (62, 20, 21, 'CG201605022104538', 150501, '840', '2016-05-02', '', 6, '12', '0', '0', '70', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (61, 20, 21, 'CG201605022104538', 150501, '600', '2016-05-02', '', 5, '10', '0', '0', '60', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (60, 20, 21, 'CG201605022104538', 150501, '0', '2016-05-02', '', 4, '0', '0', '0', '50', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (59, 20, 21, 'CG201605022104538', 150501, '0', '2016-05-02', '', 3, '0', '0', '0', '100', 1, '0', '0', '0', -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (76, 21, 19, 'XS201605022105023', 150601, '9.5', '2016-05-02', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (75, 21, 19, 'XS201605022105023', 150601, '15', '2016-05-02', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (102, 22, 18, 'XS201605022238279', 150601, '9.5', '2016-05-02', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (101, 22, 18, 'XS201605022238279', 150601, '15', '2016-05-02', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (100, 22, 18, 'XS201605022238279', 150601, '15', '2016-05-02', '', 5, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (99, 22, 18, 'XS201605022238279', 150601, '1', '2016-05-02', '', 4, '1', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (73, 23, 20, 'XS201605022239250', 150601, '9.5', '2016-05-02', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (72, 23, 20, 'XS201605022239250', 150601, '15', '2016-05-02', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (71, 23, 20, 'XS201605022239250', 150601, '15', '2016-05-02', '', 5, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (87, 24, 17, 'XS201605022310118', 150601, '15', '2016-05-02', '', 5, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (86, 24, 17, 'XS201605022310118', 150601, '1', '2016-05-02', '', 4, '1', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (85, 24, 17, 'XS201605022310118', 150601, '77', '2016-05-02', '', 3, '77', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (74, 23, 20, 'XS201605022239250', 150601, '9', '2016-05-02', '', 8, '9', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (83, 25, 16, 'XS201605030143343', 150601, '15', '2016-05-03', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (82, 25, 16, 'XS201605030143343', 150601, '15', '2016-05-03', '', 5, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (81, 25, 16, 'XS201605030143343', 150601, '77', '2016-05-03', '', 3, '77', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (84, 25, 16, 'XS201605030143343', 150601, '9.5', '2016-05-03', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (88, 24, 17, 'XS201605022310118', 150601, '15', '2016-05-02', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (94, 26, 15, 'XS201605030206443', 150601, '9.5', '2016-05-03', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (93, 26, 15, 'XS201605030206443', 150601, '15', '2016-05-03', '', 6, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (92, 26, 15, 'XS201605030206443', 150601, '15', '2016-05-03', '', 5, '15', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (95, 27, 15, 'XS201605030208388', 150601, '77', '2016-05-03', '', 3, '77', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (96, 27, 15, 'XS201605030208388', 150601, '1', '2016-05-03', '', 4, '1', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (97, 27, 15, 'XS201605030208388', 150601, '9.5', '2016-05-03', '', 7, '9.5', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (98, 28, 13, 'XS201605030209108', 150601, '77', '2016-05-03', '', 3, '77', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (103, 22, 18, 'XS201605022238279', 150601, '9', '2016-05-02', '', 8, '9', '0', '0', '-1', 1, '0', '0', '0', -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (104, 31, 20, 'XS201605042240023', 150601, '9', '2016-05-04', '', 8, '9', '0', '0', '-1', 1, '0', '0', '0', 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (105, 32, 20, 'XS201605042356329', 150602, '-8.55', '2016-05-04', '', 8, '9', '0.45', '5', '1', 1, '0', '0', '0', 0, -1, 1, '銷售退貨', 0, 0, '', 'SALE', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (106, 33, 0, 'CBTZ201605050006242', 150807, '10', '2016-05-05', '', 8, '0', '0', '0', '0', 1, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (107, 34, 0, 'CBTZ201605050015496', 150807, '20', '2016-05-05', '', 8, '0', '0', '0', '0', 1, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (108, 35, 0, 'CBTZ201605050023003', 150807, '0', '2016-05-05', '', 7, '0', '0', '0', '0', 0, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (109, 36, 0, 'CBTZ201605050023347', 150807, '0', '2016-05-05', '', 7, '0', '0', '0', '0', 0, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (110, 37, 0, 'CBTZ201605050024297', 150807, '0', '2016-05-05', '', 7, '0', '0', '0', '0', 0, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (111, 38, 0, 'CBTZ201605050024370', 150807, '0', '2016-05-05', '', 5, '0', '0', '0', '0', 0, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);
INSERT INTO ci_invoice_info (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES (113, 39, 0, 'CBTZ201605050118415', 150807, '60', '2016-05-05', '', 8, '0', '0', '0', '0', 1, '0', '0', '0', 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0);


#
# TABLE STRUCTURE FOR: ci_invoice_type
#

DROP TABLE IF EXISTS ci_invoice_type;

CREATE TABLE `ci_invoice_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  `number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (1, '其他入库', 1, 1, 'in', 1, 150706);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (2, '盘盈', 1, 1, 'in', 0, 150701);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (3, '其他出库', -1, 1, 'out', 1, 150806);
INSERT INTO ci_invoice_type (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES (4, '盘亏', -1, 1, 'out', 0, 150801);


#
# TABLE STRUCTURE FOR: ci_log
#

DROP TABLE IF EXISTS ci_log;

CREATE TABLE `ci_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(25) DEFAULT '',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` text COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `loginName` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifyTime` datetime DEFAULT NULL COMMENT '写入日期',
  `operateTypeName` varchar(50) DEFAULT '',
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;

INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (1, NULL, '111.197.79.174', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-10 17:04:45', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (2, 1, '111.197.79.174', '湘小林', '密码修改成功 UID：1 真实姓名改为：模板俱乐部', 1, 'admin', '2015-09-10 17:07:45', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (3, 1, '111.197.79.174', '湘小林', '切换皮肤：blue', 1, 'admin', '2015-09-10 17:07:55', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (4, 1, '111.197.79.174', '湘小林', '系统设置成功', 1, 'admin', '2015-09-10 17:08:21', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (5, 1, '111.197.79.174', '湘小林', '系统设置成功', 1, 'admin', '2015-09-10 17:08:34', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (6, 1, '111.197.75.24', '湘小林', '登陆成功 用户名：admin', 1, 'admin', '2015-09-10 17:20:56', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (7, NULL, '111.197.75.24', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-10 17:27:08', '', '2015-09-10');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (8, NULL, '223.72.255.103', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-24 22:08:02', '', '2015-11-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (9, 1, '223.72.255.103', '模板俱乐部', '密码修改成功 UID：1 真实姓名改为：模板俱乐部', 1, 'admin', '2015-11-24 22:09:02', '', '2015-11-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (10, NULL, '223.72.255.103', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-24 22:09:17', '', '2015-11-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (11, 1, '192.168.72.1', '模板俱乐部', '登陆成功 用户名：admin', 1, 'admin', '2010-06-08 22:42:53', '', '2010-06-08');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (12, NULL, '192.168.72.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2010-06-08 22:47:08', '', '2010-06-08');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (13, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：default', 1, 'admin', '2010-06-08 23:23:03', '', '2010-06-08');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (14, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：blue', 1, 'admin', '2010-06-08 23:23:47', '', '2010-06-08');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (15, 1, '192.168.72.1', '模板俱乐部', '新增供应商类别:厂家', 1, 'admin', '2010-06-09 00:15:36', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (16, 1, '192.168.72.1', '模板俱乐部', '新增客户:中顺洁柔', 1, 'admin', '2010-06-09 00:16:53', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (17, 1, '192.168.72.1', '模板俱乐部', '新增仓库:总仓', 1, 'admin', '2010-06-09 00:17:46', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (18, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090018020', 1, 'admin', '2010-06-09 00:18:02', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (19, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090018093', 1, 'admin', '2010-06-09 00:18:09', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (20, 1, '192.168.72.1', '模板俱乐部', '新增单位:条', 1, 'admin', '2010-06-09 00:18:39', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (21, 1, '192.168.72.1', '模板俱乐部', '新增单位:包', 1, 'admin', '2010-06-09 00:18:58', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (22, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090019165', 1, 'admin', '2010-06-09 00:19:16', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (23, 1, '192.168.72.1', '模板俱乐部', '新增商品类别:生活用品', 1, 'admin', '2010-06-09 00:20:24', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (24, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：green', 1, 'admin', '2010-06-09 00:29:32', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (25, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 00:49:27', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (26, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 00:50:13', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (27, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 02:04:41', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (28, 1, '192.168.72.1', '模板俱乐部', '新增商品:C&S', 1, 'admin', '2010-06-09 02:25:00', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (29, 1, '192.168.72.1', '模板俱乐部', '启用:ID:1', 1, 'admin', '2010-06-09 02:26:00', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (30, 1, '192.168.72.1', '模板俱乐部', '修改商品:ID=1名称:C&S法柔国际版', 1, 'admin', '2010-06-09 02:27:26', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (31, 1, '192.168.72.1', '模板俱乐部', '启用:ID:1', 1, 'admin', '2010-06-09 02:27:31', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (32, 1, '192.168.72.1', '模板俱乐部', '修改商品:ID=1名称:C&S法柔国际版', 1, 'admin', '2010-06-09 02:28:09', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (33, 1, '192.168.72.1', '模板俱乐部', '新增商品:C&S可湿水面纸', 1, 'admin', '2010-06-09 02:30:18', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (34, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090019165', 1, 'admin', '2010-06-09 02:33:23', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (35, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090018093', 1, 'admin', '2010-06-09 02:33:26', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (36, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090018020', 1, 'admin', '2010-06-09 02:33:29', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (37, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090236073', 1, 'admin', '2010-06-09 02:36:07', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (38, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2010-06-09 03:29:48', '', '2010-06-09');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (39, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-21 23:13:19', '', '2016-01-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (40, 1, '192.168.72.1', '模板俱乐部', '密码修改成功 UID：1 真实姓名改为：系統管理員', 1, 'admin', '2016-01-21 23:20:28', '', '2016-01-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (41, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-22 00:08:52', '', '2016-01-22');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (42, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-23 15:04:05', '', '2016-01-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (43, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-01-23 15:09:57', '', '2016-01-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (44, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-23 15:10:05', '', '2016-01-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (45, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-23 15:10:12', '', '2016-01-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (46, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-25 01:25:25', '', '2016-01-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (47, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 21:59:25', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (48, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:20:29', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (49, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:24:51', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (50, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:24:56', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (51, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:25:03', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (52, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-01-26 23:25:08', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (53, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:25:22', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (54, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:25:27', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (55, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:25:36', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (56, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:27:34', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (57, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:27:41', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (58, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:28:26', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (59, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:29:59', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (60, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:45:30', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (61, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:45:46', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (62, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:45:51', '', '2016-01-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (63, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-29 01:00:31', '', '2016-01-29');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (64, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-29 01:00:51', '', '2016-01-29');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (65, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-29 01:01:03', '', '2016-01-29');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (66, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-29 01:15:44', '', '2016-01-29');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (67, 1, '192.168.72.1', '系統管理員', '新增客户类别:祐漢', 1, 'admin', '2016-01-31 21:59:19', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (68, 1, '192.168.72.1', '系統管理員', '新增客户类别:筷子基', 1, 'admin', '2016-01-31 21:59:32', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (69, 1, '192.168.72.1', '系統管理員', '新增客户类别:三盞燈', 1, 'admin', '2016-01-31 22:00:14', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (70, 1, '192.168.72.1', '系統管理員', '新增客户类别:台山', 1, 'admin', '2016-01-31 22:00:21', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (71, 1, '192.168.72.1', '系統管理員', '新增客户类别:中區 新口岸', 1, 'admin', '2016-01-31 22:00:45', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (72, 1, '192.168.72.1', '系統管理員', '新增客户类别:氹仔', 1, 'admin', '2016-01-31 22:01:24', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (73, 1, '192.168.72.1', '系統管理員', '新增供应商:新記', 1, 'admin', '2016-01-31 22:06:08', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (74, 1, '192.168.72.1', '系統管理員', '新增结算方式:即付', 1, 'admin', '2016-01-31 22:10:54', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (75, 1, '192.168.72.1', '系統管理員', '新增结算方式:月結', 1, 'admin', '2016-01-31 22:10:59', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (76, 1, '192.168.72.1', '系統管理員', '导出客户:customer_20160131221338.xls', 1, 'admin', '2016-01-31 22:13:38', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (77, 1, '192.168.72.1', '系統管理員', '新增用户:kychan', 1, 'admin', '2016-01-31 22:24:31', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (78, 1, '192.168.72.1', '系統管理員', '更新权限:kychan', 1, 'admin', '2016-01-31 22:26:35', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (79, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：kychan', 1, NULL, '2016-01-31 22:26:56', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (80, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-31 23:19:25', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (81, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-31 23:35:32', '', '2016-01-31');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (82, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-01 21:32:15', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (83, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:17:58', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (84, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-01 22:18:13', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (85, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:18:26', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (86, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-01 22:18:37', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (87, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:19:05', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (88, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-01 22:19:19', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (89, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:21:41', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (90, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-01 23:06:07', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (91, 1, '192.168.72.1', '系統管理員', '系统设置成功', 1, 'admin', '2016-02-01 23:19:27', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (92, 1, '192.168.72.1', '系統管理員', '系统设置成功', 1, 'admin', '2016-02-01 23:20:22', '', '2016-02-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (93, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-02 21:33:12', '', '2016-02-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (94, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-02 23:06:14', '', '2016-02-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (95, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-03 23:10:01', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (96, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-03 23:10:48', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (97, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-03 23:10:57', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (98, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-03 23:11:09', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (99, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-03 23:11:16', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (100, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-03 23:26:17', '', '2016-02-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (101, 1, '192.168.72.1', '系統管理員', '新增购货 单据编号：CG201603152118516', 1, 'admin', '2016-03-15 21:18:52', '', '2016-03-15');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (102, 1, '192.168.72.1', '系統管理員', '新增销货 单据编号：XS201603152133541', 1, 'admin', '2016-03-15 21:33:54', '', '2016-03-15');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (103, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-16 23:00:36', '', '2016-03-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (104, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-17 22:43:46', '', '2016-03-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (105, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-18 23:43:01', '', '2016-03-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (106, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-18 23:43:24', '', '2016-03-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (107, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-03-19 00:52:03', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (108, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 00:52:16', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (109, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 00:52:35', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (110, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 00:52:50', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (111, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 00:53:14', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (112, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 01:48:18', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (113, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 01:48:28', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (114, 1, '192.168.72.1', '系統管理員', '修改供应商:榮譽', 1, 'admin', '2016-03-19 12:04:41', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (115, 1, '192.168.72.1', '系統管理員', '修改供应商:榮譽', 1, 'admin', '2016-03-19 12:06:37', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (116, 1, '192.168.72.1', '系統管理員', '新增供应商:花蓮一品香', 1, 'admin', '2016-03-19 12:07:27', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (117, 1, '192.168.72.1', '系統管理員', '新增供应商:周根記', 1, 'admin', '2016-03-19 12:07:52', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (118, 1, '192.168.72.1', '系統管理員', '新增供应商:順德建華', 1, 'admin', '2016-03-19 12:08:18', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (119, 1, '192.168.72.1', '系統管理員', '新增供应商:齊歡樂', 1, 'admin', '2016-03-19 12:08:44', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (120, 1, '192.168.72.1', '系統管理員', '新增供应商:002美食', 1, 'admin', '2016-03-19 12:09:26', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (121, 1, '192.168.72.1', '系統管理員', '新增供应商:002美食', 1, 'admin', '2016-03-19 12:09:41', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (122, 1, '192.168.72.1', '系統管理員', '新增供应商:其記（鋪）', 1, 'admin', '2016-03-19 12:10:03', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (123, 1, '192.168.72.1', '系統管理員', '新增供应商:其記（街市）', 1, 'admin', '2016-03-19 12:10:39', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (124, 1, '192.168.72.1', '系統管理員', '新增供应商:牛記', 1, 'admin', '2016-03-19 12:12:42', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (125, 1, '192.168.72.1', '系統管理員', '新增供应商:皇子', 1, 'admin', '2016-03-19 12:12:50', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (126, 1, '192.168.72.1', '系統管理員', '新增供应商:肥佬', 1, 'admin', '2016-03-19 12:13:01', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (127, 1, '192.168.72.1', '系統管理員', '新增供应商:麵店王', 1, 'admin', '2016-03-19 12:13:17', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (128, 1, '192.168.72.1', '系統管理員', '新增供应商:好連來', 1, 'admin', '2016-03-19 12:13:27', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (129, 1, '192.168.72.1', '系統管理員', '新增供应商:耀發', 1, 'admin', '2016-03-19 12:13:42', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (130, 1, '192.168.72.1', '系統管理員', '新增供应商:廣豐', 1, 'admin', '2016-03-19 12:13:57', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (131, 1, '192.168.72.1', '系統管理員', '新增供应商:利盛', 1, 'admin', '2016-03-19 12:14:34', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (132, 1, '192.168.72.1', '系統管理員', '新增供应商:金豐', 1, 'admin', '2016-03-19 12:14:48', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (133, 1, '192.168.72.1', '系統管理員', '新增供应商:泰豐', 1, 'admin', '2016-03-19 12:15:22', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (134, 1, '192.168.72.1', '系統管理員', '导出客户:customer_20160319143232.xls', 1, 'admin', '2016-03-19 14:32:32', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (135, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319190259.xls', 1, 'admin', '2016-03-19 19:02:59', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (136, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319191244.xls', 1, 'admin', '2016-03-19 19:12:44', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (137, 1, '192.168.72.1', '系統管理員', '系統登入成功，賬戶名：admin', 1, 'admin', '2016-03-19 23:22:53', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (138, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319232748.xls', 1, 'admin', '2016-03-19 23:27:48', '', '2016-03-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (139, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160320000923.xls', 1, 'admin', '2016-03-20 00:09:23', '', '2016-03-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (140, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-23 23:18:55', '', '2016-03-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (141, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-23 23:19:48', '', '2016-03-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (142, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-05 00:22:11', '', '2016-04-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (143, 1, '192.168.72.1', '系統管理員', '系統參數設置完成', 1, 'admin', '2016-04-05 00:24:21', '', '2016-04-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (144, 1, '192.168.72.1', '系統管理員', '修改销货 单据编号：XS201603152133541', 1, 'admin', '2016-04-05 22:55:10', '', '2016-04-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (145, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 13:43:20', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (146, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 14:38:07', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (147, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 14:47:03', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (148, 1, '::1', '系統管理員', '新增销货 单据编号：XS201604121450524', 1, 'admin', '2016-04-12 14:50:52', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (149, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 15:03:39', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (150, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 16:09:39', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (151, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 14:23:51', '', '2016-04-13');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (152, 1, '192.168.1.104', '系統管理員', '启用:ID:20', 1, 'admin', '2016-04-12 23:58:44', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (153, 1, '192.168.1.104', '系統管理員', '启用:ID:20', 1, 'admin', '2016-04-12 23:58:50', '', '2016-04-12');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (154, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 00:04:10', '', '2016-04-13');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (155, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 23:52:46', '', '2016-04-13');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (156, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 23:57:14', '', '2016-04-13');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (157, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-14 23:50:03', '', '2016-04-14');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (158, 1, '192.168.1.104', '系統管理員', '新增员工:编号A1 名称Jordon', 1, 'admin', '2016-04-14 23:50:42', '', '2016-04-14');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (159, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-15 22:39:02', '', '2016-04-15');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (160, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 00:02:34', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (161, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 17:08:21', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (162, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:27:51', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (163, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:36:36', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (164, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:36:43', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (165, 1, '192.168.1.104', '系統管理員', '新增购货 单据编号：CG201604162146162', 1, 'admin', '2016-04-16 21:46:16', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (166, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 21:54:05', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (167, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:58:20', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (168, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:58:41', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (169, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 22:48:31', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (170, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162248453', 1, 'admin', '2016-04-16 22:48:45', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (171, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162250354', 1, 'admin', '2016-04-16 22:50:35', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (172, 1, '192.168.1.104', '系統管理員', '新增购货 单据编号：CG201604162253084', 1, 'admin', '2016-04-16 22:53:08', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (173, 1, '192.168.1.104', '系統管理員', '新增账户:01現金', 1, 'admin', '2016-04-16 23:06:50', '', '2016-04-16');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (174, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 01:04:37', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (175, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 01:05:14', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (176, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 15:21:09', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (177, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 21:17:48', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (178, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 21:20:00', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (179, 1, '192.168.1.104', '系統管理員', '新增用户:zhhuaspace', 1, 'admin', '2016-04-17 21:37:45', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (180, 1, '192.168.1.104', '系統管理員', '新增用户:test', 1, 'admin', '2016-04-17 22:19:59', '', '2016-04-17');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (181, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 00:05:30', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (182, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 00:37:33', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (183, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:25:21', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (184, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:26:48', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (185, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:37:10', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (186, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 01:37:23', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (187, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:55:04', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (188, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 02:03:33', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (189, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 20:43:55', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (190, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 23:13:35', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (191, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 23:30:14', '', '2016-04-18');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (192, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:33:55', '', '2016-04-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (193, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:44:39', '', '2016-04-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (194, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:50:00', '', '2016-04-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (195, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 20:00:06', '', '2016-04-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (196, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 23:27:43', '', '2016-04-19');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (197, 1, '192.168.1.104', '系統管理員', '导出盘点单据:pdReport_20160420002144.xls', 1, 'admin', '2016-04-20 00:21:44', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (198, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:28:48', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (199, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:56:12', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (200, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:57:17', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (201, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:00:31', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (202, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:36:01', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (203, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:59:27', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (204, 1, '192.168.1.104', '系統管理員', '新增其他入库 单据编号：QTRK201604202245450', 1, 'admin', '2016-04-20 22:45:45', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (205, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604202258338', 1, 'admin', '2016-04-20 22:58:33', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (206, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 23:00:24', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (207, 1, '192.168.1.104', '系統管理員', '新增其他出库 单据编号：QTCK201604202349174', 1, 'admin', '2016-04-20 23:49:17', '', '2016-04-20');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (208, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 20:26:06', '', '2016-04-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (209, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 20:31:31', '', '2016-04-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (210, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 21:27:12', '', '2016-04-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (211, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 21:34:22', '', '2016-04-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (212, 1, '192.168.1.104', '系統管理員', '采购明细表导出:pu_detail_20160421222513.xls', 1, 'admin', '2016-04-21 22:25:13', '', '2016-04-21');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (213, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-22 21:04:37', '', '2016-04-22');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (214, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-23 03:11:57', '', '2016-04-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (215, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-23 14:11:18', '', '2016-04-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (216, 1, '192.168.1.104', '系統管理員', '修改结算方式:現付', 1, 'admin', '2016-04-23 15:22:20', '', '2016-04-23');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (217, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604240200546', 1, 'admin', '2016-04-24 02:00:54', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (218, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-24 22:56:50', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (219, 1, '192.168.1.104', '系統管理員', '新增单位:磅', 1, 'admin', '2016-04-24 23:38:38', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (220, 1, '192.168.1.104', '系統管理員', '新增商品:肉燕皮', 1, 'admin', '2016-04-24 23:38:46', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (221, 1, '192.168.1.104', '系統管理員', '更新仓库:總倉', 1, 'admin', '2016-04-24 23:43:11', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (222, 1, '192.168.1.104', '系統管理員', '修改商品:ID=3名称:肉燕皮', 1, 'admin', '2016-04-24 23:44:05', '', '2016-04-24');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (223, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-25 22:21:46', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (224, 1, '192.168.1.105', '系統管理員', '修改类别:ID=2 名称:麪粉', 1, 'admin', '2016-04-25 22:34:59', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (225, 1, '192.168.1.105', '系統管理員', '新增商品:皂角米', 1, 'admin', '2016-04-25 22:39:24', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (226, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋麵（幼）', 1, 'admin', '2016-04-25 22:48:04', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (227, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋生麵（粗）（明）', 1, 'admin', '2016-04-25 23:06:04', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (228, 1, '192.168.1.105', '系統管理員', '新增商品:炒麵（扁炒麵）', 1, 'admin', '2016-04-25 23:10:41', '', '2016-04-25');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (229, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋伊麵', 1, 'admin', '2016-04-26 00:18:18', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (230, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:26', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (231, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:31', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (232, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:33', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (233, 1, '192.168.1.105', '系統管理員', '啓用:ID:1', 1, 'admin', '2016-04-26 00:40:12', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (234, 1, '192.168.1.105', '系統管理員', '啓用:ID:1', 1, 'admin', '2016-04-26 00:40:15', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (235, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-26 21:14:01', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (236, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:17:21', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (237, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:17:46', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (238, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:20:11', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (239, 1, '192.168.1.105', '系統管理員', '編輯供應商：金豐', 1, 'admin', '2016-04-26 22:20:34', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (240, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-26 23:33:48', '', '2016-04-26');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (241, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-27 22:13:43', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (242, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-27 22:18:34', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (243, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:29:52', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (244, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:30:02', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (245, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:56:38', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (246, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:56:46', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (247, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:09:22', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (248, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:17:40', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (249, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:18:14', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (250, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:20:28', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (251, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:30:39', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (252, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:30:52', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (253, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:31:56', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (254, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:33:22', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (255, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:26', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (256, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:45', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (257, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:53', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (258, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:54:09', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (259, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:56:15', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (260, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-27 23:56:35', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (261, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-27 23:56:43', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (262, 1, '192.168.1.105', '系統管理員', '新增商品类别:123', 1, 'admin', '2016-04-27 23:58:00', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (263, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-04-27 23:58:06', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (264, 1, '192.168.1.105', '系統管理員', '新增供应商类别:載', 1, 'admin', '2016-04-27 23:58:34', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (265, 1, '192.168.1.105', '系統管理員', '删除供应商类别:ID=12 名称:載', 1, 'admin', '2016-04-27 23:58:42', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (266, 1, '192.168.1.105', '系統管理員', '删除供应商类别:ID=12 名称:載', 1, 'admin', '2016-04-27 23:59:03', '', '2016-04-27');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (267, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-28 23:52:52', '', '2016-04-28');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (268, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201604290041402', 1, 'admin', '2016-04-29 00:41:40', '', '2016-04-29');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (269, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-30 22:22:10', '', '2016-04-30');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (270, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-01 09:20:13', '', '2016-05-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (271, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605010920543', 1, 'admin', '2016-05-01 09:20:54', '', '2016-05-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (272, 1, '192.168.1.105', '系統管理員', '系統登入成功，賬戶名：admin', 1, 'admin', '2016-05-01 09:32:56', '', '2016-05-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (273, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-01 22:28:06', '', '2016-05-01');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (274, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201604121450524', 1, 'admin', '2016-05-02 01:35:01', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (275, 1, '192.168.1.105', '系統管理員', '新增客戶：乐華麪粉廠', 1, 'admin', '2016-05-02 21:04:03', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (276, 1, '192.168.1.105', '系統管理員', '新增购货 单据编号：CG201605022104538', 1, 'admin', '2016-05-02 21:04:53', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (277, 1, '192.168.1.105', '系統管理員', '新增销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-02 21:05:02', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (278, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022238279', 1, 'admin', '2016-05-02 22:38:27', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (279, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022239250', 1, 'admin', '2016-05-02 22:39:25', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (280, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022310118', 1, 'admin', '2016-05-02 23:10:11', '', '2016-05-02');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (281, 1, '192.168.1.105', '系統管理員', '修改购货单 单据编号：CG201605022104538', 1, 'admin', '2016-05-03 00:14:09', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (282, 1, '192.168.1.105', '系統管理員', '修改购货单 单据编号：CG201605022104538', 1, 'admin', '2016-05-03 00:15:56', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (283, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 00:48:26', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (284, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:30:23', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (285, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:38:16', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (286, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022239250', 1, 'admin', '2016-05-03 01:41:28', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (287, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:42:14', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (288, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030143343', 1, 'admin', '2016-05-03 01:43:34', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (289, 1, '192.168.1.105', '系統管理員', '更新仓库:默認倉', 1, 'admin', '2016-05-03 01:43:56', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (290, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605030143343', 1, 'admin', '2016-05-03 01:49:21', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (291, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022310118', 1, 'admin', '2016-05-03 01:49:51', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (292, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030206443', 1, 'admin', '2016-05-03 02:06:44', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (293, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605030206443', 1, 'admin', '2016-05-03 02:08:18', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (294, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030208388', 1, 'admin', '2016-05-03 02:08:38', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (295, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030209108', 1, 'admin', '2016-05-03 02:09:10', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (296, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-03 21:01:55', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (297, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022238279', 1, 'admin', '2016-05-03 22:41:59', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (298, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605032344085', 1, 'admin', '2016-05-03 23:44:08', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (299, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605032344217', 1, 'admin', '2016-05-03 23:44:21', '', '2016-05-03');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (300, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-04 22:13:36', '', '2016-05-04');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (301, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605042240023', 1, 'admin', '2016-05-04 22:40:02', '', '2016-05-04');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (302, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605042356329', 1, 'admin', '2016-05-04 23:56:32', '', '2016-05-04');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (303, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-04 23:57:50', '', '2016-05-04');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (304, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050006242', 1, 'admin', '2016-05-05 00:06:24', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (305, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050015496', 1, 'admin', '2016-05-05 00:15:49', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (306, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050023003', 1, 'admin', '2016-05-05 00:23:00', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (307, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050023347', 1, 'admin', '2016-05-05 00:23:34', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (308, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050024297', 1, 'admin', '2016-05-05 00:24:29', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (309, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050024370', 1, 'admin', '2016-05-05 00:24:37', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (310, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050118415', 1, 'admin', '2016-05-05 01:18:41', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (311, 1, '192.168.1.105', '系統管理員', '修改成本调整 单据编号：CBTZ201605050118415', 1, 'admin', '2016-05-05 01:26:12', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (312, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605050128303', 1, 'admin', '2016-05-05 01:28:30', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (313, 1, '192.168.1.105', '系統管理員', '編輯客戶：乐華麪粉廠', 1, 'admin', '2016-05-05 01:49:47', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (314, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-05-05 02:11:48', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (315, 1, '192.168.1.105', '系統管理員', '編輯客戶：乐華麪粉廠', 1, 'admin', '2016-05-05 02:12:16', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (316, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:14:14', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (317, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:16:51', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (318, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:19:20', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (319, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:22:11', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (320, 1, '192.168.1.105', '系統管理員', '修改类别:ID=11 名称:1234', 1, 'admin', '2016-05-05 02:26:14', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (321, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:1234', 1, 'admin', '2016-05-05 02:27:57', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (322, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-05 22:12:20', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (323, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-05 22:22:46', '', '2016-05-05');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (324, NULL, '192.168.1.100', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:25:25', '', '2016-05-06');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (325, NULL, '192.168.1.101', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:50:18', '', '2016-05-06');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (326, NULL, '192.168.1.101', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:50:49', '', '2016-05-06');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (327, NULL, '192.168.1.100', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:54:00', '', '2016-05-06');
INSERT INTO ci_log (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES (328, NULL, '127.0.0.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:54:45', '', '2016-05-06');


#
# TABLE STRUCTURE FOR: ci_menu
#

DROP TABLE IF EXISTS ci_menu;

CREATE TABLE `ci_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(5) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` smallint(6) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(1) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (1, ' 入貨單', 0, '', 1, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (2, '新增', 1, '1,2', 2, 1, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (3, '修改', 1, '1,3', 2, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (4, '刪除', 1, '1,4', 2, 3, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (5, '導出', 1, '1,5', 2, 4, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (6, '出貨單', 0, '6', 1, 1, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (7, '新增', 6, '6,7', 2, 1, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (8, '修改', 6, '6,8', 2, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (9, '刪除', 6, '6,9', 2, 3, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (10, '導出', 6, '6,10', 2, 4, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (11, '盤點', 0, '11', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (12, '生成盤點記錄', 11, '11,12', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (13, '導出', 11, '11,13', 2, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (14, '其他入庫單', 0, '14', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (15, '新增', 14, '14,15', 2, 1, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (16, '修改', 14, '14,16', 2, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (17, '刪除', 14, '14,17', 2, 3, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (18, '其他出庫單', 0, '18', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (19, '新增', 18, '18,19', 2, 1, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (20, '修改', 18, '18,20', 2, 2, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (21, '刪除', 18, '18,21', 2, 3, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (22, '入貨明細表', 0, '22', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (23, '導出', 22, '22,23', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (24, '列印', 22, '22,24', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (25, '入貨匯總表（按商品）', 0, '25', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (26, '導出', 25, '25,26', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (27, '列印', 25, '25,27', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (28, '入貨匯總表（按供應商）', 0, '28', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (29, '導出 ', 28, '28,29', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (30, '列印', 28, '28,30', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (31, '出貨明細表', 0, '31', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (32, '導出 ', 31, '31,32', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (33, '列印', 31, '31,33', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (34, '出貨匯總表（按商品）', 0, '34', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (35, '導出 ', 34, '34,35', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (36, '列印', 34, '34,36', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (37, '出貨匯總表（按客戶）', 0, '37', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (38, '導出 ', 37, '37,38', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (39, '列印', 37, '37,39', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (40, '商品庫存餘額表', 0, '40', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (41, '導出 ', 40, '40,41', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (42, '列印', 40, '40,42', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (43, '商品出入明細表', 0, '43', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (44, '導出 ', 43, '43,44', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (45, '列印', 43, '43,45', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (46, '商品出入匯總表', 0, '46', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (47, '導出 ', 46, '46,47', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (48, '列印', 46, '46,48', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (49, '來往單位欠款表', 0, '49', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (50, '導出 ', 49, '49,50', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (51, '列印', 49, '49,51', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (52, '應付賬款明細表', 0, '52', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (53, '導出 ', 52, '52,53', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (54, '列印', 52, '52,54', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (55, '應收賬款明細表', 0, '55', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (56, '導出 ', 55, '55,56', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (57, '列印', 55, '55,57', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (58, '客戶管理', 0, '58', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (59, '新增', 58, '58,59', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (60, '修改', 58, '58,60', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (61, '删除', 58, '58,61', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (62, '導出 ', 58, '58,62', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (63, '供應商管理', 0, '63', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (64, '新增', 63, '63,64', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (65, '修改', 63, '63,65', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (66, '删除', 63, '63,66', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (67, '導出 ', 63, '63,67', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (68, '商品管理', 0, '68', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (69, '新增', 68, '68,69', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (70, '修改', 68, '68,70', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (71, '删除', 68, '68,71', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (72, '導出 ', 68, '68,72', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (73, '客戶分類', 0, '73', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (74, '新增', 73, '73,74', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (75, '修改', 73, '73,75', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (76, '删除', 73, '73,76', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (77, '計量單元', 0, '77', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (78, '新增', 77, '77,78', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (79, '修改', 77, '77,79', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (80, '删除', 77, '77,80', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (81, '系統參數', 0, '81', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (82, '管理權限', 0, '82', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (83, '操作日誌', 0, '83', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (84, '數據備份', 0, '84', 1, 99, 0, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (85, '列印', 1, '1,85', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (86, '審覈', 1, '1,86', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (87, '反審覈', 1, '1,87', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (88, '列印', 6, '6,88', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (89, '審覈', 6, '6,89', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (90, '反審覈', 6, '6,90', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (91, '停用', 58, '58,91', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (92, '啓用', 58, '58,92', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (93, '停用', 63, '63,93', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (94, '啓用', 63, '63,94', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (95, '停用', 68, '68,95', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (96, '啓用', 68, '68,96', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (97, '職員管理', 0, '97', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (98, '資金戶口', 0, '98', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (99, '導入', 11, '11,99', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (100, '審覈', 14, '14,100', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (101, '反審覈', 14, '14,101', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (102, '導出 ', 14, '14,102', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (103, '審覈', 18, '18,103', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (104, '反審覈', 18, '18,104', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (105, '導出 ', 18, '18,105', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (106, '現金銀行報表', 0, '106', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (107, '列印', 106, '106,107', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (108, '導出 ', 106, '106,108', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (109, '客戶對賬單', 0, '109', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (110, '列印', 109, '109,110', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (111, '導出 ', 109, '109,111', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (112, '供應商對賬單', 0, '112', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (113, '列印', 112, '112,113', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (114, '導出 ', 112, '112,114', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (115, '其他收支明細表', 0, '115', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (116, '列印', 115, '115,116', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (117, '導出 ', 115, '115,117', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (118, '新增', 97, '97,118', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (119, '修改', 97, '97,119', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (120, '删除', 97, '97,120', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (121, '新增', 98, '98,121', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (122, '修改', 98, '98,122', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (123, '删除', 98, '98,123', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (124, '收款單', 0, '124', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (125, '新增', 124, '124,125', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (126, '修改', 124, '124,126', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (127, '删除', 124, '124,127', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (128, '導出 ', 124, '124,128', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (129, '付款單', 0, '129', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (130, '新增', 129, '129,130', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (131, '修改', 129, '129,131', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (132, '删除', 129, '129,132', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (133, '導出 ', 129, '129,133', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (134, '其他收入單', 0, '134', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (135, '新增', 134, '134,135', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (136, '修改', 134, '134,136', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (137, '删除', 134, '134,137', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (138, '導出 ', 134, '134,138', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (139, '其他支出單', 0, '139', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (140, '新增', 139, '139,140', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (141, '修改', 139, '139,141', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (142, '删除', 139, '139,142', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (143, '導出 ', 139, '139,143', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (144, '調撥單', 0, '144', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (145, '新增', 144, '144,145', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (146, '修改', 144, '144,146', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (147, '删除', 144, '144,147', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (148, '導出 ', 144, '144,148', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (149, '初始化數據', 0, '149', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (151, '成本調整單', 0, '151', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (152, '新增', 151, '151,152', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (153, '修改', 151, '151,153', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (154, '删除', 151, '151,154', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (155, '倉庫管理', 0, '155', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (156, '新增', 155, '155,156', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (157, '修改', 155, '155,157', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (158, '删除', 155, '155,158', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (159, '結算方式', 0, '159', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (160, '新增', 159, '159,160', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (161, '修改', 159, '159,161', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (162, '删除', 159, '159,162', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (163, '供應商分類', 0, '163', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (164, '新增', 163, '163,164', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (165, '修改', 163, '163,165', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (166, '删除', 163, '163,166', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (167, '商品分類', 0, '167', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (168, '新增', 167, '167,168', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (169, '修改', 167, '167,169', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (170, '删除', 167, '167,170', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (171, '支出分類', 0, '171', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (172, '新增', 171, '171,172', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (173, '修改', 171, '171,173', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (174, '删除', 171, '171,174', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (175, '收入分類', 0, '175', 1, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (176, '新增', 175, '175,176', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (177, '修改', 175, '175,177', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (178, '删除', 175, '175,178', 2, 99, 1, 'trade', 1, 0, 0, '');
INSERT INTO ci_menu (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES (179, '列印', 144, '144,179', 2, 99, 1, 'trade', 1, 0, 0, '');


#
# TABLE STRUCTURE FOR: ci_options
#

DROP TABLE IF EXISTS ci_options;

CREATE TABLE `ci_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (1, 'system', 'a:10:{s:11:\"companyName\";s:15:\"興利製麵家\";s:11:\"companyAddr\";s:56:\"澳門黑沙環大馬路黑沙灣巷發利工業大廈2B\";s:5:\"phone\";s:8:\"28517703\";s:3:\"fax\";s:8:\"28403939\";s:8:\"postcode\";s:0:\"\";s:9:\"qtyPlaces\";s:1:\"1\";s:11:\"pricePlaces\";s:1:\"1\";s:12:\"amountPlaces\";s:1:\"2\";s:10:\"valMethods\";s:13:\"movingAverage\";s:18:\"requiredCheckStore\";s:1:\"1\";}', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (2, 'sales', 's:3893:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":60,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"nameExt\":\"<span id=\\\"barCodeInsert\\\">掃描槍錄入</span>\",\"width\":300,\"classes\":\"goods\",\"editable\":true,\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"属性ID\",\"hidden\":true,\"defLabel\":\"属性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"属性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"属性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位Id\",\"hidden\":true,\"defLabel\":\"單位Id\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保質期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保質期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期至\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期至\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"銷售單價\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"銷售單價\",\"defhidden\":false},{\"name\":\"discountRate\",\"label\":\"折扣率(%)\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"integer\",\"editable\":true,\"defLabel\":\"折扣率(%)\",\"defhidden\":false},{\"name\":\"deduction\",\"label\":\"折扣額\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"折扣額\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"銷售金額\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"銷售金額\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"},{\"name\":\"srcOrderEntryId\",\"label\":\"源分錄單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源分錄單ID\",\"defhidden\":true},{\"name\":\"srcOrderId\",\"label\":\"源單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單ID\",\"defhidden\":true},{\"name\":\"srcOrderNo\",\"label\":\"源單號\",\"width\":120,\"fixed\":true,\"hidden\":true,\"defLabel\":\"源單號\",\"defhidden\":true}],\"colModel\":[[\"operating\",\" \",null,60],[\"goods\",\"商品\",null,300],[\"skuId\",\"属性ID\",true,null],[\"skuName\",\"属性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位Id\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保質期(天)\",true,90],[\"validDate\",\"有效期至\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"銷售單價\",false,100],[\"discountRate\",\"折扣率(%)\",false,70],[\"deduction\",\"折扣額\",false,70],[\"amount\",\"銷售金額\",false,100],[\"description\",\"備註\",null,150],[\"srcOrderEntryId\",\"源分錄單ID\",true,0],[\"srcOrderId\",\"源單ID\",true,0],[\"srcOrderNo\",\"源單號\",true,120]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (3, 'purchase', 's:3815:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":60,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"nameExt\":\"<span id=\\\"barCodeInsert\\\">掃描槍錄入</span>\",\"width\":300,\"classes\":\"goods\",\"editable\":true,\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"屬性ID\",\"hidden\":true,\"defLabel\":\"屬性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"屬性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"屬性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位Id\",\"hidden\":true,\"defLabel\":\"單位Id\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保持期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保持期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"入貨單價\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"入貨單價\",\"defhidden\":false},{\"name\":\"discountRate\",\"label\":\"折扣率(%)\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"integer\",\"editable\":true,\"defLabel\":\"折扣率(%)\",\"defhidden\":false},{\"name\":\"deduction\",\"label\":\"折扣額\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"折扣額\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"入貨金額\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"入貨金額\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"},{\"name\":\"srcOrderEntryId\",\"label\":\"源單分錄ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單分錄ID\",\"defhidden\":true},{\"name\":\"srcOrderId\",\"label\":\"源單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單ID\",\"defhidden\":true},{\"name\":\"srcOrderNo\",\"label\":\"源單號\",\"width\":120,\"fixed\":true,\"hidden\":true,\"defLabel\":\"源單號\",\"defhidden\":true}],\"colModel\":[[\"operating\",\" \",null,60],[\"goods\",\"商品\",null,300],[\"skuId\",\"屬性ID\",true,null],[\"skuName\",\"屬性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位Id\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保持期(天)\",true,90],[\"validDate\",\"有效期\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"入貨單價\",false,100],[\"discountRate\",\"折扣率(%)\",false,70],[\"deduction\",\"折扣額\",false,70],[\"amount\",\"入貨金額\",false,100],[\"description\",\"備註\",null,150],[\"srcOrderEntryId\",\"源單分錄ID\",true,0],[\"srcOrderId\",\"源單ID\",true,0],[\"srcOrderNo\",\"源單號\",true,120]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (4, 'transfers', 's:2702:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":40,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"width\":318,\"title\":false,\"classes\":\"goods\",\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"属性ID\",\"hidden\":true,\"defLabel\":\"属性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"属性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"属性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"单位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"单位\"},{\"name\":\"unitId\",\"label\":\"单位Id\",\"hidden\":true,\"defLabel\":\"单位Id\",\"defhidden\":true},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生产日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生产日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保质期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保质期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期至\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期至\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"数量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":4},\"editable\":true,\"defLabel\":\"数量\"},{\"name\":\"outLocationName\",\"label\":\"调出仓库\",\"nameExt\":\"<small id=\\\"batch-storageA\\\">(批量)</small>\",\"sortable\":false,\"width\":100,\"title\":true,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"调出仓库\"},{\"name\":\"inLocationName\",\"label\":\"调入仓库\",\"nameExt\":\"<small id=\\\"batch-storageB\\\">(批量)</small>\",\"width\":100,\"title\":true,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"调入仓库\"},{\"name\":\"description\",\"label\":\"备注\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"备注\"}],\"colModel\":[[\"operating\",\" \",null,40],[\"goods\",\"商品\",null,318],[\"skuId\",\"属性ID\",true,null],[\"skuName\",\"属性\",true,100],[\"mainUnit\",\"单位\",null,80],[\"unitId\",\"单位Id\",true,null],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生产日期\",true,90],[\"safeDays\",\"保质期(天)\",true,90],[\"validDate\",\"有效期至\",true,90],[\"qty\",\"数量\",null,80],[\"outLocationName\",\"调出仓库\",null,100],[\"inLocationName\",\"调入仓库\",null,100],[\"description\",\"备注\",null,150]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (5, 'otherWarehouse', 's:2906:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":40,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"width\":320,\"title\":true,\"classes\":\"goods\",\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"屬性ID\",\"hidden\":true,\"defLabel\":\"屬性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"屬性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"屬性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位ID\",\"hidden\":true,\"defLabel\":\"單位ID\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"title\":true,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保持期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保持期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期到\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期到\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"入庫單價\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"入庫單價\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"入庫金額\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"入庫金額\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"}],\"colModel\":[[\"operating\",\" \",null,40],[\"goods\",\"商品\",null,320],[\"skuId\",\"屬性ID\",true,null],[\"skuName\",\"屬性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位ID\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保持期(天)\",true,90],[\"validDate\",\"有效期到\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"入庫單價\",false,100],[\"amount\",\"入庫金額\",false,100],[\"description\",\"備註\",null,150]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (6, 'adjustment', 's:1337:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":40,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"width\":320,\"title\":true,\"classes\":\"goods\",\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis disableSku\"},\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"屬性ID\",\"hidden\":true,\"defLabel\":\"屬性ID\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":60,\"defLabel\":\"單位\"},{\"name\":\"amount\",\"label\":\"調整金額\",\"hidden\":false,\"width\":100,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"調整金額\",\"defhidden\":false},{\"name\":\"locationName\",\"label\":\"倉庫<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"title\":true,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫<small id=\\\"batchStorage\\\">(批量)</small>\"},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"}],\"colModel\":[[\"operating\",\" \",null,40],[\"goods\",\"商品\",null,320],[\"skuId\",\"屬性ID\",true,null],[\"mainUnit\",\"單位\",null,60],[\"amount\",\"調整金額\",false,100],[\"locationName\",\"倉庫<small id=\\\"batchStorage\\\">(批量)</small>\",null,100],[\"description\",\"備註\",null,150]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (7, 'purchaseBack', 's:3815:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":60,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"nameExt\":\"<span id=\\\"barCodeInsert\\\">掃描槍錄入</span>\",\"width\":300,\"classes\":\"goods\",\"editable\":true,\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"屬性ID\",\"hidden\":true,\"defLabel\":\"屬性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"屬性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"屬性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位Id\",\"hidden\":true,\"defLabel\":\"單位Id\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保持期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保持期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"入貨單價\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"入貨單價\",\"defhidden\":false},{\"name\":\"discountRate\",\"label\":\"折扣率(%)\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"integer\",\"editable\":true,\"defLabel\":\"折扣率(%)\",\"defhidden\":false},{\"name\":\"deduction\",\"label\":\"折扣額\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"折扣額\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"入貨金額\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"入貨金額\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"},{\"name\":\"srcOrderEntryId\",\"label\":\"源單分錄ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單分錄ID\",\"defhidden\":true},{\"name\":\"srcOrderId\",\"label\":\"源單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單ID\",\"defhidden\":true},{\"name\":\"srcOrderNo\",\"label\":\"源單號\",\"width\":120,\"fixed\":true,\"hidden\":true,\"defLabel\":\"源單號\",\"defhidden\":true}],\"colModel\":[[\"operating\",\" \",null,60],[\"goods\",\"商品\",null,300],[\"skuId\",\"屬性ID\",true,null],[\"skuName\",\"屬性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位Id\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保持期(天)\",true,90],[\"validDate\",\"有效期\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"入貨單價\",false,100],[\"discountRate\",\"折扣率(%)\",false,70],[\"deduction\",\"折扣額\",false,70],[\"amount\",\"入貨金額\",false,100],[\"description\",\"備註\",null,150],[\"srcOrderEntryId\",\"源單分錄ID\",true,0],[\"srcOrderId\",\"源單ID\",true,0],[\"srcOrderNo\",\"源單號\",true,120]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (8, 'salesBack', 's:3893:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":60,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"nameExt\":\"<span id=\\\"barCodeInsert\\\">掃描槍錄入</span>\",\"width\":300,\"classes\":\"goods\",\"editable\":true,\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"属性ID\",\"hidden\":true,\"defLabel\":\"属性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"属性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"属性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位Id\",\"hidden\":true,\"defLabel\":\"單位Id\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保質期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保質期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期至\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期至\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"銷售單價\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"銷售單價\",\"defhidden\":false},{\"name\":\"discountRate\",\"label\":\"折扣率(%)\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"integer\",\"editable\":true,\"defLabel\":\"折扣率(%)\",\"defhidden\":false},{\"name\":\"deduction\",\"label\":\"折扣額\",\"hidden\":false,\"width\":70,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"折扣額\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"銷售金額\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"editable\":true,\"defLabel\":\"銷售金額\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"},{\"name\":\"srcOrderEntryId\",\"label\":\"源分錄單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源分錄單ID\",\"defhidden\":true},{\"name\":\"srcOrderId\",\"label\":\"源單ID\",\"width\":0,\"hidden\":true,\"defLabel\":\"源單ID\",\"defhidden\":true},{\"name\":\"srcOrderNo\",\"label\":\"源單號\",\"width\":120,\"fixed\":true,\"hidden\":true,\"defLabel\":\"源單號\",\"defhidden\":true}],\"colModel\":[[\"operating\",\" \",null,60],[\"goods\",\"商品\",null,300],[\"skuId\",\"属性ID\",true,null],[\"skuName\",\"属性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位Id\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保質期(天)\",true,90],[\"validDate\",\"有效期至\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"銷售單價\",false,100],[\"discountRate\",\"折扣率(%)\",false,70],[\"deduction\",\"折扣額\",false,70],[\"amount\",\"銷售金額\",false,100],[\"description\",\"備註\",null,150],[\"srcOrderEntryId\",\"源分錄單ID\",true,0],[\"srcOrderId\",\"源單ID\",true,0],[\"srcOrderNo\",\"源單號\",true,120]],\"isReg\":true}}}\";', 'yes');
INSERT INTO ci_options (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (9, 'otherOutbound', 's:2892:\"{\"grids\":{\"grid\":{\"defColModel\":[{\"name\":\"operating\",\"label\":\" \",\"width\":40,\"fixed\":true,\"align\":\"center\",\"defLabel\":\" \"},{\"name\":\"goods\",\"label\":\"商品\",\"width\":320,\"title\":true,\"classes\":\"goods\",\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"商品\"},{\"name\":\"skuId\",\"label\":\"屬性ID\",\"hidden\":true,\"defLabel\":\"屬性ID\",\"defhidden\":true},{\"name\":\"skuName\",\"label\":\"屬性\",\"width\":100,\"classes\":\"ui-ellipsis\",\"hidden\":true,\"defLabel\":\"屬性\",\"defhidden\":true},{\"name\":\"mainUnit\",\"label\":\"單位\",\"width\":80,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"單位\"},{\"name\":\"unitId\",\"label\":\"單位ID\",\"hidden\":true,\"defLabel\":\"單位ID\",\"defhidden\":true},{\"name\":\"locationName\",\"label\":\"倉庫\",\"nameExt\":\"<small id=\\\"batchStorage\\\">(批量)</small>\",\"width\":100,\"title\":true,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-triangle-1-s\"},\"defLabel\":\"倉庫\"},{\"name\":\"batch\",\"label\":\"批次\",\"width\":90,\"classes\":\"ui-ellipsis batch\",\"hidden\":true,\"title\":false,\"editable\":true,\"align\":\"left\",\"edittype\":\"custom\",\"editoptions\":{\"trigger\":\"ui-icon-ellipsis\"},\"defLabel\":\"批次\",\"defhidden\":true},{\"name\":\"prodDate\",\"label\":\"生產日期\",\"width\":90,\"hidden\":true,\"title\":false,\"editable\":true,\"edittype\":\"custom\",\"editoptions\":{},\"defLabel\":\"生產日期\",\"defhidden\":true},{\"name\":\"safeDays\",\"label\":\"保持期(天)\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"保持期(天)\",\"defhidden\":true},{\"name\":\"validDate\",\"label\":\"有效期至\",\"width\":90,\"hidden\":true,\"title\":false,\"align\":\"left\",\"defLabel\":\"有效期至\",\"defhidden\":true},{\"name\":\"qty\",\"label\":\"數量\",\"width\":80,\"align\":\"right\",\"formatter\":\"number\",\"formatoptions\":{\"decimalPlaces\":1},\"editable\":true,\"defLabel\":\"數量\"},{\"name\":\"price\",\"label\":\"出庫單位成本\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":1},\"defLabel\":\"出庫單位成本\",\"defhidden\":false},{\"name\":\"amount\",\"label\":\"出庫成本\",\"hidden\":false,\"width\":100,\"fixed\":true,\"align\":\"right\",\"formatter\":\"currency\",\"formatoptions\":{\"showZero\":true,\"decimalPlaces\":2},\"defLabel\":\"出庫成本\",\"defhidden\":false},{\"name\":\"description\",\"label\":\"備註\",\"width\":150,\"title\":true,\"editable\":true,\"defLabel\":\"備註\"}],\"colModel\":[[\"operating\",\" \",null,40],[\"goods\",\"商品\",null,320],[\"skuId\",\"屬性ID\",true,null],[\"skuName\",\"屬性\",true,100],[\"mainUnit\",\"單位\",null,80],[\"unitId\",\"單位ID\",true,null],[\"locationName\",\"倉庫\",null,100],[\"batch\",\"批次\",true,90],[\"prodDate\",\"生產日期\",true,90],[\"safeDays\",\"保持期(天)\",true,90],[\"validDate\",\"有效期至\",true,90],[\"qty\",\"數量\",null,80],[\"price\",\"出庫單位成本\",false,100],[\"amount\",\"出庫成本\",false,100],[\"description\",\"備註\",null,150]],\"isReg\":true}}}\";', 'yes');


#
# TABLE STRUCTURE FOR: ci_payment_info
#

DROP TABLE IF EXISTS ci_payment_info;

CREATE TABLE `ci_payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ci_receipt_info
#

DROP TABLE IF EXISTS ci_receipt_info;

CREATE TABLE `ci_receipt_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ci_receipt_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (1, 29, 0, 22, 'SKD201605032344085', 'SALE', '2016-05-03', '49.5', '8', '41.5', '0', '153001');
INSERT INTO ci_receipt_info (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES (2, 30, 0, 22, 'SKD201605032344217', 'SALE', '2016-05-03', '49.5', '8', '41.5', '0', '153001');


#
# TABLE STRUCTURE FOR: ci_staff
#

DROP TABLE IF EXISTS ci_staff;

CREATE TABLE `ci_staff` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用  1禁用',
  `allowsms` tinyint(4) DEFAULT '0',
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `commissionrate` tinyint(4) DEFAULT '0',
  `creatorId` int(11) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empId` int(11) DEFAULT '0',
  `empType` tinyint(4) DEFAULT '1',
  `fullId` int(11) DEFAULT '0',
  `leftDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `parentId` smallint(6) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_staff (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES (1, 'Jordon', 'A1', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);


#
# TABLE STRUCTURE FOR: ci_storage
#

DROP TABLE IF EXISTS ci_storage;

CREATE TABLE `ci_storage` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `locationNo` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态 0正常  1锁定',
  `allowNeg` tinyint(4) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `empId` int(11) DEFAULT '0',
  `groupx` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `locationNo` (`locationNo`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_storage (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES (1, '默認倉', '01', 0, 0, 0, 0, NULL, NULL, 0, '', 0);


#
# TABLE STRUCTURE FOR: ci_unit
#

DROP TABLE IF EXISTS ci_unit;

CREATE TABLE `ci_unit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `unitTypeId` smallint(6) DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `rate` tinyint(1) DEFAULT '0',
  `guid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (1, '条', 1, 0, 0, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (2, '包', 1, 0, 0, 0, '', 0);
INSERT INTO ci_unit (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES (3, '磅', 1, 0, 0, 0, '', 0);


#
# TABLE STRUCTURE FOR: ci_unittype
#

DROP TABLE IF EXISTS ci_unittype;

CREATE TABLE `ci_unittype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

