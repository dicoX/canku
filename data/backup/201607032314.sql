-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-03 23:14:09
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `met`
--

-- --------------------------------------------------------

--
-- 表的结构 `ci_account`
--

CREATE TABLE IF NOT EXISTS `ci_account` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `amount` double DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_account`
--

INSERT INTO `ci_account` (`id`, `name`, `number`, `status`, `amount`, `date`, `type`, `isDelete`) VALUES
(1, '現金', '01', 1, 0, '2016-04-16', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_account_info`
--

CREATE TABLE IF NOT EXISTS `ci_account_info` (
  `id` int(11) NOT NULL,
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
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_account_info`
--

INSERT INTO `ci_account_info` (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES
(1, 4, 1, 'CG201006090236073', 'PUR', '2016-01-17', 0, 0, 0, '', '', 150501, '普通采购', 0),
(2, 16, 20, 'XS201604240200546', 'SALE', '2016-04-24', 1, 11.8, 0, '', '', 150601, '普通销售', 0),
(3, 17, 20, 'SKD201604290041402', 'RECEIPT', '2016-04-26', 1, 0, 0, '', '', 153001, '收款', 0),
(4, 18, 20, 'SKD201605010920543', 'RECEIPT', '2016-05-01', 1, 100, 9, '', '', 153001, '收款', 0),
(5, 19, 20, 'SKD201605020043233', 'RECEIPT', '2016-05-01', 1, 10, 9, '', '', 153001, '收款', 0),
(11, 22, 18, 'XS201605022238279', 'SALE', '2016-05-02', 1, 8, 0, '', '', 150601, '普通销售', 0),
(10, 24, 17, 'XS201605022310118', 'SALE', '2016-05-02', 0, 0, 0, '', '', 150601, '普通销售', 0),
(9, 20, 21, 'CG201605022104538', 'PUR', '2016-05-02', 1, -600, 0, '', '', 150501, '普通采购', 0),
(12, 29, 18, 'SKD201605032344085', 'RECEIPT', '2016-05-03', 1, 1.5, 9, '', '', 153001, '收款', 0),
(13, 30, 18, 'SKD201605032344217', 'RECEIPT', '2016-05-03', 1, 1.5, 9, '', '', 153001, '收款', 0),
(14, 40, 19, 'SKD201605050128303', 'RECEIPT', '2016-05-05', 1, 100, 9, '', '', 153001, '收款', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_address`
--

CREATE TABLE IF NOT EXISTS `ci_address` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
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
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ci_admin`
--

CREATE TABLE IF NOT EXISTS `ci_admin` (
  `uid` smallint(6) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_admin`
--

INSERT INTO `ci_admin` (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 1, '系統管理員', '13888888888', NULL, 0),
(2, 'kychan', '73b796238fa32b16e9ea81b17deb07a8', 1, '陳康愉', '13726233135', '6,7,88', 1),
(3, 'zhhuaspace', '4f9f7f5a74e3f5183a1e7aa902ed9ca2', 1, 'zhhuaspace', '13726233133', NULL, 1),
(4, 'test', '202cb962ac59075b964b07152d234b70', 1, 'test', '13726233333', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistingprop`
--

CREATE TABLE IF NOT EXISTS `ci_assistingprop` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistsku`
--

CREATE TABLE IF NOT EXISTS `ci_assistsku` (
  `skuId` int(11) NOT NULL,
  `skuClassId` int(11) DEFAULT '0',
  `skuAssistId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ci_category`
--

CREATE TABLE IF NOT EXISTS `ci_category` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
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
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_category`
--

INSERT INTO `ci_category` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES
(1, '厂家', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(2, '麪粉', 0, '2', 1, 0, 1, 'trade', '', 1, 0, 0),
(3, '祐漢', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(4, '筷子基', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(5, '三盞燈', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(6, '台山', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(7, '中區 新口岸', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(8, '氹仔', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(9, '現付', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0),
(10, '月結', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0),
(11, '1234', 2, '2,11', 2, 0, 1, 'trade', '', 1, 0, 1),
(12, '載', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(13, '食品', 0, '13', 1, 0, 1, 'trade', '', 1, 0, 1),
(14, '食品', 0, '14', 1, 0, 1, 'trade', '', 1, 0, 1),
(15, '食品', 0, '15', 1, 0, 1, 'trade', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_contact`
--

CREATE TABLE IF NOT EXISTS `ci_contact` (
  `id` smallint(6) NOT NULL,
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
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常 1删除'
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_contact`
--

INSERT INTO `ci_contact` (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES
(1, '中顺洁柔', '0025114', 1, '厂家', 10, 12, 144, 0, '2016-04-26', '0', '[{"linkName":"1","linkMobile":"","linkPhone":"1","linkIm":"1","linkFirst":1,"id":0}]', 10, NULL, 0, '0', '', 0, 0),
(2, '榮譽', '14', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[{"linkName":"周生","linkMobile":"68414433","linkPhone":"","linkIm":"","linkFirst":1,"province":"澳门特别行政区","city":"离岛","county":"","address":"好好學習，天天向上","id":0}]', -10, NULL, 1, '批發客戶', '', 0, 0),
(3, '花蓮一品香', '27', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(4, '周根記', '30', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(5, '順德建華', '39', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(6, '齊歡樂', '52', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(7, '002美食', 'D001', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(8, '002美食', 'D002', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(9, '其記（鋪）', 'D003', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(10, '其記（街市）', 'D003A', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(11, '牛記', 'D004', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(12, '皇子', 'D005', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(13, '肥佬', 'D006', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(14, '麵店王', 'D007', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(15, '好連來', 'D008', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(16, '耀發', 'D009', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(17, '廣豐', 'D011', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(18, '利盛', 'D012', 3, '祐漢', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0),
(19, '金豐', 'D013', 3, '祐漢', 0, 0, 0, 0, '2016-04-19', '', '[{"linkName":"顧","linkMobile":"","linkPhone":"","linkIm":"","linkFirst":1,"id":0}]', -10, NULL, 1, '批發客戶', '', 0, 0),
(20, '泰豐', 'D016', 3, '祐漢', 0, 12, 12, 0, '2016-04-26', '', '[{"linkName":"鄭生","linkMobile":"13726233135","linkPhone":"","linkIm":"","linkFirst":1,"id":0}]', -10, NULL, 1, '批發客戶', '', 0, 0),
(21, '乐華麪粉廠', '002511', 1, '厂家', 17, 0, 0, 0, '2016-05-01', '', '[{"linkName":"ggroe","linkMobile":"","linkPhone":"","linkIm":"","linkFirst":1,"id":0}]', 10, NULL, 0, '0', '', 0, 0),
(22, 'TTT', 'T001', 4, '筷子基', 0, 0, 0, 0, '0000-00-00', '', '[]', -10, NULL, 1, '批發客戶', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_customerprice`
--

CREATE TABLE IF NOT EXISTS `ci_customerprice` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1745 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_customerprice`
--

INSERT INTO `ci_customerprice` (`id`, `goods_id`, `contact_id`, `price`) VALUES
(1547, 12, 20, 0),
(1548, 12, 19, 0),
(1549, 12, 18, 0),
(1550, 12, 17, 0),
(1551, 12, 16, 0),
(1552, 12, 15, 0),
(1553, 12, 14, 0),
(1554, 12, 13, 0),
(1555, 12, 12, 0),
(1556, 12, 11, 0),
(1557, 12, 10, 0),
(1558, 12, 9, 0),
(1559, 12, 8, 0),
(1560, 12, 7, 0),
(1561, 12, 6, 0),
(1562, 12, 5, 0),
(1563, 12, 4, 0),
(1564, 12, 3, 0),
(1565, 12, 2, 0),
(1585, 15, 20, 0),
(1586, 15, 19, 0),
(1587, 15, 18, 0),
(1588, 15, 17, 0),
(1589, 15, 16, 0),
(1590, 15, 15, 0),
(1591, 15, 14, 0),
(1592, 15, 13, 0),
(1593, 15, 12, 0),
(1594, 15, 11, 0),
(1595, 15, 10, 0),
(1596, 15, 9, 0),
(1597, 15, 8, 0),
(1598, 15, 7, 0),
(1599, 15, 6, 0),
(1600, 15, 5, 0),
(1601, 15, 4, 0),
(1602, 15, 3, 0),
(1603, 15, 2, 0),
(1725, 13, 22, 100),
(1726, 13, 20, 100),
(1727, 13, 19, 100),
(1728, 13, 18, 1),
(1729, 13, 17, 1),
(1730, 13, 16, 1),
(1731, 13, 15, 1),
(1732, 13, 14, 1),
(1733, 13, 13, 1),
(1734, 13, 12, 1),
(1735, 13, 11, 1),
(1736, 13, 10, 1),
(1737, 13, 9, 1),
(1738, 13, 8, 1),
(1739, 13, 7, 1),
(1740, 13, 6, 1),
(1741, 13, 5, 1),
(1742, 13, 4, 1),
(1743, 13, 3, 1),
(1744, 13, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods`
--

CREATE TABLE IF NOT EXISTS `ci_goods` (
  `id` int(11) NOT NULL,
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
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常  1删除'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_goods`
--

INSERT INTO `ci_goods` (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`) VALUES
(1, 'C&S法柔国际版', '002511-1', 0, '1*12', 1, '条', 2, '麪粉', 4.8, 6.8, 0, 0, '', 1, '', NULL, 5.8, 12, '', '', 15, 0, '6914068008448', 0, 0, 1, '总仓', 5.8, '', NULL, '', 0, NULL, 1, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(2, 'C&S可湿水面纸', '002511-2', 0, '1*12', 1, '条', 2, '麪粉', 4.8, 6.8, 0, 0, '', 1, '', NULL, 5.8, 10, '', '', 15, 0, '6914068012858', 0, 0, 1, '总仓', 5.8, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(3, '肉燕皮', 'S19', 0, '', 3, '磅', 2, '麪粉', 0, 77, 0, 0, '', 1, '', NULL, 77, 5, '', '', 57, 0, '', 0, 0, 1, '總倉', 77, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(4, '皂角米', 'Z72', 0, '', 3, '磅', 2, '麪粉', 0, 1, 0, 0, '', 1, '', NULL, 1, 0, '', '', 80, 0, '3', 0, 0, 1, '總倉', 1, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(5, '全蛋麵（幼）', '1', 0, '', 3, '磅', 2, '麪粉', 10, 15, 0, 0, 'noj', 1, '', NULL, 15, 0, '', '', 90, 0, '', 0, 9, 0, '', 15, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(6, '全蛋生麵（粗）（明）', 'A7', 0, '12', 3, '磅', 2, '麪粉', 12, 15, 0, 0, '', 1, '', NULL, 15, 0, '', '', 50, 0, '2', 0, 0, 1, '默認倉', 15, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(7, '炒麵（扁炒麵）', 'F2', 0, '', 3, '磅', 2, '麪粉', 5, 9.5, 0, 0, '', 1, '', NULL, 9.5, 0, '', '', 50, 0, '', 0, 0, 0, '', 9.5, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(8, '全蛋伊麵', 'B2', 0, '', 3, '磅', 2, '麪粉', 5, 9, 0, 0, '测试啊', 1, '', NULL, 9, 0, '', '', 50, 0, '', 0, 5, 1, '默認倉', 9, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(9, '奶粉', 'B5', 0, '123', 3, '磅', 15, '食品', 1, 9, 0, 0, '', 1, '', NULL, 9, 12, '', '', 12, 0, '', 0, 5, 0, '', 5, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(10, '测试', 'A01噢', 0, '12*67', 3, '磅', 15, '食品', 0, 12.3, 0, 0, '', 1, '', NULL, 0, 80, '', '', 100, 0, '', 0, 0, 1, '默認倉', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(11, '测试1', 'a090', 0, '无', 10, 'admin', 15, '食品', 0, 99, 0, 0, '', 1, '', NULL, 0, 10, '', '', 100, 0, '', 0, 0, 1, '默認倉', 0, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(12, 'MKMK', '999', 0, '22', 8, '斤', 15, '食品', 0, 100, 0, 0, '', 1, '', NULL, 80, 100, '', '', 999, 0, '', 0, 0, 1, '默認倉', 68, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(13, 'JJJJ', '1000', 0, '90', 8, '斤', 15, '食品', 500, 666, 0, 0, '', 1, '', NULL, 333, 10000, '', '', 30000, 0, 'jiogjqobnqroiq', 10, 20, 1, '默認倉', 111, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(15, 'ooo', '1001', 0, '', 8, '斤', 15, '食品', 0, 888, 0, 0, '', 1, '', NULL, 799, 111, '', '', 666, 0, '', 0, 0, 1, '默認倉', 777, '', NULL, '', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods_img`
--

CREATE TABLE IF NOT EXISTS `ci_goods_img` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `invId` int(11) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `thumbnailUrl` varchar(255) DEFAULT '',
  `size` int(11) DEFAULT '0',
  `deleteUrl` varchar(255) DEFAULT '',
  `deleteType` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice`
--

CREATE TABLE IF NOT EXISTS `ci_invoice` (
  `id` int(11) NOT NULL,
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
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常'
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_invoice`
--

INSERT INTO `ci_invoice` (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`) VALUES
(5, 1, 'CG201603152118516', 1, '系統管理員', 150501, 9.6, 4.8, 0, '2016-03-15', '', 4.8, 50, 4.8, 2, 0, 0, '', 0, 0, 0, 0, 'PUR', '2016-03-15 21:18:51', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 2, 'XS201603152133541', 1, '系統管理員', 150601, 14.6, 14.6, 0, '2016-03-15', '', 14.6, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-04-05 22:55:10', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 20, 'XS201604121450524', 1, '系統管理員', 150601, 6.8, 6.8, 0, '2016-04-11', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-02 01:35:01', 0, '销货', 0, 0, 0, 0, 0, 6.8, 0, 0, 0, 0),
(8, 20, 'XS201604162127513', 1, '系統管理員', 150601, 6.8, 6.8, 0, '2016-04-16', '', 6.8, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-04-16 21:58:41', 0, '销货', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1, 'CG201604162146162', 1, '系統管理員', 150501, 4.8, 4.8, 0, '2016-04-16', '', 4.8, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2016-04-16 21:46:16', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 20, 'XS201604162248453', 1, '系統管理員', 150601, 6.8, 6.8, 0, '2016-04-16', '', 6.8, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-04-16 22:48:45', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 20, 'XS201604162250354', 1, '系統管理員', 150601, 6.8, 6.8, 0, '2016-04-16', '', 6.8, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-04-16 22:50:35', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 'CG201604162253084', 1, '系統管理員', 150501, 4.8, 4.8, 0, '2016-04-16', '', 4.8, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2016-04-16 22:53:08', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 'QTRK201604202245450', 1, '系統管理員', 150706, 4.8, 0, 0, '2016-04-20', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'OI', NULL, 0, '其他入库', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 20, 'XS201604202258338', 1, '系統管理員', 150602, 0, 0, 0, '2016-04-20', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-04-20 22:58:33', 2, '销退', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 'QTCK201604202349174', 1, '系統管理員', 150806, 0, 0, 0, '2016-04-20', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'OO', NULL, 0, '其他出库', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 20, 'XS201604240200546', 1, '系統管理員', 150601, 11.8, 11.8, 11.8, '2016-04-24', '', 0, 0, 0, 2, 0, 0, '', 0, 0, 0, 1, 'SALE', '2016-04-24 02:00:54', 2, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 20, 'SKD201604290041402', 1, '系統管理員', 153001, 0, 0, 0, '2016-04-26', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 20, 'SKD201605010920543', 1, '系統管理員', 153001, 0, 100, 0, '2016-05-01', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 20, 'SKD201605020043233', 1, '系統管理員', 153001, 0, 10, 0, '2016-05-01', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 21, 'CG201605022104538', 1, '系統管理員', 150501, 2140, 2140, 600, '2016-05-02', '', 1540, 0, 0, 420, 0, 0, '', 0, 0, 0, 1, 'PUR', '2016-05-03 00:15:56', 1, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 19, 'XS201605022105023', 1, '系統管理員', 150601, 24.5, 24.5, 0, '2016-05-02', '', 24.5, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 01:42:14', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 18, 'XS201605022238279', 1, '系統管理員', 150601, 49.5, 49.5, 8, '2016-05-02', '', 41.5, 0, 0, 5, 0, 0, '', 0, 0, 0, 1, 'SALE', '2016-05-03 22:41:59', 1, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 20, 'XS201605022239250', 1, '系統管理員', 150601, 48.5, 48.5, 0, '2016-05-02', '', 48.5, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 01:41:28', 0, '销货', 0, 0, 0, 0, 0, 48.5, 0, 0, 0, 0),
(24, 17, 'XS201605022310118', 1, '系統管理員', 150601, 108, 108, 0, '2016-05-02', '', 108, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 01:49:51', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 16, 'XS201605030143343', 1, '系統管理員', 150601, 116.5, 116.5, 0, '2016-05-03', '', 116.5, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 01:49:21', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 15, 'XS201605030206443', 1, '系統管理員', 150601, 39.5, 39.5, 0, '2016-05-03', '', 39.5, 0, 0, 3, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 02:08:18', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 15, 'XS201605030208388', 1, '系統管理員', 150601, 87.5, 87.5, 0, '2016-05-03', '', 87.5, 0, 0, 3, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 02:08:38', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 13, 'XS201605030209108', 1, '系統管理員', 150601, 77, 77, 0, '2016-05-03', '', 77, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-03 02:09:10', 0, '销货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 18, 'SKD201605032344085', 1, '系統管理員', 153001, 0, 1.5, 0, '2016-05-03', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 18, 'SKD201605032344217', 1, '系統管理員', 153001, 0, 1.5, 0, '2016-05-03', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 20, 'XS201605042240023', 1, '系統管理員', 150601, 9, 9, 0, '2016-05-04', '', 9, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-04 22:40:02', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 20, 'XS201605042356329', 1, '系統管理員', 150602, -8.55, -8.55, 0, '2016-05-04', '', -8.55, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-04 23:56:32', 0, '銷售退貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 'CBTZ201605050006242', 1, '系統管理員', 150807, 10, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 'CBTZ201605050015496', 1, '系統管理員', 150807, 20, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 'CBTZ201605050023003', 1, '系統管理員', 150807, 0, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 'CBTZ201605050023347', 1, '系統管理員', 150807, 0, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 'CBTZ201605050024297', 1, '系統管理員', 150807, 0, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 'CBTZ201605050024370', 1, '系統管理員', 150807, 0, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', NULL, 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 'CBTZ201605050118415', 1, '系統管理員', 150807, 60, 0, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'CADJ', '2016-05-05 01:26:12', 0, '成本调整', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 19, 'SKD201605050128303', 1, '系統管理員', 153001, 0, 100, 0, '2016-05-05', '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 'RECEIPT', NULL, 0, '收款', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 20, 'XS201605162002312', 1, '系統管理員', 150601, 25, 25, 0, '2016-05-16', '', 25, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-16 20:02:31', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 20, 'XS201605162003150', 1, '系統管理員', 150601, 16, 16, 0, '2016-05-16', '', 16, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-16 20:03:15', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 20, 'XS201605182030418', 1, '系統管理員', 150601, 18.5, 18.5, 0, '2016-05-18', '', 18.5, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-18 20:30:41', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 20, 'XS201605182031042', 1, '系統管理員', 150601, 24.5, 24.5, 0, '2016-05-18', '', 24.5, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-18 20:31:04', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 21, 'CG201605242122052', 1, '系統管理員', 150501, 5, 5, 0, '2016-05-24', '', 5, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2016-05-24 21:22:05', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 20, 'XS201605252045229', 1, '系統管理員', 150601, 9, 9, 0, '2016-05-25', '', 9, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-25 20:45:22', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 20, 'XS201605252348182', 1, '系統管理員', 150601, 45.5, 45.5, 0, '2016-05-25', '', 45.5, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-26 00:49:12', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 20, 'XS201605262120037', 1, '系統管理員', 150601, 52.8, 52.8, 0, '2016-05-26', '', 52.8, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-05-30 01:15:46', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 20, 'XS201606151615059', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:15:26', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 22, 'XS201606151617327', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:17:32', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 22, 'XS201606151618080', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:18:08', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 20, 'XS201606151619344', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:19:34', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 20, 'XS201606151630264', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:30:26', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 20, 'XS201606151632324', 1, '系統管理員', 150601, 12, 12, 0, '2016-06-15', '', 12, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:32:32', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 22, 'XS201606151645160', 1, '系統管理員', 150601, 15, 15, 0, '2016-06-15', '', 15, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 16:45:16', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 20, 'XS201606151706575', 1, '系統管理員', 150601, 12.3, 12.3, 0, '2016-06-15', '', 12.3, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 17:06:57', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 20, 'XS201606151726428', 1, '系統管理員', 150601, 89, 89, 0, '2016-06-15', '', 89, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-15 17:26:42', 0, '銷售出貨', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 20, 'XS201606181411344', 1, '系統管理員', 150601, 16.3, 16.3, 0, '2016-06-18', '', 16.3, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-06-18 14:11:34', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 21, 'CG201607012257194', 1, '系統管理員', 150501, 5, 5, 0, '2016-07-01', '', 5, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2016-07-01 22:57:19', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 20, 'XS201607020009229', 1, '系統管理員', 150601, 99, 99, 0, '2016-07-01', '', 99, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-02 00:09:22', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 20, 'XS201607031117478', 1, '系統管理員', 150601, 24.3, 24.3, 0, '2016-07-03', '', 24.3, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-03 11:17:47', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 20, 'XS201607031125077', 1, '系統管理員', 150601, 24.3, 24.3, 0, '2016-07-03', '', 24.3, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-03 11:25:07', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 20, 'XS201607031126178', 1, '系統管理員', 150601, 100, 100, 0, '2016-07-03', '', 100, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-03 11:26:17', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 22, 'XS201607031603367', 1, '系統管理員', 150601, 666, 666, 0, '2016-07-03', '', 666, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-03 16:05:58', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 22, 'XS201607031608433', 1, '系統管理員', 150601, 666, 666, 0, '2016-07-03', '', 666, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2016-07-03 16:09:16', 0, '銷售出貨', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_info`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_info` (
  `id` int(11) NOT NULL,
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
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常'
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_invoice_info`
--

INSERT INTO `ci_invoice_info` (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES
(1, 1, 1, 'CG201006090018020', 150501, 6.8, '2016-01-16', '', 0, 6.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1),
(2, 2, 1, 'CG201006090018093', 150501, 6.8, '2016-01-16', '', 0, 6.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1),
(3, 3, 1, 'CG201006090019165', 150501, 6.8, '2016-01-16', '', 0, 6.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 1),
(4, 0, 0, '期初数量', 0, 0, '2001-01-01', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(5, 0, 0, '期初数量', 0, 0, '2001-01-01', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(8, 0, 0, '期初数量', 0, 0, '2001-01-01', '', 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(9, 4, 1, 'CG201006090236073', 150501, 76.8, '2016-01-17', '', 1, 4.8, 0, 0, 16, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(10, 4, 1, 'CG201006090236073', 150501, 43.2, '2016-01-17', '', 2, 4.8, 0, 0, 9, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(11, 5, 1, 'CG201603152118516', 150501, 4.8, '2016-03-15', '', 2, 4.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(12, 5, 1, 'CG201603152118516', 150501, 4.8, '2016-03-15', '', 2, 4.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(14, 6, 2, 'XS201603152133541', 150601, 7.8, '2016-03-15', '', 1, 7.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(15, 6, 2, 'XS201603152133541', 150601, 6.8, '2016-03-15', '', 2, 6.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(31, 7, 20, 'XS201604121450524', 150601, 6.8, '2016-04-11', '', 2, 6.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(22, 8, 20, 'XS201604162127513', 150601, 6.8, '2016-04-16', '', 2, 6.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 1, 0),
(20, 9, 1, 'CG201604162146162', 150501, 4.8, '2016-04-16', '', 2, 4.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(23, 10, 20, 'XS201604162248453', 150601, 6.8, '2016-04-16', '', 2, 6.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(24, 11, 20, 'XS201604162250354', 150601, 6.8, '2016-04-16', '', 1, 6.8, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(25, 12, 1, 'CG201604162253084', 150501, 4.8, '2016-04-16', '', 1, 4.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(26, 13, 0, 'QTRK201604202245450', 150706, 4.8, '2016-04-20', '', 1, 4.8, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '其他入库', 0, 0, '', 'OI', 0, '', 0, 0),
(27, 14, 20, 'XS201604202258338', 150602, 0, '2016-04-20', '', 1, 6.8, 6.8, 100, 1, 1, 0, 0, 0, 0, -1, 1, '销退', 0, 0, '', 'SALE', 0, '', 0, 0),
(28, 15, 0, 'QTCK201604202349174', 150806, 0, '2016-04-20', '', 2, 0, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '其他出库', 0, 0, '', 'OO', 0, '', 0, 0),
(29, 16, 20, 'XS201604240200546', 150601, 6.8, '2016-04-24', '', 2, 6.8, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(30, 16, 20, 'XS201604240200546', 150601, 5, '2016-04-24', '', 1, 5, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(63, 20, 21, 'CG201605022104538', 150501, 350, '2016-05-02', '', 7, 5, 0, 0, 70, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(64, 20, 21, 'CG201605022104538', 150501, 350, '2016-05-02', '', 8, 5, 0, 0, 70, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(62, 20, 21, 'CG201605022104538', 150501, 840, '2016-05-02', '', 6, 12, 0, 0, 70, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(61, 20, 21, 'CG201605022104538', 150501, 600, '2016-05-02', '', 5, 10, 0, 0, 60, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(60, 20, 21, 'CG201605022104538', 150501, 0, '2016-05-02', '', 4, 0, 0, 0, 50, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(59, 20, 21, 'CG201605022104538', 150501, 0, '2016-05-02', '', 3, 0, 0, 0, 100, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(76, 21, 19, 'XS201605022105023', 150601, 9.5, '2016-05-02', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(75, 21, 19, 'XS201605022105023', 150601, 15, '2016-05-02', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(102, 22, 18, 'XS201605022238279', 150601, 9.5, '2016-05-02', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(101, 22, 18, 'XS201605022238279', 150601, 15, '2016-05-02', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(100, 22, 18, 'XS201605022238279', 150601, 15, '2016-05-02', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(99, 22, 18, 'XS201605022238279', 150601, 1, '2016-05-02', '', 4, 1, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(73, 23, 20, 'XS201605022239250', 150601, 9.5, '2016-05-02', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(72, 23, 20, 'XS201605022239250', 150601, 15, '2016-05-02', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(71, 23, 20, 'XS201605022239250', 150601, 15, '2016-05-02', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(87, 24, 17, 'XS201605022310118', 150601, 15, '2016-05-02', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(86, 24, 17, 'XS201605022310118', 150601, 1, '2016-05-02', '', 4, 1, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(85, 24, 17, 'XS201605022310118', 150601, 77, '2016-05-02', '', 3, 77, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(74, 23, 20, 'XS201605022239250', 150601, 9, '2016-05-02', '', 8, 9, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(83, 25, 16, 'XS201605030143343', 150601, 15, '2016-05-03', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(82, 25, 16, 'XS201605030143343', 150601, 15, '2016-05-03', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(81, 25, 16, 'XS201605030143343', 150601, 77, '2016-05-03', '', 3, 77, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(84, 25, 16, 'XS201605030143343', 150601, 9.5, '2016-05-03', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(88, 24, 17, 'XS201605022310118', 150601, 15, '2016-05-02', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(94, 26, 15, 'XS201605030206443', 150601, 9.5, '2016-05-03', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(93, 26, 15, 'XS201605030206443', 150601, 15, '2016-05-03', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(92, 26, 15, 'XS201605030206443', 150601, 15, '2016-05-03', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(95, 27, 15, 'XS201605030208388', 150601, 77, '2016-05-03', '', 3, 77, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(96, 27, 15, 'XS201605030208388', 150601, 1, '2016-05-03', '', 4, 1, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(97, 27, 15, 'XS201605030208388', 150601, 9.5, '2016-05-03', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(98, 28, 13, 'XS201605030209108', 150601, 77, '2016-05-03', '', 3, 77, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(103, 22, 18, 'XS201605022238279', 150601, 9, '2016-05-02', '', 8, 9, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 0, 0),
(104, 31, 20, 'XS201605042240023', 150601, 9, '2016-05-04', '', 8, 9, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(105, 32, 20, 'XS201605042356329', 150602, -8.55, '2016-05-04', '', 8, 9, 0.45, 5, 1, 1, 0, 0, 0, 0, -1, 1, '銷售退貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(106, 33, 0, 'CBTZ201605050006242', 150807, 10, '2016-05-05', '', 8, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(107, 34, 0, 'CBTZ201605050015496', 150807, 20, '2016-05-05', '', 8, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(108, 35, 0, 'CBTZ201605050023003', 150807, 0, '2016-05-05', '', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(109, 36, 0, 'CBTZ201605050023347', 150807, 0, '2016-05-05', '', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(110, 37, 0, 'CBTZ201605050024297', 150807, 0, '2016-05-05', '', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(111, 38, 0, 'CBTZ201605050024370', 150807, 0, '2016-05-05', '', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(113, 39, 0, 'CBTZ201605050118415', 150807, 60, '2016-05-05', '', 8, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, 1, '成本调整', 0, 0, '', 'CADJ', 0, '', 0, 0),
(114, 41, 20, 'XS201605162002312', 150601, 12, '2016-05-16', '', 7, 12, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(115, 41, 20, 'XS201605162002312', 150601, 13, '2016-05-16', '', 8, 13, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(116, 42, 20, 'XS201605162003150', 150601, 1, '2016-05-16', '', 4, 1, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(117, 42, 20, 'XS201605162003150', 150601, 15, '2016-05-16', '', 5, 15, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(118, 43, 20, 'XS201605182030418', 150601, 9.5, '2016-05-18', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(119, 43, 20, 'XS201605182030418', 150601, 9, '2016-05-18', '', 8, 9, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(120, 44, 20, 'XS201605182031042', 150601, 15, '2016-05-18', '', 6, 15, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(121, 44, 20, 'XS201605182031042', 150601, 9.5, '2016-05-18', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(122, 45, 21, 'CG201605242122052', 150501, 5, '2016-05-24', '', 8, 5, 0, 0, 1, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(123, 0, 0, '其初數量', 0, 1, '2001-01-01', '', 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, '其初數量', 0, 0, '', 'INI', 0, '', 0, 0),
(124, 0, 0, '其初數量', 0, 1, '2001-01-01', '', 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, '其初數量', 0, 0, '', 'INI', 0, '', 0, 0),
(125, 0, 0, '其初數量', 0, 1, '2001-01-01', '', 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, '其初數量', 0, 0, '', 'INI', 0, '', 0, 0),
(151, 0, 0, '期初数量', 0, 24, '2001-01-01', '', 9, 2, 0, 0, 12, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(127, 46, 20, 'XS201605252045229', 150601, 9, '2016-05-25', '', 9, 9, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(131, 47, 20, 'XS201605252348182', 150601, 9.5, '2016-05-25', '', 7, 9.5, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(130, 47, 20, 'XS201605252348182', 150601, 36, '2016-05-25', '', 9, 12, 0, 0, -3, 1, 0, 0, 0, -1, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(148, 48, 20, 'XS201605262120037', 150601, 30, '2016-05-26', '', 8, 30, 0, 0, -1, 1, 0, 0, 0, 2, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(147, 48, 20, 'XS201605262120037', 150601, 22.8, '2016-05-26', '', 9, 22.8, 0, 0, -1, 1, 0, 0, 0, 2, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(171, 58, 20, 'XS201606181411344', 150601, 4, '2016-06-18', '', 1, 4, 0, 0, -1, 1, 0, 0, 0, 10, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(175, 0, 0, '期初数量', 0, 120, '2001-01-01', '', 10, 10, 0, 0, 12, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(156, 49, 20, 'XS201606151615059', 150601, 12.3, '2016-06-15', '', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(157, 50, 22, 'XS201606151617327', 150601, 12.3, '2016-06-15', '', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(158, 51, 22, 'XS201606151618080', 150601, 12.3, '2016-06-15', '', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(159, 52, 20, 'XS201606151619344', 150601, 12.3, '2016-06-15', 'test', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(160, 53, 20, 'XS201606151630264', 150601, 12.3, '2016-06-15', '', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(161, 54, 20, 'XS201606151632324', 150601, 12, '2016-06-15', '', 1, 12, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(162, 55, 22, 'XS201606151645160', 150601, 15, '2016-06-15', '', 1, 15, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(164, 56, 20, 'XS201606151706575', 150601, 12.3, '2016-06-15', '', 1, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(166, 57, 20, 'XS201606151726428', 150601, 89, '2016-06-15', '', 1, 89, 0, 0, -1, 1, 0, 0, 0, 9, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 1, 0),
(169, 0, 0, '期初数量', 0, 700, '2001-01-01', '', 11, 10, 0, 0, 70, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(172, 58, 20, 'XS201606181411344', 150601, 12.3, '2016-06-18', '', 2, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(173, 59, 21, 'CG201607012257194', 150501, 5, '2016-07-01', '', 7, 5, 0, 0, 1, 1, 0, 0, 0, 3, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(176, 60, 20, 'XS201607020009229', 150601, 99, '2016-07-01', '', 11, 99, 0, 0, -1, 1, 0, 0, 0, 10, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(177, 60, 20, 'XS201607020009229', 150601, 0, '2016-07-01', '', 10, 0, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(178, 60, 20, 'XS201607020009229', 150601, 0, '2016-07-01', '', 8, 0, 0, 0, -1, 1, 0, 0, 0, 10, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(179, 60, 20, 'XS201607020009229', 150601, 0, '2016-07-01', '', 3, 0, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(180, 61, 20, 'XS201607031117478', 150601, 12, '2016-07-03', '', 1, 12, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(181, 61, 20, 'XS201607031117478', 150601, 12.3, '2016-07-03', '', 2, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(182, 62, 20, 'XS201607031125077', 150601, 12, '2016-07-03', '', 1, 12, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(183, 62, 20, 'XS201607031125077', 150601, 12.3, '2016-07-03', '', 2, 12.3, 0, 0, -1, 1, 0, 0, 0, 3, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(184, 63, 20, 'XS201607031126178', 150601, 100, '2016-07-03', '', 1, 100, 0, 0, -1, 1, 0, 0, 0, 8, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(196, 0, 0, '期初数量', 0, 20000, '2001-01-01', '', 13, 20, 0, 0, 1000, 1, 0, 0, 0, 0, 0, 1, '期初数量', 0, 0, '', 'INI', 0, '', 0, 0),
(188, 64, 22, 'XS201607031603367', 150601, 666, '2016-07-03', '', 1, 666, 0, 0, -1, 1, 0, 0, 0, 8, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0),
(189, 65, 22, 'XS201607031608433', 150601, 666, '2016-07-03', '', 1, 666, 0, 0, -1, 1, 0, 0, 0, 8, -1, 1, '銷售出貨', 0, 0, '', 'SALE', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_type`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_type` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  `number` int(11) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_invoice_type`
--

INSERT INTO `ci_invoice_type` (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES
(1, '其他入库', 1, 1, 'in', 1, 150706),
(2, '盘盈', 1, 1, 'in', 0, 150701),
(3, '其他出库', -1, 1, 'out', 1, 150806),
(4, '盘亏', -1, 1, 'out', 0, 150801);

-- --------------------------------------------------------

--
-- 表的结构 `ci_log`
--

CREATE TABLE IF NOT EXISTS `ci_log` (
  `id` int(11) NOT NULL,
  `userId` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(25) DEFAULT '',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` text COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `loginName` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifyTime` datetime DEFAULT NULL COMMENT '写入日期',
  `operateTypeName` varchar(50) DEFAULT '',
  `adddate` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=496 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_log`
--

INSERT INTO `ci_log` (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES
(1, NULL, '111.197.79.174', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-10 17:04:45', '', '2015-09-10'),
(2, 1, '111.197.79.174', '湘小林', '密码修改成功 UID：1 真实姓名改为：模板俱乐部', 1, 'admin', '2015-09-10 17:07:45', '', '2015-09-10'),
(3, 1, '111.197.79.174', '湘小林', '切换皮肤：blue', 1, 'admin', '2015-09-10 17:07:55', '', '2015-09-10'),
(4, 1, '111.197.79.174', '湘小林', '系统设置成功', 1, 'admin', '2015-09-10 17:08:21', '', '2015-09-10'),
(5, 1, '111.197.79.174', '湘小林', '系统设置成功', 1, 'admin', '2015-09-10 17:08:34', '', '2015-09-10'),
(6, 1, '111.197.75.24', '湘小林', '登陆成功 用户名：admin', 1, 'admin', '2015-09-10 17:20:56', '', '2015-09-10'),
(7, NULL, '111.197.75.24', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-10 17:27:08', '', '2015-09-10'),
(8, NULL, '223.72.255.103', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-24 22:08:02', '', '2015-11-24'),
(9, 1, '223.72.255.103', '模板俱乐部', '密码修改成功 UID：1 真实姓名改为：模板俱乐部', 1, 'admin', '2015-11-24 22:09:02', '', '2015-11-24'),
(10, NULL, '223.72.255.103', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-24 22:09:17', '', '2015-11-24'),
(11, 1, '192.168.72.1', '模板俱乐部', '登陆成功 用户名：admin', 1, 'admin', '2010-06-08 22:42:53', '', '2010-06-08'),
(12, NULL, '192.168.72.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2010-06-08 22:47:08', '', '2010-06-08'),
(13, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：default', 1, 'admin', '2010-06-08 23:23:03', '', '2010-06-08'),
(14, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：blue', 1, 'admin', '2010-06-08 23:23:47', '', '2010-06-08'),
(15, 1, '192.168.72.1', '模板俱乐部', '新增供应商类别:厂家', 1, 'admin', '2010-06-09 00:15:36', '', '2010-06-09'),
(16, 1, '192.168.72.1', '模板俱乐部', '新增客户:中顺洁柔', 1, 'admin', '2010-06-09 00:16:53', '', '2010-06-09'),
(17, 1, '192.168.72.1', '模板俱乐部', '新增仓库:总仓', 1, 'admin', '2010-06-09 00:17:46', '', '2010-06-09'),
(18, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090018020', 1, 'admin', '2010-06-09 00:18:02', '', '2010-06-09'),
(19, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090018093', 1, 'admin', '2010-06-09 00:18:09', '', '2010-06-09'),
(20, 1, '192.168.72.1', '模板俱乐部', '新增单位:条', 1, 'admin', '2010-06-09 00:18:39', '', '2010-06-09'),
(21, 1, '192.168.72.1', '模板俱乐部', '新增单位:包', 1, 'admin', '2010-06-09 00:18:58', '', '2010-06-09'),
(22, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090019165', 1, 'admin', '2010-06-09 00:19:16', '', '2010-06-09'),
(23, 1, '192.168.72.1', '模板俱乐部', '新增商品类别:生活用品', 1, 'admin', '2010-06-09 00:20:24', '', '2010-06-09'),
(24, 1, '192.168.72.1', '模板俱乐部', '切换皮肤：green', 1, 'admin', '2010-06-09 00:29:32', '', '2010-06-09'),
(25, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 00:49:27', '', '2010-06-09'),
(26, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 00:50:13', '', '2010-06-09'),
(27, 1, '192.168.72.1', '模板俱乐部', '系统设置成功', 1, 'admin', '2010-06-09 02:04:41', '', '2010-06-09'),
(28, 1, '192.168.72.1', '模板俱乐部', '新增商品:C&S', 1, 'admin', '2010-06-09 02:25:00', '', '2010-06-09'),
(29, 1, '192.168.72.1', '模板俱乐部', '启用:ID:1', 1, 'admin', '2010-06-09 02:26:00', '', '2010-06-09'),
(30, 1, '192.168.72.1', '模板俱乐部', '修改商品:ID=1名称:C&S法柔国际版', 1, 'admin', '2010-06-09 02:27:26', '', '2010-06-09'),
(31, 1, '192.168.72.1', '模板俱乐部', '启用:ID:1', 1, 'admin', '2010-06-09 02:27:31', '', '2010-06-09'),
(32, 1, '192.168.72.1', '模板俱乐部', '修改商品:ID=1名称:C&S法柔国际版', 1, 'admin', '2010-06-09 02:28:09', '', '2010-06-09'),
(33, 1, '192.168.72.1', '模板俱乐部', '新增商品:C&S可湿水面纸', 1, 'admin', '2010-06-09 02:30:18', '', '2010-06-09'),
(34, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090019165', 1, 'admin', '2010-06-09 02:33:23', '', '2010-06-09'),
(35, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090018093', 1, 'admin', '2010-06-09 02:33:26', '', '2010-06-09'),
(36, 1, '192.168.72.1', '模板俱乐部', '删除购货订单 单据编号：CG201006090018020', 1, 'admin', '2010-06-09 02:33:29', '', '2010-06-09'),
(37, 1, '192.168.72.1', '模板俱乐部', '新增购货 单据编号：CG201006090236073', 1, 'admin', '2010-06-09 02:36:07', '', '2010-06-09'),
(38, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2010-06-09 03:29:48', '', '2010-06-09'),
(39, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-21 23:13:19', '', '2016-01-21'),
(40, 1, '192.168.72.1', '模板俱乐部', '密码修改成功 UID：1 真实姓名改为：系統管理員', 1, 'admin', '2016-01-21 23:20:28', '', '2016-01-21'),
(41, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-22 00:08:52', '', '2016-01-22'),
(42, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-23 15:04:05', '', '2016-01-23'),
(43, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-01-23 15:09:57', '', '2016-01-23'),
(44, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-23 15:10:05', '', '2016-01-23'),
(45, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-23 15:10:12', '', '2016-01-23'),
(46, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-25 01:25:25', '', '2016-01-25'),
(47, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 21:59:25', '', '2016-01-26'),
(48, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:20:29', '', '2016-01-26'),
(49, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:24:51', '', '2016-01-26'),
(50, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:24:56', '', '2016-01-26'),
(51, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:25:03', '', '2016-01-26'),
(52, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-01-26 23:25:08', '', '2016-01-26'),
(53, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:25:22', '', '2016-01-26'),
(54, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:25:27', '', '2016-01-26'),
(55, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:25:36', '', '2016-01-26'),
(56, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:27:34', '', '2016-01-26'),
(57, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:27:41', '', '2016-01-26'),
(58, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:28:26', '', '2016-01-26'),
(59, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:29:59', '', '2016-01-26'),
(60, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-26 23:45:30', '', '2016-01-26'),
(61, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-26 23:45:46', '', '2016-01-26'),
(62, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-26 23:45:51', '', '2016-01-26'),
(63, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-29 01:00:31', '', '2016-01-29'),
(64, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-29 01:00:51', '', '2016-01-29'),
(65, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-01-29 01:01:03', '', '2016-01-29'),
(66, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-01-29 01:15:44', '', '2016-01-29'),
(67, 1, '192.168.72.1', '系統管理員', '新增客户类别:祐漢', 1, 'admin', '2016-01-31 21:59:19', '', '2016-01-31'),
(68, 1, '192.168.72.1', '系統管理員', '新增客户类别:筷子基', 1, 'admin', '2016-01-31 21:59:32', '', '2016-01-31'),
(69, 1, '192.168.72.1', '系統管理員', '新增客户类别:三盞燈', 1, 'admin', '2016-01-31 22:00:14', '', '2016-01-31'),
(70, 1, '192.168.72.1', '系統管理員', '新增客户类别:台山', 1, 'admin', '2016-01-31 22:00:21', '', '2016-01-31'),
(71, 1, '192.168.72.1', '系統管理員', '新增客户类别:中區 新口岸', 1, 'admin', '2016-01-31 22:00:45', '', '2016-01-31'),
(72, 1, '192.168.72.1', '系統管理員', '新增客户类别:氹仔', 1, 'admin', '2016-01-31 22:01:24', '', '2016-01-31'),
(73, 1, '192.168.72.1', '系統管理員', '新增供应商:新記', 1, 'admin', '2016-01-31 22:06:08', '', '2016-01-31'),
(74, 1, '192.168.72.1', '系統管理員', '新增结算方式:即付', 1, 'admin', '2016-01-31 22:10:54', '', '2016-01-31'),
(75, 1, '192.168.72.1', '系統管理員', '新增结算方式:月結', 1, 'admin', '2016-01-31 22:10:59', '', '2016-01-31'),
(76, 1, '192.168.72.1', '系統管理員', '导出客户:customer_20160131221338.xls', 1, 'admin', '2016-01-31 22:13:38', '', '2016-01-31'),
(77, 1, '192.168.72.1', '系統管理員', '新增用户:kychan', 1, 'admin', '2016-01-31 22:24:31', '', '2016-01-31'),
(78, 1, '192.168.72.1', '系統管理員', '更新权限:kychan', 1, 'admin', '2016-01-31 22:26:35', '', '2016-01-31'),
(79, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：kychan', 1, NULL, '2016-01-31 22:26:56', '', '2016-01-31'),
(80, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-31 23:19:25', '', '2016-01-31'),
(81, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-01-31 23:35:32', '', '2016-01-31'),
(82, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-01 21:32:15', '', '2016-02-01'),
(83, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:17:58', '', '2016-02-01'),
(84, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-01 22:18:13', '', '2016-02-01'),
(85, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:18:26', '', '2016-02-01'),
(86, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-01 22:18:37', '', '2016-02-01'),
(87, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:19:05', '', '2016-02-01'),
(88, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-01 22:19:19', '', '2016-02-01'),
(89, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-01 22:21:41', '', '2016-02-01'),
(90, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-01 23:06:07', '', '2016-02-01'),
(91, 1, '192.168.72.1', '系統管理員', '系统设置成功', 1, 'admin', '2016-02-01 23:19:27', '', '2016-02-01'),
(92, 1, '192.168.72.1', '系統管理員', '系统设置成功', 1, 'admin', '2016-02-01 23:20:22', '', '2016-02-01'),
(93, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-02 21:33:12', '', '2016-02-02'),
(94, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-02 23:06:14', '', '2016-02-02'),
(95, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-03 23:10:01', '', '2016-02-03'),
(96, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-02-03 23:10:48', '', '2016-02-03'),
(97, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-03 23:10:57', '', '2016-02-03'),
(98, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-02-03 23:11:09', '', '2016-02-03'),
(99, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-02-03 23:11:16', '', '2016-02-03'),
(100, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-02-03 23:26:17', '', '2016-02-03'),
(101, 1, '192.168.72.1', '系統管理員', '新增购货 单据编号：CG201603152118516', 1, 'admin', '2016-03-15 21:18:52', '', '2016-03-15'),
(102, 1, '192.168.72.1', '系統管理員', '新增销货 单据编号：XS201603152133541', 1, 'admin', '2016-03-15 21:33:54', '', '2016-03-15'),
(103, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-16 23:00:36', '', '2016-03-16'),
(104, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-17 22:43:46', '', '2016-03-17'),
(105, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-18 23:43:01', '', '2016-03-18'),
(106, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-18 23:43:24', '', '2016-03-18'),
(107, 1, '192.168.72.1', '系統管理員', '切换皮肤：blue', 1, 'admin', '2016-03-19 00:52:03', '', '2016-03-19'),
(108, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 00:52:16', '', '2016-03-19'),
(109, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 00:52:35', '', '2016-03-19'),
(110, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 00:52:50', '', '2016-03-19'),
(111, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 00:53:14', '', '2016-03-19'),
(112, 1, '192.168.72.1', '系統管理員', '切换皮肤：green', 1, 'admin', '2016-03-19 01:48:18', '', '2016-03-19'),
(113, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-19 01:48:28', '', '2016-03-19'),
(114, 1, '192.168.72.1', '系統管理員', '修改供应商:榮譽', 1, 'admin', '2016-03-19 12:04:41', '', '2016-03-19'),
(115, 1, '192.168.72.1', '系統管理員', '修改供应商:榮譽', 1, 'admin', '2016-03-19 12:06:37', '', '2016-03-19'),
(116, 1, '192.168.72.1', '系統管理員', '新增供应商:花蓮一品香', 1, 'admin', '2016-03-19 12:07:27', '', '2016-03-19'),
(117, 1, '192.168.72.1', '系統管理員', '新增供应商:周根記', 1, 'admin', '2016-03-19 12:07:52', '', '2016-03-19'),
(118, 1, '192.168.72.1', '系統管理員', '新增供应商:順德建華', 1, 'admin', '2016-03-19 12:08:18', '', '2016-03-19'),
(119, 1, '192.168.72.1', '系統管理員', '新增供应商:齊歡樂', 1, 'admin', '2016-03-19 12:08:44', '', '2016-03-19'),
(120, 1, '192.168.72.1', '系統管理員', '新增供应商:002美食', 1, 'admin', '2016-03-19 12:09:26', '', '2016-03-19'),
(121, 1, '192.168.72.1', '系統管理員', '新增供应商:002美食', 1, 'admin', '2016-03-19 12:09:41', '', '2016-03-19'),
(122, 1, '192.168.72.1', '系統管理員', '新增供应商:其記（鋪）', 1, 'admin', '2016-03-19 12:10:03', '', '2016-03-19'),
(123, 1, '192.168.72.1', '系統管理員', '新增供应商:其記（街市）', 1, 'admin', '2016-03-19 12:10:39', '', '2016-03-19'),
(124, 1, '192.168.72.1', '系統管理員', '新增供应商:牛記', 1, 'admin', '2016-03-19 12:12:42', '', '2016-03-19'),
(125, 1, '192.168.72.1', '系統管理員', '新增供应商:皇子', 1, 'admin', '2016-03-19 12:12:50', '', '2016-03-19'),
(126, 1, '192.168.72.1', '系統管理員', '新增供应商:肥佬', 1, 'admin', '2016-03-19 12:13:01', '', '2016-03-19'),
(127, 1, '192.168.72.1', '系統管理員', '新增供应商:麵店王', 1, 'admin', '2016-03-19 12:13:17', '', '2016-03-19'),
(128, 1, '192.168.72.1', '系統管理員', '新增供应商:好連來', 1, 'admin', '2016-03-19 12:13:27', '', '2016-03-19'),
(129, 1, '192.168.72.1', '系統管理員', '新增供应商:耀發', 1, 'admin', '2016-03-19 12:13:42', '', '2016-03-19'),
(130, 1, '192.168.72.1', '系統管理員', '新增供应商:廣豐', 1, 'admin', '2016-03-19 12:13:57', '', '2016-03-19'),
(131, 1, '192.168.72.1', '系統管理員', '新增供应商:利盛', 1, 'admin', '2016-03-19 12:14:34', '', '2016-03-19'),
(132, 1, '192.168.72.1', '系統管理員', '新增供应商:金豐', 1, 'admin', '2016-03-19 12:14:48', '', '2016-03-19'),
(133, 1, '192.168.72.1', '系統管理員', '新增供应商:泰豐', 1, 'admin', '2016-03-19 12:15:22', '', '2016-03-19'),
(134, 1, '192.168.72.1', '系統管理員', '导出客户:customer_20160319143232.xls', 1, 'admin', '2016-03-19 14:32:32', '', '2016-03-19'),
(135, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319190259.xls', 1, 'admin', '2016-03-19 19:02:59', '', '2016-03-19'),
(136, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319191244.xls', 1, 'admin', '2016-03-19 19:12:44', '', '2016-03-19'),
(137, 1, '192.168.72.1', '系統管理員', '系統登入成功，賬戶名：admin', 1, 'admin', '2016-03-19 23:22:53', '', '2016-03-19'),
(138, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160319232748.xls', 1, 'admin', '2016-03-19 23:27:48', '', '2016-03-19'),
(139, 1, '192.168.72.1', '系統管理員', '导出供应商:supplier_20160320000923.xls', 1, 'admin', '2016-03-20 00:09:23', '', '2016-03-20'),
(140, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-03-23 23:18:55', '', '2016-03-23'),
(141, 1, '192.168.72.1', '系統管理員', '切换皮肤：default', 1, 'admin', '2016-03-23 23:19:48', '', '2016-03-23'),
(142, NULL, '192.168.72.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-05 00:22:11', '', '2016-04-05'),
(143, 1, '192.168.72.1', '系統管理員', '系統參數設置完成', 1, 'admin', '2016-04-05 00:24:21', '', '2016-04-05'),
(144, 1, '192.168.72.1', '系統管理員', '修改销货 单据编号：XS201603152133541', 1, 'admin', '2016-04-05 22:55:10', '', '2016-04-05'),
(145, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 13:43:20', '', '2016-04-12'),
(146, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 14:38:07', '', '2016-04-12'),
(147, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 14:47:03', '', '2016-04-12'),
(148, 1, '::1', '系統管理員', '新增销货 单据编号：XS201604121450524', 1, 'admin', '2016-04-12 14:50:52', '', '2016-04-12'),
(149, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 15:03:39', '', '2016-04-12'),
(150, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-12 16:09:39', '', '2016-04-12'),
(151, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 14:23:51', '', '2016-04-13'),
(152, 1, '192.168.1.104', '系統管理員', '启用:ID:20', 1, 'admin', '2016-04-12 23:58:44', '', '2016-04-12'),
(153, 1, '192.168.1.104', '系統管理員', '启用:ID:20', 1, 'admin', '2016-04-12 23:58:50', '', '2016-04-12'),
(154, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 00:04:10', '', '2016-04-13'),
(155, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 23:52:46', '', '2016-04-13'),
(156, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-13 23:57:14', '', '2016-04-13'),
(157, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-14 23:50:03', '', '2016-04-14'),
(158, 1, '192.168.1.104', '系統管理員', '新增员工:编号A1 名称Jordon', 1, 'admin', '2016-04-14 23:50:42', '', '2016-04-14'),
(159, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-15 22:39:02', '', '2016-04-15'),
(160, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 00:02:34', '', '2016-04-16'),
(161, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 17:08:21', '', '2016-04-16'),
(162, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:27:51', '', '2016-04-16'),
(163, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:36:36', '', '2016-04-16'),
(164, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:36:43', '', '2016-04-16'),
(165, 1, '192.168.1.104', '系統管理員', '新增购货 单据编号：CG201604162146162', 1, 'admin', '2016-04-16 21:46:16', '', '2016-04-16'),
(166, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 21:54:05', '', '2016-04-16'),
(167, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:58:20', '', '2016-04-16'),
(168, 1, '192.168.1.104', '系統管理員', '修改销货 单据编号：XS201604162127513', 1, 'admin', '2016-04-16 21:58:41', '', '2016-04-16'),
(169, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-16 22:48:31', '', '2016-04-16'),
(170, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162248453', 1, 'admin', '2016-04-16 22:48:45', '', '2016-04-16'),
(171, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604162250354', 1, 'admin', '2016-04-16 22:50:35', '', '2016-04-16'),
(172, 1, '192.168.1.104', '系統管理員', '新增购货 单据编号：CG201604162253084', 1, 'admin', '2016-04-16 22:53:08', '', '2016-04-16'),
(173, 1, '192.168.1.104', '系統管理員', '新增账户:01現金', 1, 'admin', '2016-04-16 23:06:50', '', '2016-04-16'),
(174, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 01:04:37', '', '2016-04-17'),
(175, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 01:05:14', '', '2016-04-17'),
(176, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 15:21:09', '', '2016-04-17'),
(177, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 21:17:48', '', '2016-04-17'),
(178, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-17 21:20:00', '', '2016-04-17'),
(179, 1, '192.168.1.104', '系統管理員', '新增用户:zhhuaspace', 1, 'admin', '2016-04-17 21:37:45', '', '2016-04-17'),
(180, 1, '192.168.1.104', '系統管理員', '新增用户:test', 1, 'admin', '2016-04-17 22:19:59', '', '2016-04-17'),
(181, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 00:05:30', '', '2016-04-18'),
(182, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 00:37:33', '', '2016-04-18'),
(183, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:25:21', '', '2016-04-18'),
(184, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:26:48', '', '2016-04-18'),
(185, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:37:10', '', '2016-04-18'),
(186, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 01:37:23', '', '2016-04-18'),
(187, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-04-18 01:55:04', '', '2016-04-18'),
(188, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 02:03:33', '', '2016-04-18'),
(189, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 20:43:55', '', '2016-04-18'),
(190, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 23:13:35', '', '2016-04-18'),
(191, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-18 23:30:14', '', '2016-04-18'),
(192, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:33:55', '', '2016-04-19'),
(193, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:44:39', '', '2016-04-19'),
(194, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 01:50:00', '', '2016-04-19'),
(195, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 20:00:06', '', '2016-04-19'),
(196, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-19 23:27:43', '', '2016-04-19'),
(197, 1, '192.168.1.104', '系統管理員', '导出盘点单据:pdReport_20160420002144.xls', 1, 'admin', '2016-04-20 00:21:44', '', '2016-04-20'),
(198, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:28:48', '', '2016-04-20'),
(199, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:56:12', '', '2016-04-20'),
(200, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 20:57:17', '', '2016-04-20'),
(201, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:00:31', '', '2016-04-20'),
(202, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:36:01', '', '2016-04-20'),
(203, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 21:59:27', '', '2016-04-20'),
(204, 1, '192.168.1.104', '系統管理員', '新增其他入库 单据编号：QTRK201604202245450', 1, 'admin', '2016-04-20 22:45:45', '', '2016-04-20'),
(205, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604202258338', 1, 'admin', '2016-04-20 22:58:33', '', '2016-04-20'),
(206, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-20 23:00:24', '', '2016-04-20'),
(207, 1, '192.168.1.104', '系統管理員', '新增其他出库 单据编号：QTCK201604202349174', 1, 'admin', '2016-04-20 23:49:17', '', '2016-04-20'),
(208, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 20:26:06', '', '2016-04-21'),
(209, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 20:31:31', '', '2016-04-21'),
(210, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 21:27:12', '', '2016-04-21'),
(211, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-21 21:34:22', '', '2016-04-21'),
(212, 1, '192.168.1.104', '系統管理員', '采购明细表导出:pu_detail_20160421222513.xls', 1, 'admin', '2016-04-21 22:25:13', '', '2016-04-21'),
(213, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-22 21:04:37', '', '2016-04-22'),
(214, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-23 03:11:57', '', '2016-04-23'),
(215, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-23 14:11:18', '', '2016-04-23'),
(216, 1, '192.168.1.104', '系統管理員', '修改结算方式:現付', 1, 'admin', '2016-04-23 15:22:20', '', '2016-04-23'),
(217, 1, '192.168.1.104', '系統管理員', '新增销货 单据编号：XS201604240200546', 1, 'admin', '2016-04-24 02:00:54', '', '2016-04-24'),
(218, NULL, '192.168.1.104', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-24 22:56:50', '', '2016-04-24'),
(219, 1, '192.168.1.104', '系統管理員', '新增单位:磅', 1, 'admin', '2016-04-24 23:38:38', '', '2016-04-24'),
(220, 1, '192.168.1.104', '系統管理員', '新增商品:肉燕皮', 1, 'admin', '2016-04-24 23:38:46', '', '2016-04-24'),
(221, 1, '192.168.1.104', '系統管理員', '更新仓库:總倉', 1, 'admin', '2016-04-24 23:43:11', '', '2016-04-24'),
(222, 1, '192.168.1.104', '系統管理員', '修改商品:ID=3名称:肉燕皮', 1, 'admin', '2016-04-24 23:44:05', '', '2016-04-24'),
(223, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-25 22:21:46', '', '2016-04-25'),
(224, 1, '192.168.1.105', '系統管理員', '修改类别:ID=2 名称:麪粉', 1, 'admin', '2016-04-25 22:34:59', '', '2016-04-25'),
(225, 1, '192.168.1.105', '系統管理員', '新增商品:皂角米', 1, 'admin', '2016-04-25 22:39:24', '', '2016-04-25'),
(226, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋麵（幼）', 1, 'admin', '2016-04-25 22:48:04', '', '2016-04-25'),
(227, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋生麵（粗）（明）', 1, 'admin', '2016-04-25 23:06:04', '', '2016-04-25'),
(228, 1, '192.168.1.105', '系統管理員', '新增商品:炒麵（扁炒麵）', 1, 'admin', '2016-04-25 23:10:41', '', '2016-04-25'),
(229, 1, '192.168.1.105', '系統管理員', '新增商品:全蛋伊麵', 1, 'admin', '2016-04-26 00:18:18', '', '2016-04-26'),
(230, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:26', '', '2016-04-26'),
(231, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:31', '', '2016-04-26'),
(232, 1, '192.168.1.105', '系統管理員', '启用:ID:1', 1, 'admin', '2016-04-26 00:36:33', '', '2016-04-26'),
(233, 1, '192.168.1.105', '系統管理員', '啓用:ID:1', 1, 'admin', '2016-04-26 00:40:12', '', '2016-04-26'),
(234, 1, '192.168.1.105', '系統管理員', '啓用:ID:1', 1, 'admin', '2016-04-26 00:40:15', '', '2016-04-26'),
(235, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-26 21:14:01', '', '2016-04-26'),
(236, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:17:21', '', '2016-04-26'),
(237, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:17:46', '', '2016-04-26'),
(238, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-26 22:20:11', '', '2016-04-26'),
(239, 1, '192.168.1.105', '系統管理員', '編輯供應商：金豐', 1, 'admin', '2016-04-26 22:20:34', '', '2016-04-26'),
(240, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-26 23:33:48', '', '2016-04-26'),
(241, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-27 22:13:43', '', '2016-04-27'),
(242, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-27 22:18:34', '', '2016-04-27'),
(243, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:29:52', '', '2016-04-27'),
(244, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:30:02', '', '2016-04-27'),
(245, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:56:38', '', '2016-04-27'),
(246, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 22:56:46', '', '2016-04-27'),
(247, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:09:22', '', '2016-04-27'),
(248, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:17:40', '', '2016-04-27'),
(249, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:18:14', '', '2016-04-27'),
(250, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-04-27 23:20:28', '', '2016-04-27'),
(251, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:30:39', '', '2016-04-27'),
(252, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:30:52', '', '2016-04-27'),
(253, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:31:56', '', '2016-04-27'),
(254, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:33:22', '', '2016-04-27'),
(255, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:26', '', '2016-04-27'),
(256, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:45', '', '2016-04-27'),
(257, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:53:53', '', '2016-04-27'),
(258, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:54:09', '', '2016-04-27'),
(259, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-04-27 23:56:15', '', '2016-04-27'),
(260, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-27 23:56:35', '', '2016-04-27'),
(261, 1, '192.168.1.105', '系統管理員', '編輯供應商：泰豐', 1, 'admin', '2016-04-27 23:56:43', '', '2016-04-27'),
(262, 1, '192.168.1.105', '系統管理員', '新增商品类别:123', 1, 'admin', '2016-04-27 23:58:00', '', '2016-04-27'),
(263, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-04-27 23:58:06', '', '2016-04-27'),
(264, 1, '192.168.1.105', '系統管理員', '新增供应商类别:載', 1, 'admin', '2016-04-27 23:58:34', '', '2016-04-27'),
(265, 1, '192.168.1.105', '系統管理員', '删除供应商类别:ID=12 名称:載', 1, 'admin', '2016-04-27 23:58:42', '', '2016-04-27'),
(266, 1, '192.168.1.105', '系統管理員', '删除供应商类别:ID=12 名称:載', 1, 'admin', '2016-04-27 23:59:03', '', '2016-04-27'),
(267, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-28 23:52:52', '', '2016-04-28'),
(268, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201604290041402', 1, 'admin', '2016-04-29 00:41:40', '', '2016-04-29'),
(269, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-04-30 22:22:10', '', '2016-04-30'),
(270, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-01 09:20:13', '', '2016-05-01'),
(271, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605010920543', 1, 'admin', '2016-05-01 09:20:54', '', '2016-05-01'),
(272, 1, '192.168.1.105', '系統管理員', '系統登入成功，賬戶名：admin', 1, 'admin', '2016-05-01 09:32:56', '', '2016-05-01'),
(273, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-01 22:28:06', '', '2016-05-01'),
(274, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201604121450524', 1, 'admin', '2016-05-02 01:35:01', '', '2016-05-02'),
(275, 1, '192.168.1.105', '系統管理員', '新增客戶：乐華麪粉廠', 1, 'admin', '2016-05-02 21:04:03', '', '2016-05-02'),
(276, 1, '192.168.1.105', '系統管理員', '新增购货 单据编号：CG201605022104538', 1, 'admin', '2016-05-02 21:04:53', '', '2016-05-02'),
(277, 1, '192.168.1.105', '系統管理員', '新增销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-02 21:05:02', '', '2016-05-02'),
(278, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022238279', 1, 'admin', '2016-05-02 22:38:27', '', '2016-05-02'),
(279, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022239250', 1, 'admin', '2016-05-02 22:39:25', '', '2016-05-02'),
(280, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605022310118', 1, 'admin', '2016-05-02 23:10:11', '', '2016-05-02'),
(281, 1, '192.168.1.105', '系統管理員', '修改购货单 单据编号：CG201605022104538', 1, 'admin', '2016-05-03 00:14:09', '', '2016-05-03'),
(282, 1, '192.168.1.105', '系統管理員', '修改购货单 单据编号：CG201605022104538', 1, 'admin', '2016-05-03 00:15:56', '', '2016-05-03'),
(283, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 00:48:26', '', '2016-05-03'),
(284, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:30:23', '', '2016-05-03'),
(285, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:38:16', '', '2016-05-03'),
(286, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022239250', 1, 'admin', '2016-05-03 01:41:28', '', '2016-05-03'),
(287, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022105023', 1, 'admin', '2016-05-03 01:42:14', '', '2016-05-03'),
(288, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030143343', 1, 'admin', '2016-05-03 01:43:34', '', '2016-05-03'),
(289, 1, '192.168.1.105', '系統管理員', '更新仓库:默認倉', 1, 'admin', '2016-05-03 01:43:56', '', '2016-05-03'),
(290, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605030143343', 1, 'admin', '2016-05-03 01:49:21', '', '2016-05-03'),
(291, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022310118', 1, 'admin', '2016-05-03 01:49:51', '', '2016-05-03'),
(292, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030206443', 1, 'admin', '2016-05-03 02:06:44', '', '2016-05-03'),
(293, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605030206443', 1, 'admin', '2016-05-03 02:08:18', '', '2016-05-03'),
(294, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030208388', 1, 'admin', '2016-05-03 02:08:38', '', '2016-05-03'),
(295, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605030209108', 1, 'admin', '2016-05-03 02:09:10', '', '2016-05-03'),
(296, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-03 21:01:55', '', '2016-05-03'),
(297, 1, '192.168.1.105', '系統管理員', '修改销货 单据编号：XS201605022238279', 1, 'admin', '2016-05-03 22:41:59', '', '2016-05-03'),
(298, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605032344085', 1, 'admin', '2016-05-03 23:44:08', '', '2016-05-03'),
(299, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605032344217', 1, 'admin', '2016-05-03 23:44:21', '', '2016-05-03'),
(300, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-04 22:13:36', '', '2016-05-04'),
(301, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605042240023', 1, 'admin', '2016-05-04 22:40:02', '', '2016-05-04'),
(302, 1, '192.168.1.105', '系統管理員', '新增出貨 單據編號：XS201605042356329', 1, 'admin', '2016-05-04 23:56:32', '', '2016-05-04'),
(303, 1, '192.168.1.105', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-04 23:57:50', '', '2016-05-04'),
(304, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050006242', 1, 'admin', '2016-05-05 00:06:24', '', '2016-05-05'),
(305, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050015496', 1, 'admin', '2016-05-05 00:15:49', '', '2016-05-05'),
(306, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050023003', 1, 'admin', '2016-05-05 00:23:00', '', '2016-05-05'),
(307, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050023347', 1, 'admin', '2016-05-05 00:23:34', '', '2016-05-05'),
(308, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050024297', 1, 'admin', '2016-05-05 00:24:29', '', '2016-05-05'),
(309, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050024370', 1, 'admin', '2016-05-05 00:24:37', '', '2016-05-05'),
(310, 1, '192.168.1.105', '系統管理員', '新增成本调整 单据编号：CBTZ201605050118415', 1, 'admin', '2016-05-05 01:18:41', '', '2016-05-05'),
(311, 1, '192.168.1.105', '系統管理員', '修改成本调整 单据编号：CBTZ201605050118415', 1, 'admin', '2016-05-05 01:26:12', '', '2016-05-05'),
(312, 1, '192.168.1.105', '系統管理員', '新增收款单 单据编号：SKD201605050128303', 1, 'admin', '2016-05-05 01:28:30', '', '2016-05-05'),
(313, 1, '192.168.1.105', '系統管理員', '編輯客戶：乐華麪粉廠', 1, 'admin', '2016-05-05 01:49:47', '', '2016-05-05'),
(314, 1, '192.168.1.105', '系統管理員', '編輯客戶：中顺洁柔', 1, 'admin', '2016-05-05 02:11:48', '', '2016-05-05'),
(315, 1, '192.168.1.105', '系統管理員', '編輯客戶：乐華麪粉廠', 1, 'admin', '2016-05-05 02:12:16', '', '2016-05-05'),
(316, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:14:14', '', '2016-05-05'),
(317, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:16:51', '', '2016-05-05'),
(318, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:19:20', '', '2016-05-05'),
(319, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:123', 1, 'admin', '2016-05-05 02:22:11', '', '2016-05-05'),
(320, 1, '192.168.1.105', '系統管理員', '修改类别:ID=11 名称:1234', 1, 'admin', '2016-05-05 02:26:14', '', '2016-05-05'),
(321, 1, '192.168.1.105', '系統管理員', '删除商品类别:ID=11 名称:1234', 1, 'admin', '2016-05-05 02:27:57', '', '2016-05-05'),
(322, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-05 22:12:20', '', '2016-05-05'),
(323, NULL, '192.168.1.105', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-05 22:22:46', '', '2016-05-05'),
(324, NULL, '192.168.1.100', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:25:25', '', '2016-05-06'),
(325, NULL, '192.168.1.101', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:50:18', '', '2016-05-06'),
(326, NULL, '192.168.1.101', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:50:49', '', '2016-05-06'),
(327, NULL, '192.168.1.100', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:54:00', '', '2016-05-06'),
(328, NULL, '127.0.0.1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-06 00:54:45', '', '2016-05-06'),
(329, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-14 15:52:18', '', '2016-05-14'),
(330, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-15 18:57:00', '', '2016-05-15'),
(331, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-16 19:59:27', '', '2016-05-16'),
(332, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605162002312', 1, 'admin', '2016-05-16 20:02:31', '', '2016-05-16'),
(333, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605162003150', 1, 'admin', '2016-05-16 20:03:15', '', '2016-05-16'),
(334, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-18 20:07:48', '', '2016-05-18'),
(335, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-18 20:21:41', '', '2016-05-18'),
(336, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605182030418', 1, 'admin', '2016-05-18 20:30:41', '', '2016-05-18'),
(337, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605182031042', 1, 'admin', '2016-05-18 20:31:04', '', '2016-05-18'),
(338, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-23 22:44:32', '', '2016-05-23'),
(339, 1, '::1', '系統管理員', '新增商品类别:食品', 1, 'admin', '2016-05-23 23:39:19', '', '2016-05-23'),
(340, 1, '::1', '系統管理員', '新增商品类别:食品', 1, 'admin', '2016-05-23 23:39:31', '', '2016-05-23'),
(341, 1, '::1', '系統管理員', '新增商品类别:食品', 1, 'admin', '2016-05-23 23:39:40', '', '2016-05-23'),
(342, 1, '::1', '系統管理員', '删除商品类别:ID=13 名称:食品', 1, 'admin', '2016-05-23 23:45:53', '', '2016-05-23'),
(343, 1, '::1', '系統管理員', '删除商品类别:ID=14 名称:食品', 1, 'admin', '2016-05-23 23:45:56', '', '2016-05-23'),
(344, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-23 23:47:27', '', '2016-05-23'),
(345, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-24 21:19:09', '', '2016-05-24'),
(346, 1, '::1', '系統管理員', '新增购货 单据编号：CG201605242122052', 1, 'admin', '2016-05-24 21:22:05', '', '2016-05-24'),
(347, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 22:51:02', '', '2016-05-24'),
(348, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 22:54:43', '', '2016-05-24'),
(349, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:01:29', '', '2016-05-24'),
(350, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:04:04', '', '2016-05-24'),
(351, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:06:06', '', '2016-05-24'),
(352, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:07:05', '', '2016-05-24'),
(353, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:07:39', '', '2016-05-24'),
(354, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:09:18', '', '2016-05-24'),
(355, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:09:55', '', '2016-05-24'),
(356, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:45:20', '', '2016-05-24'),
(357, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-24 23:53:42', '', '2016-05-24'),
(358, 1, '::1', '系統管理員', '新增商品:奶粉', 1, 'admin', '2016-05-25 00:34:20', '', '2016-05-25'),
(359, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-25 20:43:20', '', '2016-05-25'),
(360, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605252045229', 1, 'admin', '2016-05-25 20:45:22', '', '2016-05-25'),
(361, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-25 23:40:39', '', '2016-05-25'),
(362, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605252348182', 1, 'admin', '2016-05-25 23:48:18', '', '2016-05-25'),
(363, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605252348182', 1, 'admin', '2016-05-26 00:49:12', '', '2016-05-26'),
(364, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-26 20:55:41', '', '2016-05-26'),
(365, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201605262120037', 1, 'admin', '2016-05-26 21:20:03', '', '2016-05-26'),
(366, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-27 20:53:53', '', '2016-05-27'),
(367, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-29 15:30:53', '', '2016-05-29'),
(368, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-29 21:36:44', '', '2016-05-29'),
(369, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-29 21:37:08', '', '2016-05-29'),
(370, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-29 21:44:58', '', '2016-05-29'),
(371, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-29 21:52:19', '', '2016-05-29'),
(372, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-29 22:48:23', '', '2016-05-29'),
(373, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-30 01:12:42', '', '2016-05-30'),
(374, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-30 01:13:36', '', '2016-05-30'),
(375, 1, '::1', '系統管理員', '修改销货 单据编号：XS201605262120037', 1, 'admin', '2016-05-30 01:15:46', '', '2016-05-30'),
(376, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-05-30 21:43:21', '', '2016-05-30'),
(377, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-05-30 21:48:10', '', '2016-05-30'),
(378, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-05-30 23:47:21', '', '2016-05-30'),
(379, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-05-31 00:13:38', '', '2016-05-31'),
(380, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:15:51', '', '2016-05-31'),
(381, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:18:20', '', '2016-05-31'),
(382, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:29:51', '', '2016-05-31'),
(383, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:30:07', '', '2016-05-31'),
(384, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:32:33', '', '2016-05-31'),
(385, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-05-31 00:46:18', '', '2016-05-31'),
(386, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-05-31 00:46:28', '', '2016-05-31'),
(387, 1, '::1', '系統管理員', '新增单位:千克', 1, 'admin', '2016-05-31 01:01:15', '', '2016-05-31'),
(388, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-31 01:56:31', '', '2016-05-31'),
(389, 1, '::1', '系統管理員', '修改商品:ID=8名称:全蛋伊麵', 1, 'admin', '2016-05-31 01:56:56', '', '2016-05-31'),
(390, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-06-15 15:46:26', '', '2016-06-15'),
(391, 1, '::1', '系統管理員', '修改商品:ID=11名称:ddd', 1, 'admin', '2016-06-15 16:00:56', '', '2016-06-15'),
(392, 1, '::1', '系統管理員', '修改商品:ID=9名称:奶粉', 1, 'admin', '2016-06-15 16:02:07', '', '2016-06-15'),
(393, 1, '::1', '系統管理員', '修改商品:ID=9名称:奶粉', 1, 'admin', '2016-06-15 16:02:12', '', '2016-06-15'),
(394, 1, '::1', '系統管理員', '新增商品:测试', 1, 'admin', '2016-06-15 16:02:56', '', '2016-06-15'),
(395, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-15 16:05:37', '', '2016-06-15'),
(396, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-15 16:06:18', '', '2016-06-15'),
(397, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-06-15 16:10:55', '', '2016-06-15'),
(398, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-15 16:14:09', '', '2016-06-15'),
(399, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151615059', 1, 'admin', '2016-06-15 16:15:05', '', '2016-06-15'),
(400, 1, '::1', '系統管理員', '修改销货 单据编号：XS201606151615059', 1, 'admin', '2016-06-15 16:15:26', '', '2016-06-15'),
(401, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151617327', 1, 'admin', '2016-06-15 16:17:32', '', '2016-06-15'),
(402, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151618080', 1, 'admin', '2016-06-15 16:18:08', '', '2016-06-15'),
(403, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151619344', 1, 'admin', '2016-06-15 16:19:34', '', '2016-06-15'),
(404, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151630264', 1, 'admin', '2016-06-15 16:30:26', '', '2016-06-15'),
(405, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151632324', 1, 'admin', '2016-06-15 16:32:32', '', '2016-06-15'),
(406, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-06-15 16:44:50', '', '2016-06-15'),
(407, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151645160', 1, 'admin', '2016-06-15 16:45:17', '', '2016-06-15'),
(408, 1, '::1', '系統管理員', '新增单位:kg', 1, 'admin', '2016-06-15 16:49:44', '', '2016-06-15'),
(409, 1, '::1', '系統管理員', '新增单位:g', 1, 'admin', '2016-06-15 16:50:24', '', '2016-06-15'),
(410, 1, '::1', '系統管理員', '新增单位:克', 1, 'admin', '2016-06-15 16:51:37', '', '2016-06-15'),
(411, 1, '::1', '系統管理員', '更新单位:克', 1, 'admin', '2016-06-15 16:57:28', '', '2016-06-15'),
(412, 1, '::1', '系統管理員', '新增单位:斤', 1, 'admin', '2016-06-15 16:58:48', '', '2016-06-15'),
(413, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-15 17:06:16', '', '2016-06-15'),
(414, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151706575', 1, 'admin', '2016-06-15 17:06:57', '', '2016-06-15'),
(415, 1, '::1', '系統管理員', '新增单位:份', 1, 'admin', '2016-06-15 17:14:33', '', '2016-06-15'),
(416, 1, '::1', '系統管理員', '更新单位:斤', 1, 'admin', '2016-06-15 17:15:31', '', '2016-06-15'),
(417, 1, '::1', '系統管理員', '更新单位:斤', 1, 'admin', '2016-06-15 17:16:03', '', '2016-06-15'),
(418, 1, '::1', '系統管理員', '更新单位:斤', 1, 'admin', '2016-06-15 17:16:22', '', '2016-06-15'),
(419, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-06-15 17:24:11', '', '2016-06-15'),
(420, 1, '::1', '系統管理員', '更新单位:磅', 1, 'admin', '2016-06-15 17:24:25', '', '2016-06-15'),
(421, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-15 17:25:41', '', '2016-06-15'),
(422, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606151726428', 1, 'admin', '2016-06-15 17:26:42', '', '2016-06-15'),
(423, 1, '::1', '系統管理員', '修改商品:ID=6名称:全蛋生麵（粗）（明）', 1, 'admin', '2016-06-15 17:29:40', '', '2016-06-15'),
(424, 1, '::1', '系統管理員', '修改商品:ID=6名称:全蛋生麵（粗）（明）', 1, 'admin', '2016-06-15 17:29:47', '', '2016-06-15'),
(425, 1, '::1', '系統管理員', '新增单位:admin', 1, 'admin', '2016-06-15 17:31:04', '', '2016-06-15'),
(426, 1, '::1', '系統管理員', '新增商品:测试1', 1, 'admin', '2016-06-15 17:31:37', '', '2016-06-15'),
(427, 1, '::1', '系統管理員', '修改商品:ID=11名称:测试1', 1, 'admin', '2016-06-15 17:32:20', '', '2016-06-15'),
(428, 1, '::1', '系統管理員', '修改商品:ID=11名称:测试1', 1, 'admin', '2016-06-18 14:09:03', '', '2016-06-18'),
(429, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-06-18 14:09:29', '', '2016-06-18'),
(430, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201606181411344', 1, 'admin', '2016-06-18 14:11:34', '', '2016-06-18'),
(431, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-06-19 14:15:00', '', '2016-06-19'),
(432, NULL, '::1', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-07-01 22:33:03', '', '2016-07-01'),
(433, NULL, '::1', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-07-01 22:34:47', '', '2016-07-01'),
(434, NULL, '::1', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-07-01 22:52:58', '', '2016-07-01'),
(435, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-07-01 22:53:06', '', '2016-07-01'),
(436, 1, '::1', '系統管理員', '新增购货 单据编号：CG201607012257194', 1, 'admin', '2016-07-01 22:57:20', '', '2016-07-01'),
(437, NULL, '::1', NULL, '系統登入成功，賬戶名：test', 1, NULL, '2016-07-01 23:02:13', '', '2016-07-01'),
(438, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-07-01 23:02:30', '', '2016-07-01'),
(439, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-07-01 23:02:53', '', '2016-07-01'),
(440, NULL, '::1', NULL, '系統登入成功，賬戶名：admin', 1, NULL, '2016-07-01 23:05:49', '', '2016-07-01'),
(441, 1, '::1', '系統管理員', '更新单位:admin', 1, 'admin', '2016-07-01 23:35:33', '', '2016-07-01'),
(442, 1, '::1', '系統管理員', '更新单位:admin', 1, 'admin', '2016-07-01 23:35:46', '', '2016-07-01'),
(443, 1, '::1', '系統管理員', '更新单位:份', 1, 'admin', '2016-07-01 23:36:06', '', '2016-07-01'),
(444, 1, '::1', '系統管理員', '更新单位:份', 1, 'admin', '2016-07-01 23:36:24', '', '2016-07-01'),
(445, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-07-01 23:42:04', '', '2016-07-01'),
(446, 1, '::1', '系統管理員', '修改商品:ID=10名称:测试', 1, 'admin', '2016-07-01 23:42:09', '', '2016-07-01'),
(447, 1, '::1', '系統管理員', '修改商品:ID=5名称:全蛋麵（幼）', 1, 'admin', '2016-07-01 23:42:33', '', '2016-07-01'),
(448, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607020009229', 1, 'admin', '2016-07-02 00:09:23', '', '2016-07-02'),
(449, 1, '::1', '系統管理員', '更新单位:条', 1, 'admin', '2016-07-02 00:18:28', '', '2016-07-02'),
(450, 1, '::1', '系統管理員', '新增单位:t', 1, 'admin', '2016-07-02 15:31:30', '', '2016-07-02'),
(451, 1, '::1', '系統管理員', '删除单位:ID=11 名称:t', 1, 'admin', '2016-07-02 15:31:37', '', '2016-07-02'),
(452, 1, '::1', '系統管理員', '删除单位:ID=1 名称:条', 1, 'admin', '2016-07-02 15:32:58', '', '2016-07-02'),
(453, 1, '::1', '系統管理員', '新增单位:t', 1, 'admin', '2016-07-02 15:43:24', '', '2016-07-02'),
(454, 1, '::1', '系統管理員', '删除单位:ID=12 名称:t', 1, 'admin', '2016-07-02 15:43:52', '', '2016-07-02'),
(455, 1, '::1', '系統管理員', '新增单位:t', 1, 'admin', '2016-07-02 15:43:55', '', '2016-07-02'),
(456, 1, '::1', '系統管理員', '新增商品:MKMK', 1, 'admin', '2016-07-02 16:12:06', '', '2016-07-02'),
(457, 1, '::1', '系統管理員', '新增商品:JJJJ', 1, 'admin', '2016-07-02 16:19:36', '', '2016-07-02'),
(458, 1, '::1', '系統管理員', '新增商品:ooo', 1, 'admin', '2016-07-02 16:30:12', '', '2016-07-02'),
(459, 1, '::1', '系統管理員', '系統登入成功，賬戶名：admin', 1, 'admin', '2016-07-03 08:51:59', '', '2016-07-03'),
(460, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 10:09:56', '', '2016-07-03'),
(461, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 10:10:28', '', '2016-07-03'),
(462, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 10:18:23', '', '2016-07-03'),
(463, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:27:36', '', '2016-07-03'),
(464, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:28:08', '', '2016-07-03'),
(465, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:29:29', '', '2016-07-03'),
(466, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:30:02', '', '2016-07-03'),
(467, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:30:43', '', '2016-07-03'),
(468, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:33:38', '', '2016-07-03'),
(469, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:34:09', '', '2016-07-03'),
(470, 1, '::1', '系統管理員', '更新单位:', 1, 'admin', '2016-07-03 10:36:05', '', '2016-07-03'),
(471, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 10:45:12', '', '2016-07-03'),
(472, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 10:47:00', '', '2016-07-03'),
(473, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 11:01:40', '', '2016-07-03'),
(474, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 11:02:07', '', '2016-07-03'),
(475, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 11:02:17', '', '2016-07-03'),
(476, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 11:02:53', '', '2016-07-03'),
(477, 1, '::1', '系統管理員', '更新单位:bbbb', 1, 'admin', '2016-07-03 11:04:31', '', '2016-07-03'),
(478, 1, '::1', '系統管理員', '導出銷售單據:sales_record_20160703110954.xls', 1, 'admin', '2016-07-03 11:09:54', '', '2016-07-03'),
(479, 1, '::1', '系統管理員', '新增单位:eee', 1, 'admin', '2016-07-03 11:12:53', '', '2016-07-03'),
(480, 1, '::1', '系統管理員', '删除单位:ID=14 名称:eee', 1, 'admin', '2016-07-03 11:13:03', '', '2016-07-03'),
(481, 1, '::1', '系統管理員', '更新单位:包', 1, 'admin', '2016-07-03 11:13:53', '', '2016-07-03'),
(482, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607031117478', 1, 'admin', '2016-07-03 11:17:47', '', '2016-07-03'),
(483, 1, '::1', '系統管理員', '新增供應商：TTT', 1, 'admin', '2016-07-03 11:19:25', '', '2016-07-03'),
(484, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607031125077', 1, 'admin', '2016-07-03 11:25:07', '', '2016-07-03'),
(485, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607031126178', 1, 'admin', '2016-07-03 11:26:18', '', '2016-07-03'),
(486, 1, '::1', '系統管理員', '修改商品:ID=6名称:全蛋生麵（粗）（明）', 1, 'admin', '2016-07-03 13:52:45', '', '2016-07-03'),
(487, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 13:55:47', '', '2016-07-03'),
(488, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 13:57:54', '', '2016-07-03');
INSERT INTO `ci_log` (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES
(489, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 13:58:22', '', '2016-07-03'),
(490, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 13:59:05', '', '2016-07-03'),
(491, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 16:03:30', '', '2016-07-03'),
(492, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607031603367', 1, 'admin', '2016-07-03 16:05:59', '', '2016-07-03'),
(493, 1, '::1', '系統管理員', '新增出貨 單據編號：XS201607031608433', 1, 'admin', '2016-07-03 16:09:16', '', '2016-07-03'),
(494, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 18:50:32', '', '2016-07-03'),
(495, 1, '::1', '系統管理員', '修改商品:ID=13名称:JJJJ', 1, 'admin', '2016-07-03 18:54:28', '', '2016-07-03');

-- --------------------------------------------------------

--
-- 表的结构 `ci_menu`
--

CREATE TABLE IF NOT EXISTS `ci_menu` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
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
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_menu`
--

INSERT INTO `ci_menu` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES
(1, ' 入貨單', 0, '', 1, 2, 1, 'trade', 1, 0, 0, ''),
(2, '新增', 1, '1,2', 2, 1, 1, 'trade', 1, 0, 0, ''),
(3, '修改', 1, '1,3', 2, 2, 1, 'trade', 1, 0, 0, ''),
(4, '刪除', 1, '1,4', 2, 3, 1, 'trade', 1, 0, 0, ''),
(5, '導出', 1, '1,5', 2, 4, 1, 'trade', 1, 0, 0, ''),
(6, '出貨單', 0, '6', 1, 1, 1, 'trade', 1, 0, 0, ''),
(7, '新增', 6, '6,7', 2, 1, 1, 'trade', 1, 0, 0, ''),
(8, '修改', 6, '6,8', 2, 2, 1, 'trade', 1, 0, 0, ''),
(9, '刪除', 6, '6,9', 2, 3, 1, 'trade', 1, 0, 0, ''),
(10, '導出', 6, '6,10', 2, 4, 1, 'trade', 1, 0, 0, ''),
(11, '盤點', 0, '11', 1, 99, 1, 'trade', 1, 0, 0, ''),
(12, '生成盤點記錄', 11, '11,12', 2, 99, 1, 'trade', 1, 0, 0, ''),
(13, '導出', 11, '11,13', 2, 2, 1, 'trade', 1, 0, 0, ''),
(14, '其他入庫單', 0, '14', 1, 99, 1, 'trade', 1, 0, 0, ''),
(15, '新增', 14, '14,15', 2, 1, 1, 'trade', 1, 0, 0, ''),
(16, '修改', 14, '14,16', 2, 2, 1, 'trade', 1, 0, 0, ''),
(17, '刪除', 14, '14,17', 2, 3, 1, 'trade', 1, 0, 0, ''),
(18, '其他出庫單', 0, '18', 1, 99, 1, 'trade', 1, 0, 0, ''),
(19, '新增', 18, '18,19', 2, 1, 1, 'trade', 1, 0, 0, ''),
(20, '修改', 18, '18,20', 2, 2, 1, 'trade', 1, 0, 0, ''),
(21, '刪除', 18, '18,21', 2, 3, 1, 'trade', 1, 0, 0, ''),
(22, '入貨明細表', 0, '22', 1, 99, 1, 'trade', 1, 0, 0, ''),
(23, '導出', 22, '22,23', 2, 99, 1, 'trade', 1, 0, 0, ''),
(24, '列印', 22, '22,24', 2, 99, 1, 'trade', 1, 0, 0, ''),
(25, '入貨匯總表（按商品）', 0, '25', 1, 99, 1, 'trade', 1, 0, 0, ''),
(26, '導出', 25, '25,26', 2, 99, 1, 'trade', 1, 0, 0, ''),
(27, '列印', 25, '25,27', 2, 99, 1, 'trade', 1, 0, 0, ''),
(28, '入貨匯總表（按供應商）', 0, '28', 1, 99, 1, 'trade', 1, 0, 0, ''),
(29, '導出 ', 28, '28,29', 2, 99, 1, 'trade', 1, 0, 0, ''),
(30, '列印', 28, '28,30', 2, 99, 1, 'trade', 1, 0, 0, ''),
(31, '出貨明細表', 0, '31', 1, 99, 1, 'trade', 1, 0, 0, ''),
(32, '導出 ', 31, '31,32', 2, 99, 1, 'trade', 1, 0, 0, ''),
(33, '列印', 31, '31,33', 2, 99, 1, 'trade', 1, 0, 0, ''),
(34, '出貨匯總表（按商品）', 0, '34', 1, 99, 1, 'trade', 1, 0, 0, ''),
(35, '導出 ', 34, '34,35', 2, 99, 1, 'trade', 1, 0, 0, ''),
(36, '列印', 34, '34,36', 2, 99, 1, 'trade', 1, 0, 0, ''),
(37, '出貨匯總表（按客戶）', 0, '37', 1, 99, 1, 'trade', 1, 0, 0, ''),
(38, '導出 ', 37, '37,38', 2, 99, 1, 'trade', 1, 0, 0, ''),
(39, '列印', 37, '37,39', 2, 99, 1, 'trade', 1, 0, 0, ''),
(40, '商品庫存餘額表', 0, '40', 1, 99, 1, 'trade', 1, 0, 0, ''),
(41, '導出 ', 40, '40,41', 2, 99, 1, 'trade', 1, 0, 0, ''),
(42, '列印', 40, '40,42', 2, 99, 1, 'trade', 1, 0, 0, ''),
(43, '商品出入明細表', 0, '43', 1, 99, 1, 'trade', 1, 0, 0, ''),
(44, '導出 ', 43, '43,44', 2, 99, 1, 'trade', 1, 0, 0, ''),
(45, '列印', 43, '43,45', 2, 99, 1, 'trade', 1, 0, 0, ''),
(46, '商品出入匯總表', 0, '46', 1, 99, 1, 'trade', 1, 0, 0, ''),
(47, '導出 ', 46, '46,47', 2, 99, 1, 'trade', 1, 0, 0, ''),
(48, '列印', 46, '46,48', 2, 99, 1, 'trade', 1, 0, 0, ''),
(49, '來往單位欠款表', 0, '49', 1, 99, 1, 'trade', 1, 0, 0, ''),
(50, '導出 ', 49, '49,50', 2, 99, 1, 'trade', 1, 0, 0, ''),
(51, '列印', 49, '49,51', 2, 99, 1, 'trade', 1, 0, 0, ''),
(52, '應付賬款明細表', 0, '52', 1, 99, 1, 'trade', 1, 0, 0, ''),
(53, '導出 ', 52, '52,53', 2, 99, 1, 'trade', 1, 0, 0, ''),
(54, '列印', 52, '52,54', 2, 99, 1, 'trade', 1, 0, 0, ''),
(55, '應收賬款明細表', 0, '55', 1, 99, 1, 'trade', 1, 0, 0, ''),
(56, '導出 ', 55, '55,56', 2, 99, 1, 'trade', 1, 0, 0, ''),
(57, '列印', 55, '55,57', 2, 99, 1, 'trade', 1, 0, 0, ''),
(58, '客戶管理', 0, '58', 1, 99, 1, 'trade', 1, 0, 0, ''),
(59, '新增', 58, '58,59', 2, 99, 1, 'trade', 1, 0, 0, ''),
(60, '修改', 58, '58,60', 2, 99, 1, 'trade', 1, 0, 0, ''),
(61, '删除', 58, '58,61', 2, 99, 1, 'trade', 1, 0, 0, ''),
(62, '導出 ', 58, '58,62', 2, 99, 1, 'trade', 1, 0, 0, ''),
(63, '供應商管理', 0, '63', 1, 99, 1, 'trade', 1, 0, 0, ''),
(64, '新增', 63, '63,64', 2, 99, 1, 'trade', 1, 0, 0, ''),
(65, '修改', 63, '63,65', 2, 99, 1, 'trade', 1, 0, 0, ''),
(66, '删除', 63, '63,66', 2, 99, 1, 'trade', 1, 0, 0, ''),
(67, '導出 ', 63, '63,67', 2, 99, 1, 'trade', 1, 0, 0, ''),
(68, '商品管理', 0, '68', 1, 99, 1, 'trade', 1, 0, 0, ''),
(69, '新增', 68, '68,69', 2, 99, 1, 'trade', 1, 0, 0, ''),
(70, '修改', 68, '68,70', 2, 99, 1, 'trade', 1, 0, 0, ''),
(71, '删除', 68, '68,71', 2, 99, 1, 'trade', 1, 0, 0, ''),
(72, '導出 ', 68, '68,72', 2, 99, 1, 'trade', 1, 0, 0, ''),
(73, '客戶分類', 0, '73', 1, 99, 1, 'trade', 1, 0, 0, ''),
(74, '新增', 73, '73,74', 2, 99, 1, 'trade', 1, 0, 0, ''),
(75, '修改', 73, '73,75', 2, 99, 1, 'trade', 1, 0, 0, ''),
(76, '删除', 73, '73,76', 2, 99, 1, 'trade', 1, 0, 0, ''),
(77, '計量單元', 0, '77', 1, 99, 1, 'trade', 1, 0, 0, ''),
(78, '新增', 77, '77,78', 2, 99, 1, 'trade', 1, 0, 0, ''),
(79, '修改', 77, '77,79', 2, 99, 1, 'trade', 1, 0, 0, ''),
(80, '删除', 77, '77,80', 2, 99, 1, 'trade', 1, 0, 0, ''),
(81, '系統參數', 0, '81', 1, 99, 1, 'trade', 1, 0, 0, ''),
(82, '管理權限', 0, '82', 1, 99, 1, 'trade', 1, 0, 0, ''),
(83, '操作日誌', 0, '83', 1, 99, 1, 'trade', 1, 0, 0, ''),
(84, '數據備份', 0, '84', 1, 99, 0, 'trade', 1, 0, 0, ''),
(85, '列印', 1, '1,85', 2, 99, 1, 'trade', 1, 0, 0, ''),
(86, '審覈', 1, '1,86', 2, 99, 1, 'trade', 1, 0, 0, ''),
(87, '反審覈', 1, '1,87', 2, 99, 1, 'trade', 1, 0, 0, ''),
(88, '列印', 6, '6,88', 2, 99, 1, 'trade', 1, 0, 0, ''),
(89, '審覈', 6, '6,89', 2, 99, 1, 'trade', 1, 0, 0, ''),
(90, '反審覈', 6, '6,90', 2, 99, 1, 'trade', 1, 0, 0, ''),
(91, '停用', 58, '58,91', 2, 99, 1, 'trade', 1, 0, 0, ''),
(92, '啓用', 58, '58,92', 2, 99, 1, 'trade', 1, 0, 0, ''),
(93, '停用', 63, '63,93', 2, 99, 1, 'trade', 1, 0, 0, ''),
(94, '啓用', 63, '63,94', 2, 99, 1, 'trade', 1, 0, 0, ''),
(95, '停用', 68, '68,95', 2, 99, 1, 'trade', 1, 0, 0, ''),
(96, '啓用', 68, '68,96', 2, 99, 1, 'trade', 1, 0, 0, ''),
(97, '職員管理', 0, '97', 1, 99, 1, 'trade', 1, 0, 0, ''),
(98, '資金戶口', 0, '98', 1, 99, 1, 'trade', 1, 0, 0, ''),
(99, '導入', 11, '11,99', 2, 99, 1, 'trade', 1, 0, 0, ''),
(100, '審覈', 14, '14,100', 2, 99, 1, 'trade', 1, 0, 0, ''),
(101, '反審覈', 14, '14,101', 2, 99, 1, 'trade', 1, 0, 0, ''),
(102, '導出 ', 14, '14,102', 2, 99, 1, 'trade', 1, 0, 0, ''),
(103, '審覈', 18, '18,103', 2, 99, 1, 'trade', 1, 0, 0, ''),
(104, '反審覈', 18, '18,104', 2, 99, 1, 'trade', 1, 0, 0, ''),
(105, '導出 ', 18, '18,105', 2, 99, 1, 'trade', 1, 0, 0, ''),
(106, '現金銀行報表', 0, '106', 1, 99, 1, 'trade', 1, 0, 0, ''),
(107, '列印', 106, '106,107', 2, 99, 1, 'trade', 1, 0, 0, ''),
(108, '導出 ', 106, '106,108', 2, 99, 1, 'trade', 1, 0, 0, ''),
(109, '客戶對賬單', 0, '109', 1, 99, 1, 'trade', 1, 0, 0, ''),
(110, '列印', 109, '109,110', 2, 99, 1, 'trade', 1, 0, 0, ''),
(111, '導出 ', 109, '109,111', 2, 99, 1, 'trade', 1, 0, 0, ''),
(112, '供應商對賬單', 0, '112', 1, 99, 1, 'trade', 1, 0, 0, ''),
(113, '列印', 112, '112,113', 2, 99, 1, 'trade', 1, 0, 0, ''),
(114, '導出 ', 112, '112,114', 2, 99, 1, 'trade', 1, 0, 0, ''),
(115, '其他收支明細表', 0, '115', 1, 99, 1, 'trade', 1, 0, 0, ''),
(116, '列印', 115, '115,116', 2, 99, 1, 'trade', 1, 0, 0, ''),
(117, '導出 ', 115, '115,117', 2, 99, 1, 'trade', 1, 0, 0, ''),
(118, '新增', 97, '97,118', 2, 99, 1, 'trade', 1, 0, 0, ''),
(119, '修改', 97, '97,119', 2, 99, 1, 'trade', 1, 0, 0, ''),
(120, '删除', 97, '97,120', 2, 99, 1, 'trade', 1, 0, 0, ''),
(121, '新增', 98, '98,121', 2, 99, 1, 'trade', 1, 0, 0, ''),
(122, '修改', 98, '98,122', 2, 99, 1, 'trade', 1, 0, 0, ''),
(123, '删除', 98, '98,123', 2, 99, 1, 'trade', 1, 0, 0, ''),
(124, '收款單', 0, '124', 1, 99, 1, 'trade', 1, 0, 0, ''),
(125, '新增', 124, '124,125', 2, 99, 1, 'trade', 1, 0, 0, ''),
(126, '修改', 124, '124,126', 2, 99, 1, 'trade', 1, 0, 0, ''),
(127, '删除', 124, '124,127', 2, 99, 1, 'trade', 1, 0, 0, ''),
(128, '導出 ', 124, '124,128', 2, 99, 1, 'trade', 1, 0, 0, ''),
(129, '付款單', 0, '129', 1, 99, 1, 'trade', 1, 0, 0, ''),
(130, '新增', 129, '129,130', 2, 99, 1, 'trade', 1, 0, 0, ''),
(131, '修改', 129, '129,131', 2, 99, 1, 'trade', 1, 0, 0, ''),
(132, '删除', 129, '129,132', 2, 99, 1, 'trade', 1, 0, 0, ''),
(133, '導出 ', 129, '129,133', 2, 99, 1, 'trade', 1, 0, 0, ''),
(134, '其他收入單', 0, '134', 1, 99, 1, 'trade', 1, 0, 0, ''),
(135, '新增', 134, '134,135', 2, 99, 1, 'trade', 1, 0, 0, ''),
(136, '修改', 134, '134,136', 2, 99, 1, 'trade', 1, 0, 0, ''),
(137, '删除', 134, '134,137', 2, 99, 1, 'trade', 1, 0, 0, ''),
(138, '導出 ', 134, '134,138', 2, 99, 1, 'trade', 1, 0, 0, ''),
(139, '其他支出單', 0, '139', 1, 99, 1, 'trade', 1, 0, 0, ''),
(140, '新增', 139, '139,140', 2, 99, 1, 'trade', 1, 0, 0, ''),
(141, '修改', 139, '139,141', 2, 99, 1, 'trade', 1, 0, 0, ''),
(142, '删除', 139, '139,142', 2, 99, 1, 'trade', 1, 0, 0, ''),
(143, '導出 ', 139, '139,143', 2, 99, 1, 'trade', 1, 0, 0, ''),
(144, '調撥單', 0, '144', 1, 99, 1, 'trade', 1, 0, 0, ''),
(145, '新增', 144, '144,145', 2, 99, 1, 'trade', 1, 0, 0, ''),
(146, '修改', 144, '144,146', 2, 99, 1, 'trade', 1, 0, 0, ''),
(147, '删除', 144, '144,147', 2, 99, 1, 'trade', 1, 0, 0, ''),
(148, '導出 ', 144, '144,148', 2, 99, 1, 'trade', 1, 0, 0, ''),
(149, '初始化數據', 0, '149', 1, 99, 1, 'trade', 1, 0, 0, ''),
(151, '成本調整單', 0, '151', 1, 99, 1, 'trade', 1, 0, 0, ''),
(152, '新增', 151, '151,152', 2, 99, 1, 'trade', 1, 0, 0, ''),
(153, '修改', 151, '151,153', 2, 99, 1, 'trade', 1, 0, 0, ''),
(154, '删除', 151, '151,154', 2, 99, 1, 'trade', 1, 0, 0, ''),
(155, '倉庫管理', 0, '155', 1, 99, 1, 'trade', 1, 0, 0, ''),
(156, '新增', 155, '155,156', 2, 99, 1, 'trade', 1, 0, 0, ''),
(157, '修改', 155, '155,157', 2, 99, 1, 'trade', 1, 0, 0, ''),
(158, '删除', 155, '155,158', 2, 99, 1, 'trade', 1, 0, 0, ''),
(159, '結算方式', 0, '159', 1, 99, 1, 'trade', 1, 0, 0, ''),
(160, '新增', 159, '159,160', 2, 99, 1, 'trade', 1, 0, 0, ''),
(161, '修改', 159, '159,161', 2, 99, 1, 'trade', 1, 0, 0, ''),
(162, '删除', 159, '159,162', 2, 99, 1, 'trade', 1, 0, 0, ''),
(163, '供應商分類', 0, '163', 1, 99, 1, 'trade', 1, 0, 0, ''),
(164, '新增', 163, '163,164', 2, 99, 1, 'trade', 1, 0, 0, ''),
(165, '修改', 163, '163,165', 2, 99, 1, 'trade', 1, 0, 0, ''),
(166, '删除', 163, '163,166', 2, 99, 1, 'trade', 1, 0, 0, ''),
(167, '商品分類', 0, '167', 1, 99, 1, 'trade', 1, 0, 0, ''),
(168, '新增', 167, '167,168', 2, 99, 1, 'trade', 1, 0, 0, ''),
(169, '修改', 167, '167,169', 2, 99, 1, 'trade', 1, 0, 0, ''),
(170, '删除', 167, '167,170', 2, 99, 1, 'trade', 1, 0, 0, ''),
(171, '支出分類', 0, '171', 1, 99, 1, 'trade', 1, 0, 0, ''),
(172, '新增', 171, '171,172', 2, 99, 1, 'trade', 1, 0, 0, ''),
(173, '修改', 171, '171,173', 2, 99, 1, 'trade', 1, 0, 0, ''),
(174, '删除', 171, '171,174', 2, 99, 1, 'trade', 1, 0, 0, ''),
(175, '收入分類', 0, '175', 1, 99, 1, 'trade', 1, 0, 0, ''),
(176, '新增', 175, '175,176', 2, 99, 1, 'trade', 1, 0, 0, ''),
(177, '修改', 175, '175,177', 2, 99, 1, 'trade', 1, 0, 0, ''),
(178, '删除', 175, '175,178', 2, 99, 1, 'trade', 1, 0, 0, ''),
(179, '列印', 144, '144,179', 2, 99, 1, 'trade', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_options`
--

CREATE TABLE IF NOT EXISTS `ci_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_options`
--

INSERT INTO `ci_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'system', 'a:10:{s:11:"companyName";s:15:"興利製麵家";s:11:"companyAddr";s:56:"澳門黑沙環大馬路黑沙灣巷發利工業大廈2B";s:5:"phone";s:8:"28517703";s:3:"fax";s:8:"28403939";s:8:"postcode";s:0:"";s:9:"qtyPlaces";s:1:"1";s:11:"pricePlaces";s:1:"1";s:12:"amountPlaces";s:1:"2";s:10:"valMethods";s:13:"movingAverage";s:18:"requiredCheckStore";s:1:"1";}', 'yes'),
(2, 'sales', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">掃描槍錄入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位Id","hidden":true,"defLabel":"單位Id","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保質期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保質期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"銷售單價","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"銷售單價","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣額","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣額","defhidden":false},{"name":"amount","label":"銷售金額","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"銷售金額","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"},{"name":"srcOrderEntryId","label":"源分錄單ID","width":0,"hidden":true,"defLabel":"源分錄單ID","defhidden":true},{"name":"srcOrderId","label":"源單ID","width":0,"hidden":true,"defLabel":"源單ID","defhidden":true},{"name":"srcOrderNo","label":"源單號","width":120,"fixed":true,"hidden":true,"defLabel":"源單號","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","單位",null,80],["unitId","單位Id",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保質期(天)",true,90],["validDate","有效期至",true,90],["qty","數量",null,80],["price","銷售單價",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣額",false,70],["amount","銷售金額",false,100],["description","備註",null,150],["srcOrderEntryId","源分錄單ID",true,0],["srcOrderId","源單ID",true,0],["srcOrderNo","源單號",true,120]],"isReg":true}}}";', 'yes'),
(3, 'purchase', 's:3815:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">掃描槍錄入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"屬性ID","hidden":true,"defLabel":"屬性ID","defhidden":true},{"name":"skuName","label":"屬性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"屬性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位Id","hidden":true,"defLabel":"單位Id","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保持期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保持期(天)","defhidden":true},{"name":"validDate","label":"有效期","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"入貨單價","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"defLabel":"入貨單價","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣額","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣額","defhidden":false},{"name":"amount","label":"入貨金額","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"入貨金額","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"},{"name":"srcOrderEntryId","label":"源單分錄ID","width":0,"hidden":true,"defLabel":"源單分錄ID","defhidden":true},{"name":"srcOrderId","label":"源單ID","width":0,"hidden":true,"defLabel":"源單ID","defhidden":true},{"name":"srcOrderNo","label":"源單號","width":120,"fixed":true,"hidden":true,"defLabel":"源單號","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","屬性ID",true,null],["skuName","屬性",true,100],["mainUnit","單位",null,80],["unitId","單位Id",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保持期(天)",true,90],["validDate","有效期",true,90],["qty","數量",null,80],["price","入貨單價",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣額",false,70],["amount","入貨金額",false,100],["description","備註",null,150],["srcOrderEntryId","源單分錄ID",true,0],["srcOrderId","源單ID",true,0],["srcOrderNo","源單號",true,120]],"isReg":true}}}";', 'yes'),
(4, 'transfers', 's:2702:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":318,"title":false,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":4},"editable":true,"defLabel":"数量"},{"name":"outLocationName","label":"调出仓库","nameExt":"<small id=\\"batch-storageA\\">(批量)</small>","sortable":false,"width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调出仓库"},{"name":"inLocationName","label":"调入仓库","nameExt":"<small id=\\"batch-storageB\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调入仓库"},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,318],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["outLocationName","调出仓库",null,100],["inLocationName","调入仓库",null,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(5, 'otherWarehouse', 's:2906:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"屬性ID","hidden":true,"defLabel":"屬性ID","defhidden":true},{"name":"skuName","label":"屬性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"屬性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位ID","hidden":true,"defLabel":"單位ID","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保持期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保持期(天)","defhidden":true},{"name":"validDate","label":"有效期到","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期到","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"入庫單價","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"defLabel":"入庫單價","defhidden":false},{"name":"amount","label":"入庫金額","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"入庫金額","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","屬性ID",true,null],["skuName","屬性",true,100],["mainUnit","單位",null,80],["unitId","單位ID",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保持期(天)",true,90],["validDate","有效期到",true,90],["qty","數量",null,80],["price","入庫單價",false,100],["amount","入庫金額",false,100],["description","備註",null,150]],"isReg":true}}}";', 'yes'),
(6, 'adjustment', 's:1337:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis disableSku"},"defLabel":"商品"},{"name":"skuId","label":"屬性ID","hidden":true,"defLabel":"屬性ID","defhidden":true},{"name":"mainUnit","label":"單位","width":60,"defLabel":"單位"},{"name":"amount","label":"調整金額","hidden":false,"width":100,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"調整金額","defhidden":false},{"name":"locationName","label":"倉庫<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫<small id=\\"batchStorage\\">(批量)</small>"},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","屬性ID",true,null],["mainUnit","單位",null,60],["amount","調整金額",false,100],["locationName","倉庫<small id=\\"batchStorage\\">(批量)</small>",null,100],["description","備註",null,150]],"isReg":true}}}";', 'yes'),
(7, 'purchaseBack', 's:3815:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">掃描槍錄入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"屬性ID","hidden":true,"defLabel":"屬性ID","defhidden":true},{"name":"skuName","label":"屬性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"屬性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位Id","hidden":true,"defLabel":"單位Id","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保持期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保持期(天)","defhidden":true},{"name":"validDate","label":"有效期","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"入貨單價","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"defLabel":"入貨單價","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣額","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣額","defhidden":false},{"name":"amount","label":"入貨金額","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"入貨金額","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"},{"name":"srcOrderEntryId","label":"源單分錄ID","width":0,"hidden":true,"defLabel":"源單分錄ID","defhidden":true},{"name":"srcOrderId","label":"源單ID","width":0,"hidden":true,"defLabel":"源單ID","defhidden":true},{"name":"srcOrderNo","label":"源單號","width":120,"fixed":true,"hidden":true,"defLabel":"源單號","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","屬性ID",true,null],["skuName","屬性",true,100],["mainUnit","單位",null,80],["unitId","單位Id",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保持期(天)",true,90],["validDate","有效期",true,90],["qty","數量",null,80],["price","入貨單價",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣額",false,70],["amount","入貨金額",false,100],["description","備註",null,150],["srcOrderEntryId","源單分錄ID",true,0],["srcOrderId","源單ID",true,0],["srcOrderNo","源單號",true,120]],"isReg":true}}}";', 'yes'),
(8, 'salesBack', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">掃描槍錄入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位Id","hidden":true,"defLabel":"單位Id","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保質期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保質期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"銷售單價","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"銷售單價","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣額","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣額","defhidden":false},{"name":"amount","label":"銷售金額","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"銷售金額","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"},{"name":"srcOrderEntryId","label":"源分錄單ID","width":0,"hidden":true,"defLabel":"源分錄單ID","defhidden":true},{"name":"srcOrderId","label":"源單ID","width":0,"hidden":true,"defLabel":"源單ID","defhidden":true},{"name":"srcOrderNo","label":"源單號","width":120,"fixed":true,"hidden":true,"defLabel":"源單號","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","單位",null,80],["unitId","單位Id",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保質期(天)",true,90],["validDate","有效期至",true,90],["qty","數量",null,80],["price","銷售單價",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣額",false,70],["amount","銷售金額",false,100],["description","備註",null,150],["srcOrderEntryId","源分錄單ID",true,0],["srcOrderId","源單ID",true,0],["srcOrderNo","源單號",true,120]],"isReg":true}}}";', 'yes'),
(9, 'otherOutbound', 's:2892:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"屬性ID","hidden":true,"defLabel":"屬性ID","defhidden":true},{"name":"skuName","label":"屬性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"屬性","defhidden":true},{"name":"mainUnit","label":"單位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"單位"},{"name":"unitId","label":"單位ID","hidden":true,"defLabel":"單位ID","defhidden":true},{"name":"locationName","label":"倉庫","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"倉庫"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生產日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生產日期","defhidden":true},{"name":"safeDays","label":"保持期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保持期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"數量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"數量"},{"name":"price","label":"出庫單位成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"defLabel":"出庫單位成本","defhidden":false},{"name":"amount","label":"出庫成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"defLabel":"出庫成本","defhidden":false},{"name":"description","label":"備註","width":150,"title":true,"editable":true,"defLabel":"備註"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","屬性ID",true,null],["skuName","屬性",true,100],["mainUnit","單位",null,80],["unitId","單位ID",true,null],["locationName","倉庫",null,100],["batch","批次",true,90],["prodDate","生產日期",true,90],["safeDays","保持期(天)",true,90],["validDate","有效期至",true,90],["qty","數量",null,80],["price","出庫單位成本",false,100],["amount","出庫成本",false,100],["description","備註",null,150]],"isReg":true}}}";', 'yes');

-- --------------------------------------------------------

--
-- 表的结构 `ci_payment_info`
--

CREATE TABLE IF NOT EXISTS `ci_payment_info` (
  `id` int(11) NOT NULL,
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
  `transType` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ci_receipt_info`
--

CREATE TABLE IF NOT EXISTS `ci_receipt_info` (
  `id` int(11) NOT NULL,
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
  `transType` varchar(50) DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ci_receipt_info`
--

INSERT INTO `ci_receipt_info` (`id`, `iid`, `buId`, `billId`, `billNo`, `billType`, `billDate`, `billPrice`, `hasCheck`, `notCheck`, `nowCheck`, `transType`) VALUES
(1, 29, 0, 22, 'SKD201605032344085', 'SALE', '2016-05-03', 49.5, 8, 41.5, 0, '153001'),
(2, 30, 0, 22, 'SKD201605032344217', 'SALE', '2016-05-03', 49.5, 8, 41.5, 0, '153001');

-- --------------------------------------------------------

--
-- 表的结构 `ci_staff`
--

CREATE TABLE IF NOT EXISTS `ci_staff` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
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
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_staff`
--

INSERT INTO `ci_staff` (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES
(1, 'Jordon', 'A1', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_storage`
--

CREATE TABLE IF NOT EXISTS `ci_storage` (
  `id` smallint(6) NOT NULL COMMENT '导航栏目',
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
  `isDelete` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_storage`
--

INSERT INTO `ci_storage` (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES
(1, '默認倉', '01', 0, 0, 0, 0, NULL, NULL, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unit`
--

CREATE TABLE IF NOT EXISTS `ci_unit` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `unitTypeId` smallint(6) DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `rate` tinyint(1) DEFAULT '0',
  `guid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_unit`
--

INSERT INTO `ci_unit` (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES
(1, '条', 1, 0, 0, 0, '', 1),
(2, '包', 1, 0, 0, 0, '', 0),
(3, '磅', 1, 0, 0, 0, '', 0),
(4, '千克', 1, 0, 0, 0, '', 0),
(5, 'kg', 1, 0, 0, 0, '', 0),
(6, 'g', 1, 0, 0, 0, '', 0),
(7, '克', 1, 0, 0, 0, '', 0),
(8, '斤', 1, 0, 0, 0, '', 0),
(9, '份', 1, 0, 0, 0, '', 0),
(10, 'admin', 1, 0, 0, 0, '', 0),
(11, 't', 1, 0, 0, 0, '', 1),
(12, 't', 1, 0, 0, 0, '', 1),
(13, 'bbbb', 1, 0, 0, 0, '', 0),
(14, 'eee', 1, 0, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unittype`
--

CREATE TABLE IF NOT EXISTS `ci_unittype` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ci_unit_count`
--

CREATE TABLE IF NOT EXISTS `ci_unit_count` (
  `id` int(11) NOT NULL,
  `unitId` int(11) NOT NULL,
  `to_unitId` int(11) NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ci_unit_count`
--

INSERT INTO `ci_unit_count` (`id`, `unitId`, `to_unitId`, `discount`) VALUES
(1, 2, 1, 500),
(2, 3, 2, 0.002),
(3, 2, 3, 500),
(4, 3, 1, 3),
(5, 4, 3, 50),
(6, 4, 2, 0.0001),
(7, 4, 1, 0.2),
(8, 5, 6, 1),
(9, 5, 5, 2),
(10, 5, 4, 1),
(11, 5, 3, 0),
(12, 5, 2, 0),
(13, 5, 1, 0),
(14, 6, 6, 0),
(15, 6, 5, 0),
(16, 6, 4, 0.001),
(17, 6, 3, 0),
(18, 6, 2, 0),
(19, 6, 1, 0),
(20, 6, 5, 0.001),
(21, 7, 6, 0),
(22, 7, 5, 0),
(23, 7, 4, 0.001),
(24, 7, 3, 0),
(25, 7, 2, 0),
(26, 7, 1, 0),
(27, 7, 5, 0.01),
(28, 7, 6, 1),
(29, 7, 6, 1),
(30, 7, 5, 0.001),
(31, 7, 3, 0),
(32, 7, 2, 0),
(33, 7, 1, 0),
(34, 8, 6, 0),
(35, 8, 5, 0),
(36, 8, 4, 0),
(37, 8, 3, 0),
(38, 8, 2, 0),
(39, 8, 1, 0),
(40, 8, 5, 0),
(41, 8, 6, 0),
(42, 8, 7, 500),
(43, 9, 8, 1),
(44, 9, 7, 500),
(45, 9, 6, 500),
(46, 9, 5, 0.5),
(47, 9, 4, 1),
(48, 9, 3, 1),
(49, 9, 2, 1),
(50, 9, 1, 1),
(51, 8, 9, 0),
(52, 8, 6, 500),
(53, 8, 5, 0),
(54, 8, 4, 0),
(55, 8, 3, 0),
(56, 8, 2, 0),
(57, 8, 1, 0),
(58, 8, 9, 0),
(59, 8, 6, 500),
(60, 8, 5, 0),
(61, 8, 4, 0),
(62, 8, 3, 0),
(63, 8, 2, 0),
(64, 8, 1, 0),
(65, 8, 9, 0),
(66, 8, 6, 500),
(67, 8, 5, 0),
(68, 8, 4, 0),
(69, 8, 3, 0),
(70, 8, 2, 0),
(71, 8, 1, 0),
(72, 3, 9, 1),
(73, 3, 8, 0),
(74, 3, 7, 0),
(75, 3, 6, 0),
(76, 3, 5, 0),
(77, 3, 4, 0),
(78, 3, 8, 0),
(79, 3, 7, 0),
(80, 3, 6, 0),
(81, 3, 5, 0),
(82, 3, 4, 0),
(83, 10, 9, 0),
(84, 10, 8, 0),
(85, 10, 7, 0),
(86, 10, 6, 0),
(87, 10, 5, 0),
(88, 10, 4, 0),
(89, 10, 3, 0),
(90, 10, 2, 0),
(91, 10, 1, 0),
(92, 10, 9, 0),
(93, 10, 8, 0),
(94, 10, 7, 0),
(95, 10, 6, 0),
(96, 10, 5, 0),
(97, 10, 4, 0),
(98, 10, 3, 0),
(99, 10, 2, 1),
(100, 10, 1, 1),
(101, 10, 9, 0),
(102, 10, 8, 1),
(103, 10, 7, 500),
(104, 10, 6, 0),
(105, 10, 5, 0),
(106, 10, 4, 0),
(107, 10, 3, 0),
(108, 10, 2, 0),
(109, 10, 1, 0),
(110, 9, 10, 0),
(111, 9, 10, 0),
(112, 1, 10, 0),
(113, 1, 9, 0),
(114, 1, 8, 0),
(115, 1, 7, 0),
(116, 1, 6, 0),
(117, 1, 5, 0),
(118, 1, 4, 0),
(119, 1, 3, 0),
(120, 1, 2, 1),
(121, 11, 10, 0),
(122, 11, 9, 0),
(123, 11, 8, 0),
(124, 11, 7, 0),
(125, 11, 6, 0),
(126, 11, 5, 0),
(127, 11, 4, 0),
(128, 11, 3, 0),
(129, 11, 2, 0),
(130, 11, 1, 0),
(131, 12, 10, 0),
(132, 12, 9, 0),
(133, 12, 8, 0),
(134, 12, 7, 0),
(135, 12, 6, 0),
(136, 12, 5, 0),
(137, 12, 4, 0),
(138, 12, 3, 0),
(139, 12, 2, 0),
(158, 13, 10, 1),
(159, 13, 9, 3),
(160, 13, 8, 2),
(161, 13, 7, 1000),
(162, 13, 6, 0),
(163, 13, 5, 0),
(164, 13, 4, 0),
(165, 13, 3, 0),
(166, 13, 2, 0),
(182, 14, 13, 0),
(183, 14, 10, 0),
(184, 14, 9, 0),
(185, 14, 8, 0),
(186, 14, 7, 0),
(187, 14, 6, 0),
(188, 14, 5, 0),
(189, 14, 4, 0),
(190, 14, 3, 0),
(191, 14, 2, 0),
(192, 2, 13, 1),
(193, 2, 10, 3232),
(194, 2, 9, 0),
(195, 2, 8, 0),
(196, 2, 7, 0),
(197, 2, 6, 0),
(198, 2, 5, 0),
(199, 2, 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_account`
--
ALTER TABLE `ci_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `number` (`number`) USING BTREE;

--
-- Indexes for table `ci_account_info`
--
ALTER TABLE `ci_account_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billdate` (`billDate`) USING BTREE,
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `ci_address`
--
ALTER TABLE `ci_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pid` (`postalcode`);

--
-- Indexes for table `ci_admin`
--
ALTER TABLE `ci_admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `ci_assistingprop`
--
ALTER TABLE `ci_assistingprop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ci_assistsku`
--
ALTER TABLE `ci_assistsku`
  ADD PRIMARY KEY (`skuId`),
  ADD KEY `id` (`skuClassId`);

--
-- Indexes for table `ci_category`
--
ALTER TABLE `ci_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parentId` (`parentId`) USING BTREE;

--
-- Indexes for table `ci_contact`
--
ALTER TABLE `ci_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `number` (`number`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ci_customerprice`
--
ALTER TABLE `ci_customerprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_goods`
--
ALTER TABLE `ci_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `number` (`number`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ci_goods_img`
--
ALTER TABLE `ci_goods_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invId` (`invId`);

--
-- Indexes for table `ci_invoice`
--
ALTER TABLE `ci_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accId` (`accId`),
  ADD KEY `buId` (`buId`),
  ADD KEY `salesId` (`salesId`);

--
-- Indexes for table `ci_invoice_info`
--
ALTER TABLE `ci_invoice_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`transType`),
  ADD KEY `billdate` (`billDate`),
  ADD KEY `invId` (`invId`) USING BTREE,
  ADD KEY `transType` (`transType`),
  ADD KEY `iid` (`iid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ci_invoice_type`
--
ALTER TABLE `ci_invoice_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_log`
--
ALTER TABLE `ci_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `adddate` (`adddate`);

--
-- Indexes for table `ci_menu`
--
ALTER TABLE `ci_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parentId` (`parentId`) USING BTREE;

--
-- Indexes for table `ci_options`
--
ALTER TABLE `ci_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `ci_payment_info`
--
ALTER TABLE `ci_payment_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type,billdate` (`billDate`);

--
-- Indexes for table `ci_receipt_info`
--
ALTER TABLE `ci_receipt_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type,billdate` (`billDate`);

--
-- Indexes for table `ci_staff`
--
ALTER TABLE `ci_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `number` (`number`) USING BTREE;

--
-- Indexes for table `ci_storage`
--
ALTER TABLE `ci_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `locationNo` (`locationNo`) USING BTREE;

--
-- Indexes for table `ci_unit`
--
ALTER TABLE `ci_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_unittype`
--
ALTER TABLE `ci_unittype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_unit_count`
--
ALTER TABLE `ci_unit_count`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ci_account`
--
ALTER TABLE `ci_account`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ci_account_info`
--
ALTER TABLE `ci_account_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ci_address`
--
ALTER TABLE `ci_address`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目';
--
-- AUTO_INCREMENT for table `ci_admin`
--
ALTER TABLE `ci_admin`
  MODIFY `uid` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ci_assistingprop`
--
ALTER TABLE `ci_assistingprop`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目';
--
-- AUTO_INCREMENT for table `ci_assistsku`
--
ALTER TABLE `ci_assistsku`
  MODIFY `skuId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ci_category`
--
ALTER TABLE `ci_category`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ci_contact`
--
ALTER TABLE `ci_contact`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `ci_customerprice`
--
ALTER TABLE `ci_customerprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1745;
--
-- AUTO_INCREMENT for table `ci_goods`
--
ALTER TABLE `ci_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ci_goods_img`
--
ALTER TABLE `ci_goods_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ci_invoice`
--
ALTER TABLE `ci_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `ci_invoice_info`
--
ALTER TABLE `ci_invoice_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT for table `ci_invoice_type`
--
ALTER TABLE `ci_invoice_type`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ci_log`
--
ALTER TABLE `ci_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=496;
--
-- AUTO_INCREMENT for table `ci_menu`
--
ALTER TABLE `ci_menu`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT for table `ci_options`
--
ALTER TABLE `ci_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ci_payment_info`
--
ALTER TABLE `ci_payment_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ci_receipt_info`
--
ALTER TABLE `ci_receipt_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ci_staff`
--
ALTER TABLE `ci_staff`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ci_storage`
--
ALTER TABLE `ci_storage`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ci_unit`
--
ALTER TABLE `ci_unit`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ci_unittype`
--
ALTER TABLE `ci_unittype`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ci_unit_count`
--
ALTER TABLE `ci_unit_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=200;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
