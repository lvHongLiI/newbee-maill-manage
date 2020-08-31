-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.40 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.2.0.5717
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 lhl-basic.carousel 结构
CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `carousel_url` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '轮播图地址',
  `redirect_url` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '跳转的url',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序值',
  `status` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '1 新增, 2 启用，3，关闭  4,过期',
  `start_date` date DEFAULT NULL COMMENT '起始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='轮播图表';

-- 正在导出表  lhl-basic.carousel 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` (`id`, `carousel_url`, `redirect_url`, `sort`, `status`, `start_date`, `end_date`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
	(5, 'http://localhost/carousel/2020-08-02/8CF8A9E0E6FE4F5B955DDAC4BE9DFA74.jpg', '/asd/qhhhh', 123, '3', '2020-08-26', '2020-08-30', 4, '2020-08-02 16:35:11', 4, '2020-08-02 17:14:27');
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;

-- 导出  表 lhl-basic.goods 结构
CREATE TABLE IF NOT EXISTS `goods` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '商品编号（主键）',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品标题',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `detail` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品描述',
  `img` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片url',
  `synopsis` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品简介',
  `price` double(15,2) DEFAULT NULL COMMENT '商品价格',
  `selling_price` double(15,2) DEFAULT NULL COMMENT '销售价格',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `selling_num` int(11) NOT NULL DEFAULT '0' COMMENT '销售数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1 上架 2 下架',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品表';

-- 正在导出表  lhl-basic.goods 的数据：~61 rows (大约)
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `name`, `title`, `category_id`, `detail`, `img`, `synopsis`, `price`, `selling_price`, `num`, `selling_num`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
	('497398181404254208', '华硕电脑', '全新笔记本电脑轻薄便携学生大学生高配金属', 29, 'FSDGGFGFSGSFSGFGFS', 'http://localhost/goods/2020-08-30/D4234B06B4C744D7BAB9DC90B2858ACB.png', '远看华硕真迷人，走进华硕坑死人。离开华硕重做人，再进华硕不是人', 2188.60, 1388.60, 28, 0, 2, 4, '2020-08-30 10:43:53', 0, '2020-08-30 12:04:36'),
	('497398181773352960', NULL, '2020新品联想笔记本电脑轻薄便携学生本', 29, NULL, 'https://img.alicdn.com/imgextra/i2/1195040002/O1CN01IHSU5i1BsxPV2JnoQ_!!0-saturn_solar.jpg', NULL, 2499.00, 2099.00, 49, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181802713088', NULL, '华硕灵耀彩色mx250显卡金属手提笔记本电脑', 29, NULL, 'https://img.alicdn.com/imgextra/i3/131179714/O1CN01pxvImF2Ld3ysfVgL2_!!0-saturn_solar.jpg', NULL, 5209.00, 4659.00, 44, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181827878912', NULL, '联想笔记本2020款高清独显轻薄便携学生本', 29, NULL, 'https://img.alicdn.com/imgextra/i2/172610110/O1CN01joQp8k1CgQBaAfh8E_!!0-saturn_solar.jpg', NULL, 2299.00, 2099.00, 57, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181853044736', NULL, '2020年新款笔记本电脑轻薄便携学生女生', 29, NULL, 'https://img.alicdn.com/imgextra/i4/1309540067/O1CN01nu1zpO1CMj9ULaGfE_!!0-saturn_solar.jpg', NULL, 1850.00, 1350.00, 62, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181874016256', NULL, '14寸金属轻薄便携学生笔记本电脑商务本办公', 29, NULL, 'https://img.alicdn.com/imgextra/i2/1195060119/O1CN01glKgqq1CkXkWoWSk8_!!0-saturn_solar.jpg', NULL, 2188.00, 1458.00, 62, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181920153600', NULL, '惠普星14青春版版笔记本电脑 轻薄便携 学生', 29, NULL, 'https://img.alicdn.com/imgextra/i1/133282387/O1CN010Wowed1TVI1HpaOcu_!!0-saturn_solar.jpg', NULL, 5399.00, 4399.00, 48, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181936930816', NULL, '新品Asus/华硕顽石6代八代酷睿?', 29, NULL, 'https://img.alicdn.com/imgextra/i4/110753031/O1CN01jlghqB1YGF5UWGZbN_!!0-saturn_solar.jpg', NULL, 4999.00, 3599.00, 48, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181966290944', NULL, '20万+跑分15.6英寸锐龙R7金属', 29, NULL, 'https://img.alicdn.com/imgextra/i4/1333310169/O1CN010iULL61D7RYC7lnHx_!!0-saturn_solar.jpg', NULL, 3698.00, 2598.00, 32, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398181995651072', NULL, '2020新品HP/惠普 薄锐ENVY x360 13 13.3英', 29, NULL, 'https://img.alicdn.com/imgextra/i1/644542275/O1CNA1Gqf2ul100f074086830be0f4df000x_!!1-0-picassodesign.jpg', NULL, 5999.00, 5599.00, 30, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182012428288', NULL, '2020新款HP/惠普 薄锐ENVY13 MX350独显笔记', 29, NULL, 'https://img.alicdn.com/imgextra/i3/24677982/O1CN01zLdyNN28po13ImDN7_!!0-saturn_solar.jpg', NULL, 6499.00, 5999.00, 69, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182037594112', NULL, '戴尔 新G3 i5四核独显GTX1650Q轻薄游戏本', 29, NULL, 'https://img.alicdn.com/imgextra/i1/16206722/O1CN01Zfbhva1zWiyBswwzv_!!0-saturn_solar.jpg', NULL, 5299.00, 4799.00, 30, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182066954240', NULL, '华硕学生CAD平面设计Pr剪辑绘图笔记本电脑', 29, NULL, 'https://img.alicdn.com/imgextra/i2/131179714/O1CN01vgz9QA2Ld3zpCHJAr_!!0-saturn_solar.jpg', NULL, 5000.00, 4249.00, 25, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182083731456', NULL, '酷睿i7笔记本电脑畅玩游戏', 29, NULL, 'https://img.alicdn.com/imgextra/i3/100785638/O1CN011nba2v1rWFddIJOLp_!!0-saturn_solar.jpg', NULL, 1999.00, 1369.00, 36, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182113091584', NULL, '金属银-酷睿i7笔记本电脑轻薄便携超薄', 29, NULL, 'https://img.alicdn.com/imgextra/i1/57438875/O1CN01Qf4ExN2FQnhPn48Ki_!!0-saturn_solar.jpg', NULL, 1998.00, 1328.00, 25, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182146646016', NULL, 'Acer宏碁1660Ti发烧游戏本电脑', 29, NULL, 'https://img.alicdn.com/imgextra/i3/111683677/O1CN01lJGAAU1d26x5CuMZM_!!0-saturn_solar.jpg', NULL, 6999.00, 6599.00, 56, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182176006144', NULL, '新款15.6英寸笔记本电脑轻薄便携式酷睿i5', 29, NULL, 'https://img.alicdn.com/imgextra/i2/13010175/O1CN01R5SvUw1DABvgbHoTM_!!0-saturn_solar.jpg', NULL, 2498.00, 1699.00, 59, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182201171968', NULL, '华为 MateBook D 14 商务笔记本电脑 便携', 29, NULL, 'https://img.alicdn.com/imgextra/i3/114234393/O1CN01u9wouc1iK2XHQI4Mo_!!0-saturn_solar.jpg', NULL, 4099.00, 4099.00, 24, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182226337792', NULL, '联想威6 2020款14英寸办公学生游戏', 29, NULL, 'https://img.alicdn.com/imgextra/i1/923660124/O1CN01WqMykE1CmpjLxcgrN_!!0-saturn_solar.jpg', NULL, 4299.00, 4299.00, 37, 0, 2, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398182243115008', NULL, '联想ThinkBook ThinkPad笔记本电脑官方旗舰', 29, NULL, 'https://img.alicdn.com/imgextra/i1/116664259/O1CN01TGWMx51hKfSfRSDSl_!!0-saturn_solar.jpg', NULL, 5499.00, 4299.00, 21, 0, 1, 4, '2020-08-30 10:43:53', 4, '2020-08-30 10:43:53'),
	('497398185221070848', NULL, 'I5 I7电脑主机台式机全套游戏吃鸡办公炒股', 30, NULL, 'https://img.alicdn.com/imgextra/i4/489650170/O1CN01m7CPqW1D7tw5Q5qlo_!!0-saturn_solar.jpg', NULL, 1298.00, 649.00, 64, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185246236672', NULL, '一体机电脑家用办公游戏电脑一体机台式', 30, NULL, 'https://img.alicdn.com/imgextra/i1/338640070/O1CN01xfbCde1CO6LQpixZL_!!0-saturn_solar.jpg', NULL, 1799.00, 1299.00, 51, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185271402496', NULL, 'acer/宏碁品牌一体机电脑家用办公商务主机', 30, NULL, 'https://img.alicdn.com/imgextra/i1/2208402064625/O1CNA1tw3XTK100edb1106000b1af359000i_!!1-0-picassodesign.jpg', NULL, 2399.00, 1858.00, 53, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185296568320', NULL, '2020新品 戴尔成就5000高性能台式主机', 30, NULL, 'https://img.alicdn.com/imgextra/i4/16206722/O1CN01djPtrn1zWixwteAun_!!0-saturn_solar.jpg', NULL, 4428.00, 4099.00, 22, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185321734144', NULL, '工业触摸屏一体机电脑平板全封闭防尘工控机', 30, NULL, 'https://img.alicdn.com/imgextra/i4/32553546/O1CN01uGDB451c473vhrRdB_!!0-saturn_solar.jpg', NULL, 1558.00, 1558.00, 39, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185338511360', NULL, 'win7超薄一体机电脑台式整机主机家用办公', 30, NULL, 'https://img.alicdn.com/imgextra/i2/1152570154/O1CN01ab1Kr01D0ZbcVHt9g_!!0-saturn_solar.jpg', NULL, 1550.00, 1250.00, 69, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185363677184', NULL, '机械师十代i7/i5主机办公游戏台式机主机', 30, NULL, 'https://img.alicdn.com/imgextra/i2/111683677/O1CN01b4lZen1d26x3xgP3K_!!0-saturn_solar.jpg', NULL, 5499.00, 5399.00, 63, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185384648704', NULL, '黑苹果十代i7设计师专用主机视频剪辑电脑', 30, NULL, 'https://img.alicdn.com/imgextra/i3/223730064/O1CN01F8Hymk1CLLxdUX78p_!!0-saturn_solar.jpg', NULL, 4699.00, 4580.00, 40, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185397231616', NULL, 'AOC一体机电脑家用办公游戏网课学习台式', 30, NULL, 'https://img.alicdn.com/imgextra/i4/132003369/O1CN013cizB81al2wTPBHkv_!!0-saturn_solar.jpg', NULL, 2399.00, 1799.00, 36, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185422397440', NULL, '智纯触摸屏查询电脑安卓点餐收银显示器PLC', 30, NULL, 'https://img.alicdn.com/imgextra/i2/1052080196/O1CN01P2mkdY1DJoEYSwqrW_!!0-saturn_solar.jpg', NULL, 1650.00, 1650.00, 37, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185443368960', NULL, '光影客7/8/10/12/13/15/1', 30, NULL, 'https://img.alicdn.com/imgextra/i4/384880132/O1CN01ZJo8zR1CqUt3p7m8I_!!2-saturn_solar.png', NULL, 1199.00, 1199.00, 52, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185468534784', NULL, '工业工控触摸一体机显示屏嵌入式平板电脑', 30, NULL, 'https://img.alicdn.com/imgextra/i2/891210026/O1CN01vMAg9f1C3wu3FXGWe_!!0-saturn_solar.jpg', NULL, 1538.00, 1538.00, 61, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185481117696', NULL, '图形工作站i7/K620绘图设计3D渲染建模作图', 30, NULL, 'https://img.alicdn.com/imgextra/i1/28002995/O1CN01auZh5M1XzkkqWZnuw_!!0-saturn_solar.jpg', NULL, 4999.00, 4966.00, 52, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185506283520', NULL, 'i5 i7/四核GTX1060台式机电脑主机吃鸡DIY整', 30, NULL, 'https://img.alicdn.com/imgextra/i1/118009741/O1CN01d30G3J2LpQh73IhyK_!!0-saturn_solar.jpg', NULL, 1699.00, 1258.00, 30, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185527255040', NULL, '办公酷睿I3I5四核台式电脑全套兼容机D', 30, NULL, 'https://img.alicdn.com/imgextra/i4/338560199/O1CN015wJj9X1DLBQT2eeBh_!!0-saturn_solar.jpg', NULL, 1798.00, 899.00, 25, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185556615168', NULL, '免费送24寸显示器 i7八核全套整机游戏主机', 30, NULL, 'https://img.alicdn.com/imgextra/i1/28808769/O1CN01CHbKNh2EeFideCxTF_!!0-saturn_solar.jpg', NULL, 1198.00, 599.00, 21, 0, 1, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185577586688', NULL, '嵌入式工控一体机工业触摸屏平板电脑全封闭', 30, NULL, 'https://img.alicdn.com/imgextra/i4/32553546/O1CN016cCQhN1c473xgypno_!!0-saturn_solar.jpg', NULL, 2656.00, 1288.00, 59, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185606946816', NULL, '酷睿i3/i5办公电脑四核8G内存台式电', 30, NULL, 'https://img.alicdn.com/imgextra/i1/581340011/O1CN01jfwJEa1Bx4yGP7FeJ_!!2-saturn_solar.png', NULL, 599.00, 599.00, 34, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185640501248', NULL, '宁美国度电脑主机i5 9400F游戏主机全套', 30, NULL, 'https://img.alicdn.com/imgextra/i3/23569358/O1CN010O22l52J00zSB9NM7_!!0-saturn_solar.jpg', NULL, 2199.00, 2199.00, 31, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398185669861376', NULL, 'ThinkView家用办公一体机电脑', 30, NULL, 'https://img.alicdn.com/imgextra/i3/1146100025/O1CN01zwKmil1C3UWE0el1H_!!0-saturn_solar.jpg', NULL, 1599.00, 1399.00, 29, 0, 2, 4, '2020-08-30 10:43:54', 4, '2020-08-30 10:43:54'),
	('497398188878503936', NULL, '平板电脑ipad Por2020新款12寸超清护眼屏', 31, NULL, 'https://img.alicdn.com/imgextra/i3/461140173/O1CN01pTiYPr1D9H7XituYh_!!0-saturn_solar.jpg', NULL, 708.00, 268.00, 39, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398188928835584', NULL, '2020新款平板电脑ipad安卓12英寸手机二合一', 31, NULL, 'https://img.alicdn.com/imgextra/i1/41460944/O1CN01zxR1Di1IqOUMTwwdD_!!0-saturn_solar.jpg', NULL, 1258.00, 235.00, 45, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398188974972928', NULL, 'ipad10.2保护套带键盘新ipad2', 31, NULL, 'https://img.alicdn.com/imgextra/i4/829140093/O1CN01ESI0QT1CYdS0NutE5_!!0-saturn_solar.jpg', NULL, 298.00, 128.00, 23, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189021110272', NULL, '学习机英语儿童点读机小学课本同步家教机', 31, NULL, 'https://img.alicdn.com/imgextra/i4/937850043/O1CN018pZHnM1CBjePz3yAk_!!0-saturn_solar.jpg', NULL, 798.00, 598.00, 47, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189067247616', NULL, 'iPad保护套带笔槽2019新款mini5三折皮套air', 31, NULL, 'https://img.alicdn.com/imgextra/i2/1389560164/O1CN01JTMPSb1D59ZfFby9U_!!0-saturn_solar.jpg', NULL, 219.00, 219.00, 68, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189113384960', NULL, '适用苹果iPad10.2键盘保护套蓝牙9.7皮套pro', 31, NULL, 'https://img.alicdn.com/imgextra/i3/1389560164/O1CN01Ta2IoH1D59ZdetiLZ_!!0-saturn_solar.jpg', NULL, 369.00, 369.00, 40, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189155328000', NULL, '华为matepad键盘保护套10.4平板套m6荣耀v6', 31, NULL, 'https://img.alicdn.com/imgextra/i3/1389560164/O1CN011KocBH1D59ZfLSDO3_!!0-saturn_solar.jpg', NULL, 398.00, 128.00, 48, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189205659648', NULL, '步步高家教机s5 pro保护套11英寸S5c皮套s3', 31, NULL, 'https://img.alicdn.com/imgextra/i3/1389560164/O1CN01HcvaaN1D59ZffzDuH_!!0-saturn_solar.jpg', NULL, 189.00, 189.00, 60, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189243408384', NULL, '小米派平板电脑ipad2020新款', 31, NULL, 'https://img.alicdn.com/imgextra/i4/606440166/O1CN01ApH3pE1D64Mj7iZXt_!!0-saturn_solar.jpg', NULL, 1298.00, 278.00, 59, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189293740032', NULL, '2020新款iPad保护套10.2带笔槽11寸三折皮质', 31, NULL, 'https://img.alicdn.com/imgextra/i4/1389560164/O1CN017RaJnx1D59ZZFxvyH_!!0-saturn_solar.jpg', NULL, 219.00, 59.00, 35, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189335683072', NULL, 'ipad保护套带笔槽2019新款air3防弯10.2壳7', 31, NULL, 'https://img.alicdn.com/imgextra/i2/1389560164/O1CN01mgQywR1D59ZbOySnV_!!0-saturn_solar.jpg', NULL, 229.00, 59.00, 48, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189377626112', NULL, '华为matepad保护套10.4平板pro10.8英寸m6壳', 31, NULL, 'https://img.alicdn.com/imgextra/i4/829140093/O1CN01rWyK5x1CYdS9I4Yxy_!!0-saturn_solar.jpg', NULL, 189.00, 189.00, 39, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189423763456', NULL, '英语学习神器拼音学习机儿童智能早教机小学', 31, NULL, 'https://img.alicdn.com/imgextra/i1/32596584/O1CN013irBjn1yVWJ7j6vI9_!!0-saturn_solar.jpg', NULL, 4999.00, 4398.00, 40, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189465706496', NULL, '小霸王学习机学习平板电脑早教机英语词典', 31, NULL, 'https://img.alicdn.com/imgextra/i3/372530033/O1CN01t80pGq1C79gPiEAzM_!!0-saturn_solar.jpg', NULL, 998.00, 658.00, 60, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189507649536', NULL, '2018款ipad9.7寸保护套笔槽air3三折皮套air', 31, NULL, 'https://img.alicdn.com/imgextra/i1/1355440019/O1CN01swA3LW1C0k8ranXMr_!!0-saturn_solar.jpg', NULL, 68.00, 68.00, 30, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189545398272', NULL, '爆款平板 联想M10 PLUS平板电脑10.3英寸', 31, NULL, 'https://img.alicdn.com/imgextra/i4/13887196/O1CN01zFtS2k231ohktyvsA_!!0-saturn_solar.jpg', NULL, 1599.00, 1499.00, 55, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189591535616', NULL, '2020新品HP/惠普 薄锐ENVY x360 13 13.3英', 31, NULL, 'https://img.alicdn.com/imgextra/i1/644542275/O1CNA1Gqf2ul100f074086830be0f4df000x_!!1-0-picassodesign.jpg', NULL, 5999.00, 5599.00, 26, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189637672960', NULL, '咨询客服至高省200。荣耀平板V6平板电脑', 31, NULL, 'https://img.alicdn.com/imgextra/i4/123627809/O1CN01FDgYP927YZUqPpHzr_!!0-saturn_solar.jpg', NULL, 2399.00, 2199.00, 53, 0, 2, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189679616000', NULL, '学习机学生平板电脑小学初中高中英语点读机', 31, NULL, 'https://img.alicdn.com/imgextra/i3/1218330125/O1CN01G1yQfn1CnI7zfaHR1_!!0-saturn_solar.jpg', NULL, 699.00, 688.00, 47, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497398189734141952', NULL, 'ipad保护套10.2网红air3平板皮套壳子', 31, NULL, 'https://img.alicdn.com/imgextra/i2/829140093/O1CN01AUCGQ71CYdS1dva7x_!!0-saturn_solar.jpg', NULL, 189.00, 49.00, 46, 0, 1, 4, '2020-08-30 10:43:55', 4, '2020-08-30 10:43:55'),
	('497422887742251008', '海南大香蕉', '你猜啥', 43, 'llllll', 'http://localhost/goods/2020-08-30/F25B788E624345839EF5E80A24512EEC.png', '嘿嘿嘿', 5.50, 4.00, 90, 0, 2, 0, '2020-08-30 12:22:03', 0, '2020-08-30 12:22:56');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 lhl-basic.goods_category 结构
CREATE TABLE IF NOT EXISTS `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `sort` int(2) DEFAULT '0' COMMENT '排序值',
  `create_user` int(11) DEFAULT '0' COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品分类表';

-- 正在导出表  lhl-basic.goods_category 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` (`id`, `name`, `pid`, `sort`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
	(25, '电子产品', 0, 4, 4, '2020-08-30 10:39:40', NULL, NULL),
	(26, '水果', 0, 24, 4, '2020-08-30 10:40:16', NULL, NULL),
	(27, '服装', 0, 42, 4, '2020-08-30 10:40:52', NULL, NULL),
	(28, '电脑', 25, 23, 4, '2020-08-30 10:41:10', NULL, NULL),
	(29, '笔记本电脑', 28, 24, 4, '2020-08-30 10:41:30', NULL, NULL),
	(30, '台式机电脑', 28, 56, 4, '2020-08-30 10:41:43', NULL, NULL),
	(31, '平板电脑', 28, 32, 4, '2020-08-30 10:41:54', NULL, NULL),
	(32, '手机', 25, 56, 4, '2020-08-30 10:44:54', NULL, NULL),
	(33, '智能机', 32, 123, 4, '2020-08-30 10:45:15', NULL, NULL),
	(34, '老年机', 32, 46, 4, '2020-08-30 10:45:29', NULL, NULL),
	(35, '儿童手机', 32, 55, 4, '2020-08-30 10:45:37', NULL, NULL),
	(36, '香蕉', 26, 53, 4, '2020-08-30 10:45:53', NULL, NULL),
	(37, '苹果', 26, 23, 4, '2020-08-30 10:46:02', NULL, NULL),
	(38, '橘子', 26, 22, 4, '2020-08-30 10:46:11', NULL, NULL),
	(39, '成都橘子', 38, 42, 4, '2020-08-30 10:46:25', 4, '2020-08-30 10:46:37'),
	(40, '达州橘子', 38, 42, 4, '2020-08-30 10:46:54', NULL, NULL),
	(41, '达州苹果', 37, 123, 4, '2020-08-30 10:47:10', NULL, NULL),
	(42, '红富士苹果', 37, 23, 4, '2020-08-30 10:47:25', NULL, NULL),
	(43, '海南香蕉', 36, 123, 4, '2020-08-30 10:47:45', NULL, NULL),
	(44, '广东芭蕉', 36, 56, 4, '2020-08-30 10:48:00', NULL, NULL),
	(45, '上衣', 27, 23, 4, '2020-08-30 10:48:19', NULL, NULL),
	(46, '下装', 27, 24, 4, '2020-08-30 10:48:31', NULL, NULL),
	(47, 'T恤', 45, 23, 4, '2020-08-30 10:48:50', NULL, NULL),
	(48, '短袖', 45, 23, 4, '2020-08-30 10:49:06', NULL, NULL),
	(49, '7分裤', 46, 23, 4, '2020-08-30 10:49:24', NULL, NULL),
	(50, '9分裤', 46, 23, 4, '2020-08-30 10:49:33', NULL, NULL);
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;

-- 导出  表 lhl-basic.goods_order 结构
CREATE TABLE IF NOT EXISTS `goods_order` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '主键（订单号）',
  `trade_number` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易流水号',
  `platform_user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平台用户id',
  `total_price` double(15,2) DEFAULT NULL COMMENT '订单总价格',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态 1待支付 2已支付 21支付异常  3已退款 31退款异常  4超时失效',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型：1 微信，2 支付宝 3 其他',
  `delivery_status` tinyint(4) DEFAULT NULL COMMENT '配送状态：1 待配货 2 配货完成 3 已出库 4 运输中 5已验收 6已退货 7关闭订单',
  `ext` text COLLATE utf8mb4_bin COMMENT '扩展字段',
  `address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配送地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品订单表';

-- 正在导出表  lhl-basic.goods_order 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `goods_order` DISABLE KEYS */;
INSERT INTO `goods_order` (`id`, `trade_number`, `platform_user_id`, `total_price`, `status`, `pay_type`, `delivery_status`, `ext`, `address`, `create_time`, `update_time`) VALUES
	('492133405098942464', 'ff442446-35f7-4589-8641-a928fe143da5', '1', 50.00, 2, 1, 2, NULL, NULL, '2020-08-15 22:05:01', '2020-08-15 22:05:03');
/*!40000 ALTER TABLE `goods_order` ENABLE KEYS */;

-- 导出  表 lhl-basic.goods_order_item 结构
CREATE TABLE IF NOT EXISTS `goods_order_item` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `order_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单id',
  `goods_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `selling_price` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `goods_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品订单详情表';

-- 正在导出表  lhl-basic.goods_order_item 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `goods_order_item` DISABLE KEYS */;
INSERT INTO `goods_order_item` (`id`, `order_id`, `goods_id`, `goods_name`, `goods_img`, `selling_price`, `goods_count`, `create_time`) VALUES
	('492321166821072896', '492133405098942464', '123', '华为手机', 'http://localhost/carousel/2020-08-02/8CF8A9E0E6FE4F5B955DDAC4BE9DFA74.jpg', 5.50, 10, '2020-08-16 10:30:31'),
	('492321166821072897', '492133405098942464', '1234', '三星手机', 'http://localhost/carousel/2020-08-02/8CF8A9E0E6FE4F5B955DDAC4BE9DFA74.jpg', 10.00, 20, '2020-08-16 10:31:09');
/*!40000 ALTER TABLE `goods_order_item` ENABLE KEYS */;

-- 导出  表 lhl-basic.platform_user 结构
CREATE TABLE IF NOT EXISTS `platform_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `open_id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付宝 或者微信唯一标识',
  `account` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户称呢',
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加盐',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `head_url` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像url',
  `status` tinyint(4) DEFAULT NULL COMMENT ' 1 启用 2冻结',
  `type` tinyint(4) DEFAULT NULL COMMENT '1 平台用户，2 微信  3支付宝',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='平台用户表';

-- 正在导出表  lhl-basic.platform_user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `platform_user` DISABLE KEYS */;
INSERT INTO `platform_user` (`id`, `open_id`, `account`, `name`, `password`, `salt`, `phone`, `head_url`, `status`, `type`, `create_time`) VALUES
	(1, '123', '123', '吕宏力', '123131', '123132', '13404034390', 'http://localhost/carousel/2020-08-02/8CF8A9E0E6FE4F5B955DDAC4BE9DFA74.jpg', 1, 1, '2020-08-08 23:19:18');
/*!40000 ALTER TABLE `platform_user` ENABLE KEYS */;

-- 导出  表 lhl-basic.role_menu_link 结构
CREATE TABLE IF NOT EXISTS `role_menu_link` (
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色和菜单中间表';

-- 正在导出表  lhl-basic.role_menu_link 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `role_menu_link` DISABLE KEYS */;
INSERT INTO `role_menu_link` (`role_id`, `menu_id`) VALUES
	(9, 10),
	(9, 11),
	(9, 12),
	(9, 17),
	(9, 18),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 13),
	(9, 23),
	(9, 25);
/*!40000 ALTER TABLE `role_menu_link` ENABLE KEYS */;

-- 导出  表 lhl-basic.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单名称',
  `access_url` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '访问路径',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `sort` int(4) DEFAULT '0' COMMENT '排序值（越小越往前）',
  `level` int(1) DEFAULT '1' COMMENT '级别（数字越小级别越大）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 正在导出表  lhl-basic.sys_menu 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `name`, `access_url`, `pid`, `sort`, `level`) VALUES
	(10, '系统管理', '', 0, 20, 1),
	(11, '用户管理', '/user/index', 10, 1, 2),
	(12, '角色管理', '/role/index', 10, 2, 2),
	(13, '菜单管理', '/menu/index', 10, 3, 2),
	(17, '管理模块', '', 0, 15, 1),
	(18, '商品管理', '/goods/index', 17, 5, NULL),
	(19, '首页配置', '', 0, 14, 1),
	(20, '轮播图配置', '/carousel/index', 19, 3, 2),
	(21, '平台用户管理', '/platformUser/index', 17, 5, 2),
	(22, '商家管理', '', 0, 5, 1),
	(23, '订单管理', '/goodsOrder/index', 22, 10, 2),
	(25, '商品分类管理', '/goodsCategory/index', 17, 10, 2);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 lhl-basic.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `sort` int(5) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表';

-- 正在导出表  lhl-basic.sys_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `role_name`, `sort`) VALUES
	(9, 'admin', 1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 lhl-basic.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号',
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统用户名称',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统用户表';

-- 正在导出表  lhl-basic.sys_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `account`, `password`, `name`, `create_user`, `create_time`) VALUES
	(4, '123456', '1e8e44b3727f7124879c15a2a861b5da', '吕宏力', 4, '2020-08-30 19:59:41'),
	(5, '111111', '24be733b904545af62de9d91f1b037dc', '小号', NULL, NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 lhl-basic.user_role_link 结构
CREATE TABLE IF NOT EXISTS `user_role_link` (
  `user_id` int(11) DEFAULT NULL COMMENT '系统用户表id',
  `role_id` int(11) DEFAULT NULL COMMENT '系统角色表id',
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色中间表';

-- 正在导出表  lhl-basic.user_role_link 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user_role_link` DISABLE KEYS */;
INSERT INTO `user_role_link` (`user_id`, `role_id`) VALUES
	(4, 9);
/*!40000 ALTER TABLE `user_role_link` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
