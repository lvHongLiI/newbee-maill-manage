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
  `goods_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品标题',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `goods_img` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片url',
  `goods_synopsis` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品简介',
  `goods_price` double(15,2) DEFAULT NULL COMMENT '商品价格',
  `selling_price` double(15,2) DEFAULT NULL COMMENT '销售价格',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 上架 2 下架',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品表';

-- 正在导出表  lhl-basic.goods 的数据：~261 rows (大约)
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `goods_name`, `title`, `category_id`, `goods_img`, `goods_synopsis`, `goods_price`, `selling_price`, `count`, `status`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
	('492454903605010432', '红米9A', '红米9A 新品5000mAh大电量大屏幕', 9, 'https://img.alicdn.com/imgextra/i1/44096902/O1CN01r0LpP620rAGHiaCz1_!!0-saturn_solar.jpg', NULL, 599.00, 599.00, 42, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904255127552', '中兴智能手机', '中兴水滴全面屏4G全网通学生价游戏智能手机', 9, 'https://img.alicdn.com/imgextra/i2/457630161/O1CN01mV8PUC1D3mLo7U905_!!0-saturn_solar.jpg', NULL, 768.00, 338.00, 54, 2, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904280293376', '全国联保品牌手机', '全国联保品牌手机128G水滴屏智能4G全网通', 9, 'https://img.alicdn.com/imgextra/i1/176580041/O1CN01M0mOiF1CAoqxowXOt_!!0-saturn_solar.jpg', NULL, 999.00, 498.00, 49, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904301264896', '微信手机', '深圳2019新店 热销新品全网通4G可微信手机', 9, 'https://img.alicdn.com/imgextra/i2/501340186/O1CN01nUMfUb1DFEHZfqjEA_!!0-saturn_solar.jpg', NULL, 698.00, 179.00, 38, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904326430720', '老人机', '官方正品纽曼 F9C双屏翻盖老人机超', 9, 'https://img.alicdn.com/imgextra/i4/56391633/O1CN01Yzp2VQ1NvxFnOpo6m_!!0-saturn_solar.jpg', NULL, 799.00, 178.00, 67, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904351596544', '三星手机', '正品4G全网通八核智能手机6.26水滴屏学生价', 9, 'https://img.alicdn.com/imgextra/i1/363210020/O1CN01xdlU2Z1C1CXEZYxIy_!!0-saturn_solar.jpg', NULL, 1699.00, 489.00, 57, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904376762368', '三星Samsung', '12期免息预定赠5折Buds Live券Samsung/三星', 9, 'https://img.alicdn.com/imgextra/i2/15237275/O1CN01fdhxXG23bzzlBOOOR_!!0-saturn_solar.jpg', NULL, 9199.00, 9199.00, 57, 2, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904401928192', 'oppoa72手机', 'oppoa72手机 oppo手机 oppo官网旗舰店官a72', 9, 'https://img.alicdn.com/imgextra/i3/14664107/O1CN01wGpLGQ1gD3Ft8IhS5_!!0-saturn_solar.jpg', NULL, 1899.00, 1899.00, 33, 2, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904422899712', '诺基亚老人机', '[满100减20]老人机超长待机大声正品诺基亚', 9, 'https://img.alicdn.com/imgextra/i1/56391633/O1CN0165zPCC1NvxNUyBVm1_!!0-saturn_solar.jpg', NULL, 699.00, 168.00, 25, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492454904443871232', '老年机', '全网通4G 移动电信老年机老人手机大字大声', 9, 'https://img.alicdn.com/imgextra/i4/44155986/O1CN01jxoS7e1u5dOuetSjr_!!0-saturn_solar.jpg', NULL, 528.00, 69.00, 64, 1, 4, '2020-08-16 19:21:04', 4, '2020-08-16 19:21:04'),
	('492456725174460416', '双门对开电冰箱', '450升双门对开电冰箱官方大容量风冷无霜', 10, 'https://img.alicdn.com/imgextra/i4/860310085/O1CN01EAINdP1CUyHUrPvjH_!!0-saturn_solar.jpg', NULL, 2499.00, 2199.00, 63, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725451284480', '奥克斯电冰箱', '奥克斯176升大容量双门上冷藏下冷冻电冰箱', 10, 'https://img.alicdn.com/imgextra/i2/118681139/O1CN01qchkOv1KHhhYkkzVh_!!0-saturn_solar.jpg', NULL, 798.00, 698.00, 33, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725476450304', '小冰箱', '小冰箱 家用 小型 宿舍小型冰箱 租房小冰箱', 10, 'https://img.alicdn.com/imgextra/i3/237970190/O1CN01pxmD2i1DH3nID7PyE_!!0-saturn_solar.jpg', NULL, 568.00, 278.00, 56, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725493227520', '家用电冰箱', '奥克斯146升家用电冰箱双门上冷藏下冷冻', 10, 'https://img.alicdn.com/imgextra/i2/118681139/O1CN01nqhMf31KHhhqbFucq_!!0-saturn_solar.jpg', NULL, 398.00, 378.00, 28, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725526781952', '海尔双开门', '海尔双开门风冷无霜变频WIFI智能操控冰箱', 10, 'https://img.alicdn.com/imgextra/i4/131254644/O1CN01A9x3M51kAzwiansTA_!!0-saturn_solar.jpg', NULL, 3199.00, 2599.00, 49, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725547753472', '小型家用电冰箱', '今日下单抢速冻盒 小冰箱小型家用电冰箱', 10, 'https://img.alicdn.com/imgextra/i3/120693509/O1CN01764IzT1bnAOKdlCiU_!!0-saturn_solar.jpg', NULL, 1299.00, 498.00, 21, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725589696512', '美菱BCD', '美菱BCD-368WPC法式多门四开门四门风冷无霜', 10, 'https://img.alicdn.com/imgextra/i2/111683677/O1CN01vGdF7m1d26wwsAR2m_!!0-saturn_solar.jpg', NULL, 5999.00, 2799.00, 41, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725614862336', '美菱三门冰箱', '美菱三门冰箱风冷无霜变频一级能效家用', 10, 'https://img.alicdn.com/imgextra/i1/111683677/O1CN01Nqy2Oe1d26wyv0lqh_!!0-saturn_solar.jpg', NULL, 3599.00, 2099.00, 38, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725640028160', '奥克斯三门家用电冰箱', '奥克斯122升三门家用电冰箱', 10, 'https://img.alicdn.com/imgextra/i3/118681139/O1CN01g3TlA51KHhhp0j2SI_!!0-saturn_solar.jpg', NULL, 798.00, 658.00, 49, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725660999680', '592升双开门冰箱', '容声592升双开门冰箱对开门家用无霜大容量', 10, 'https://img.alicdn.com/imgextra/i1/111683677/O1CN01GUNbg11d26x3upQYE_!!0-saturn_solar.jpg', NULL, 4999.00, 4599.00, 58, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725681971200', '美的无霜电冰箱', '美的319升智能风冷无霜电冰箱四开门家用', 10, 'https://img.alicdn.com/imgextra/i4/488790059/O1CN01k9Xv6X1CJ3yK9j1xN_!!0-saturn_solar.jpg', NULL, 3999.00, 2999.00, 69, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725707137024', '美的无霜三门式电冰箱', '美的322升智能无霜三门式电冰箱四开门家', 10, 'https://img.alicdn.com/imgextra/i1/488790059/O1CN01KHSZdM1CJ3yRV9fX6_!!0-saturn_solar.jpg', NULL, 6599.00, 5599.00, 24, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725719719936', '奥克斯家用小冰箱', '奥克斯146升金色家用小冰箱宿舍租房节能', 10, 'https://img.alicdn.com/imgextra/i4/118681139/O1CN01VYxPao1KHhijuEtdG_!!0-saturn_solar.jpg', NULL, 748.00, 668.00, 56, 1, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725744885760', '美的华凌', '美的华凌旗舰BCD-450WKH速冻45', 10, 'https://img.alicdn.com/imgextra/i4/1303740127/O1CN01cSPGH71CoCurjnPH8_!!0-saturn_solar.jpg', NULL, 2499.00, 2199.00, 44, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725761662976', '奥克斯小型双门冰箱', '奥克斯实标35L家用电冰箱小型双门', 10, 'https://img.alicdn.com/imgextra/i2/118681139/O1CN01sdXHC51KHhjGJrUy6_!!0-saturn_solar.jpg', NULL, 488.00, 378.00, 38, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725786828800', '海尔冰箱', '当天发货海尔冰箱双开门节能风冷无霜对', 10, 'https://img.alicdn.com/imgextra/i4/535720166/O1CN014cptr41D64Ma3ZF2y_!!0-saturn_solar.jpg', NULL, 3099.00, 2699.00, 20, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725811994624', '美菱开门冰箱', '美菱家用对开门冰箱变频风冷一级能效', 10, 'https://img.alicdn.com/imgextra/i3/111683677/O1CN01YHT0wd1d26x3mDhrt_!!0-saturn_solar.jpg', NULL, 3999.00, 3299.00, 44, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492456725837160448', '志高冰箱', '志高冰箱小型家用小冰箱冷藏冷冻宿舍办公室', 10, 'https://img.alicdn.com/imgextra/i2/673750181/O1CN01AMsWgE1DCwI9UqT4m_!!0-saturn_solar.jpg', NULL, 876.00, 268.00, 21, 2, 4, '2020-08-16 19:28:18', 4, '2020-08-16 19:28:18'),
	('492462250792493056', '风冷无霜电冰箱', '450升双门对开电冰箱官方大容量风冷无霜', 10, 'https://img.alicdn.com/imgextra/i4/860310085/O1CN01EAINdP1CUyHUrPvjH_!!0-saturn_solar.jpg', NULL, 2499.00, 2199.00, 56, 1, 4, '2020-08-16 19:50:15', 4, '2020-08-16 19:50:15'),
	('492464067332972544', '天王表', '天王表机械女表女神礼盒生日送女友纸飞机手', 11, 'https://img.alicdn.com/imgextra/i2/35031141/O1CN01rgkagr1KIcWammb4w_!!0-saturn_solar.jpg', NULL, 1799.00, 1799.00, 46, 2, 4, '2020-08-16 19:57:28', 4, '2020-08-16 19:57:28'),
	('492464067630768128', 'Lola Rose', 'Lola Rose天然贝母表盘蓝宝石玻璃', 11, 'https://img.alicdn.com/imgextra/i1/126069907/O1CN01Moq7bR2N3SRNir1df_!!0-saturn_solar.jpg', NULL, 1380.00, 1060.00, 64, 2, 4, '2020-08-16 19:57:28', 4, '2020-08-16 19:57:28'),
	('492464513254596608', NULL, '颜值担当 旗舰店直售品牌全自动机械表腕表', 11, 'https://img.alicdn.com/imgextra/i3/111410251832970757/TB2PPEUsFXXXXaXXXXXXXXXXXXX_!!0-saturn_solar.jpg', NULL, 1049.00, 1049.00, 29, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513279762432', NULL, '丹尼尔惠灵顿DW女士手表28mm简约时尚腕表', 11, 'https://img.alicdn.com/imgextra/i4/96416556/O1CN01Yh2iI61yIh5EjTz8W_!!0-saturn_solar.jpg', NULL, 1290.00, 1289.00, 29, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513313316864', NULL, 'LolaRose手表女生 简约小清新百搭休闲 时尚', 11, 'https://img.alicdn.com/imgextra/i2/126069907/TB2j2h9nZUrBKNjSZPxXXX00pXa_!!0-saturn_solar.jpg', NULL, 1330.00, 1010.00, 29, 2, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513388814336', NULL, '手表男机械表全自动大表盘多功能特种兵防水', 11, 'https://img.alicdn.com/imgextra/i3/124950023/O1CN01ZjNsY21C2Zifgv3qB_!!0-saturn_solar.jpg', NULL, 726.00, 398.00, 23, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513418174464', NULL, '方形手表女士手表女ins风简约气质女款女', 11, 'https://img.alicdn.com/imgextra/i3/120556272/O1CN010uw4Qe1wCcicJBQsi_!!0-saturn_solar.jpg', NULL, 2999.00, 1499.00, 69, 2, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513464311808', NULL, 'Lola Rose女士手表新款小表盘时尚ins风女表', 11, 'https://img.alicdn.com/imgextra/i1/126069907/O1CN01Bleav22N3SOhAeJmi_!!0-saturn_solar.jpg', NULL, 1380.00, 1060.00, 55, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513489477632', NULL, '正品手表女士机械表女全自动简约气质学生i', 11, 'https://img.alicdn.com/imgextra/i4/32845326/O1CN01hyHztn1pDM3LttQa4_!!0-saturn_solar.jpg', NULL, 1680.00, 388.00, 21, 2, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513510449152', NULL, '天王表手表女表石英表新款时尚休闲防水女士', 11, 'https://img.alicdn.com/imgextra/i2/35031141/O1CN01AmTE8I1KIcWki2Gs1_!!0-saturn_solar.jpg', NULL, 899.00, 899.00, 56, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513527226368', NULL, '卡诗顿手表 商务男表 防水石英表 手表男', 11, 'https://img.alicdn.com/imgextra/i1/98174428/O1CN011ia4FqxCbo1RLct_!!0-saturn_solar.jpg', NULL, 298.00, 163.00, 23, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513548197888', NULL, '世爵方形女士手表石英女表dw复古方表盘女款', 11, 'https://img.alicdn.com/imgextra/i1/120556272/O1CN01bStqcP1wCcj5KucNn_!!0-saturn_solar.jpg', NULL, 2199.00, 1098.00, 39, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513577558016', NULL, 'Lola Rose手表女ins风轻奢女表dw手表小方盘', 11, 'https://img.alicdn.com/imgextra/i3/126069907/O1CN011afU0p2N3SQYMxyx6_!!0-saturn_solar.jpg', NULL, 1380.00, 1060.00, 20, 2, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513598529536', NULL, 'ADEXE英国进口简约小众手表男时尚潮流', 11, 'https://img.alicdn.com/imgextra/i3/123944577/O1CN0126K1ig1jgJN8ZfyPP_!!0-saturn_solar.jpg', NULL, 1180.00, 859.00, 50, 2, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513623695360', NULL, '罗臣男士手表德国多功能夜光全自动机械表', 11, 'https://img.alicdn.com/imgextra/i1/231600027/O1CN01gfInmm1C4PHy47qqA_!!0-saturn_solar.jpg', NULL, 9570.00, 7550.00, 58, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513640472576', NULL, '天王表手表女时尚潮流简约细带防水石英女表', 11, 'https://img.alicdn.com/imgextra/i1/35031141/O1CN01yb1wlF1KIcWijJzgZ_!!0-saturn_solar.jpg', NULL, 855.00, 855.00, 27, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464513674027008', NULL, '老人手表男女款大数字表盘防水妈妈中老年人', 11, 'https://img.alicdn.com/imgextra/i1/15732968/O1CN01jOZIld1XnO85Qkegj_!!0-saturn_solar.jpg', NULL, 218.00, 68.00, 58, 1, 4, '2020-08-16 19:59:15', 4, '2020-08-16 19:59:15'),
	('492464639255683072', NULL, '直播间限时大额优惠券', 12, 'https://img.alicdn.com/imgextra/i2/488390101/O1CN013buFwJ1CcIcM5p8Dr_!!0-saturn_solar.jpg', NULL, 4269.00, 1088.00, 51, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639524118528', NULL, '攀升i5 9400台式家用办公电脑主机全套组装', 12, 'https://img.alicdn.com/imgextra/i2/42357882/O1CN018t36Xz2860OjXT0BO_!!0-saturn_solar.jpg', NULL, 2399.00, 2396.00, 20, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639545090048', NULL, '宁美国度电脑主机i5 9400F游戏主机全套', 12, 'https://img.alicdn.com/imgextra/i3/23569358/O1CN010O22l52J00zSB9NM7_!!0-saturn_solar.jpg', NULL, 2599.00, 2199.00, 57, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639570255872', NULL, 'i5四核/GTX1060台式机电脑主机游戏DIY整机', 12, 'https://img.alicdn.com/imgextra/i4/114749949/O1CN01oMFtYl2NMh4enBGoY_!!0-saturn_solar.jpg', NULL, 2199.00, 1399.00, 21, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639591227392', NULL, '磐蛇游戏型迷你小主机客厅独显iTX机箱吃', 12, 'https://img.alicdn.com/imgextra/i3/114974899/O1CN01v0ESqs1m3mu3XVk6R_!!0-saturn_solar.jpg', NULL, 1899.00, 1399.00, 62, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639616393216', NULL, 'i5/i7八核/GTX1070 8G独显', 12, 'https://img.alicdn.com/imgextra/i1/29192941/O1CN01fzZqzV1Xb1RId3Nzy_!!0-saturn_solar.jpg', NULL, 2199.00, 2199.00, 59, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639654141952', NULL, '电容触摸屏工控一体机工业平板电脑点餐收银', 12, 'https://img.alicdn.com/imgextra/i4/829410191/O1CN01lC01KZ1DHWELnLGaZ_!!0-saturn_solar.jpg', NULL, 2159.00, 2159.00, 65, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639679307776', NULL, '24期免息宁美i7 9700F/RTX2060台式电脑主机', 12, 'https://img.alicdn.com/imgextra/i3/23569358/O1CN01A9ZBpy2J00zvqL34o_!!0-saturn_solar.jpg', NULL, 6199.00, 6099.00, 42, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639696084992', NULL, 'i5 9400F六核/16G DDR4/GTX1060 5G独显吃鸡', 12, 'https://img.alicdn.com/imgextra/i3/338640070/O1CN01WrzP0u1CO6KQYcZsQ_!!2-saturn_solar.png', NULL, 3299.00, 2999.00, 25, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639725445120', NULL, '十代i9 10900K发烧信仰电竞游戏电脑主机', 12, 'https://img.alicdn.com/imgextra/i1/32823173/O1CN01INbGRk1ZJHKTN6Svh_!!0-saturn_solar.jpg', NULL, 7299.00, 7288.00, 35, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639738028032', NULL, '宁美国度AMD锐龙R5 2600/RX580 8G', 12, 'https://img.alicdn.com/imgextra/i3/23569358/O1CN012guFAm2J01041M84B_!!0-saturn_solar.jpg', NULL, 2099.00, 1999.00, 20, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639758999552', NULL, 'i7-9700/GTX1660独显高配吃鸡游戏组装台式', 12, 'https://img.alicdn.com/imgextra/i2/338640070/O1CN01aqsQfq1CO6KwkEWtW_!!0-saturn_solar.jpg', NULL, 5199.00, 5199.00, 55, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639784165376', NULL, 'i5 9400F六核/16G/GTX1070独显8G台式机电脑', 12, 'https://img.alicdn.com/imgextra/i3/338640070/O1CN01V6BNo81CO6KuHH47O_!!0-saturn_solar.jpg', NULL, 6999.00, 5999.00, 43, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639800942592', NULL, 'i7 9700六核/GTX1070独显吃鸡游戏台式电脑', 12, 'https://img.alicdn.com/imgextra/i3/338640070/O1CN01G5wLqT1CO6L4yxcCM_!!0-saturn_solar.jpg', NULL, 6299.00, 6299.00, 36, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639834497024', NULL, '血亏冲量:超低价格 超高配置 超值品质!', 12, 'https://img.alicdn.com/imgextra/i1/33217366/O1CN01nLve9g24Hg2EjX5Oy_!!0-saturn_solar.jpg', NULL, 1298.00, 798.00, 62, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639868051456', NULL, 'i5-10400F六核/GTX1660独显6G/16G内存吃鸡', 12, 'https://img.alicdn.com/imgextra/i1/338640070/O1CN01HcS8bp1CO6L1sx10k_!!0-saturn_solar.jpg', NULL, 3799.00, 3599.00, 51, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639884828672', NULL, '黑蘋果i7 10700/P620/16G', 12, 'https://img.alicdn.com/imgextra/i2/223730064/O1CN015S02pB1CLLxRrW1VH_!!0-saturn_solar.jpg', NULL, 4699.00, 4580.00, 54, 2, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639905800192', NULL, '工业触摸屏一体机电脑 工控一体机 平板电脑', 12, 'https://img.alicdn.com/imgextra/i2/829410191/O1CN01N8Q5bb1DHWGQtP5A8_!!0-saturn_solar.jpg', NULL, 1269.00, 1269.00, 40, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639918383104', NULL, 'i3 9100F四核/GTX1050Ti 4G独显16G DDR4高', 12, 'https://img.alicdn.com/imgextra/i2/338640070/O1CN01f1LphX1CO6KOYUUSP_!!0-saturn_solar.jpg', NULL, 1899.00, 1699.00, 60, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492464639939354624', NULL, 'i5 9400F六核/GTX1060独显 台式电脑主机 家', 12, 'https://img.alicdn.com/imgextra/i3/338640070/O1CN01xqByjM1CO6L2Q542s_!!0-saturn_solar.jpg', NULL, 4199.00, 4199.00, 42, 1, 4, '2020-08-16 19:59:45', 4, '2020-08-16 19:59:45'),
	('492466642325250048', NULL, 'GTX1650 SUPER吃鸡电脑台式游戏显卡4G', 13, 'https://img.alicdn.com/imgextra/i2/35624975/O1CN015rGZaN1mcb1ZiTCui_!!0-saturn_solar.jpg', NULL, 1399.00, 999.00, 64, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642715320320', NULL, '祺祥GTX750TI 2G三年质保 台式机电脑2g显卡', 13, 'https://img.alicdn.com/imgextra/i1/1162430172/O1CN01KAg8IC1D8ojDuua6U_!!0-saturn_solar.jpg', NULL, 699.00, 369.00, 31, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642740486144', NULL, '卡诺基GTX750 TI 4G悍将办公电脑显卡台式机', 13, 'https://img.alicdn.com/imgextra/i3/36644761/O1CN01e72pJR1l2aH4TUX9E_!!0-saturn_solar.jpg', NULL, 588.00, 348.00, 25, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642765651968', NULL, '卡诺基GTX750 2G D5 办公 游戏 独立显卡', 13, 'https://img.alicdn.com/imgextra/i4/36644761/O1CN01DT4Jyc1l2aGrWWuet_!!0-saturn_solar.jpg', NULL, 278.00, 278.00, 33, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642799206400', NULL, '祺祥 GTX960 2G 台式机电脑独立', 13, 'https://img.alicdn.com/imgextra/i2/1162430172/O1CN01MwKi8r1D8ojFFmqwm_!!0-saturn_solar.jpg', NULL, 1009.00, 429.00, 31, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642832760832', NULL, '高清摄像头笔记本台式孩子学生网课网络', 13, 'https://img.alicdn.com/imgextra/i4/131134041/TB23FeStNSYBuNjSsphXXbGvVXa_!!0-saturn_solar.jpg', NULL, 199.00, 149.00, 68, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642866315264', NULL, '铭鑫GT710 2GBD3 三屏多屏台式', 13, 'https://img.alicdn.com/imgextra/i3/31947725/O1CN015leii326w6Cvl4xsK_!!0-saturn_solar.jpg', NULL, 299.00, 299.00, 67, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642899869696', NULL, '铭鑫RX560D显卡4G酷能版D5台式机', 13, 'https://img.alicdn.com/imgextra/i3/31947725/O1CN016EJYMO26w6Cr6FJai_!!0-saturn_solar.jpg', NULL, 379.00, 379.00, 24, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642929229824', NULL, '铭鑫HD6790-1GBD5全新库存低价', 13, 'https://img.alicdn.com/imgextra/i4/31947725/O1CN01s9yNR826w6DiUKKhd_!!0-saturn_solar.jpg', NULL, 299.00, 299.00, 62, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642954395648', NULL, '铭鑫GTX1050Ti 4G辉煌版独显吃', 13, 'https://img.alicdn.com/imgextra/i4/31947725/O1CN01WHvFHU26w6CrdN9Ws_!!0-saturn_solar.jpg', NULL, 788.00, 788.00, 53, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642979561472', NULL, '华硕TUF GTX1660S SUPER', 13, 'https://img.alicdn.com/imgextra/i1/57009566/O1CN01W8grLI2KXHMj0ObZK_!!0-saturn_solar.jpg', NULL, 1649.00, 1539.00, 57, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466642996338688', NULL, 'Pzoz显卡支架全铝合金支撑架固定托架伴侣', 13, 'https://img.alicdn.com/imgextra/i4/47662412/O1CN01TKPTJa1TgjvTeMJZu_!!0-saturn_solar.jpg', NULL, 60.00, 38.00, 60, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643025698816', NULL, '急速发货HKC G27 27英寸14', 13, 'https://img.alicdn.com/imgextra/i2/35180519/O1CN010iDVtb1FhkAq9Zz1Q_!!2-saturn_solar.png', NULL, 2999.00, 1069.00, 26, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643050864640', NULL, '三星全新27英寸75HZ曲面办公电脑屏幕显示器', 13, 'https://img.alicdn.com/imgextra/i2/49486739/O1CN01S2tXme1zeVhcllxKL_!!0-saturn_solar.jpg', NULL, 1499.00, 569.00, 33, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643067641856', NULL, '铭鑫GTX1050TI 4GBD5游戏升', 13, 'https://img.alicdn.com/imgextra/i3/31947725/O1CN01NBdGAa26w6CuTZChE_!!0-saturn_solar.jpg', NULL, 758.00, 758.00, 56, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643101196288', NULL, '客所思KX-2传奇版 USB外置声卡台式', 13, 'https://img.alicdn.com/imgextra/i1/2277879343/O1CNA1gH00uG100eafe87b6f0b1579890009_!!1-0-picassodesign.jpg', NULL, 320.00, 320.00, 22, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643126362112', NULL, '磐镭pci-e 1x 4x 8x 16x', 13, 'https://img.alicdn.com/imgextra/i3/417520088/O1CN0139fGOv1CWLRpxuTc6_!!0-saturn_solar.jpg', NULL, 439.00, 439.00, 60, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643151527936', NULL, '美商海盗船统治者32G 2666/3000/3600内存条', 13, 'https://img.alicdn.com/imgextra/i1/112563851/O1CN01SlIWQ91eJnrj7LHL2_!!0-saturn_solar.jpg', NULL, 2999.00, 969.00, 35, 2, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643172499456', NULL, '磐镭RX560 2G/4G显卡吃鸡游戏显', 13, 'https://img.alicdn.com/imgextra/i3/417520088/O1CN01CLmLwh1CWLT60JCN7_!!0-saturn_solar.jpg', NULL, 639.00, 338.00, 65, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492466643197665280', NULL, '铭鑫GT1030超低功耗组建HDPC游戏', 13, 'https://img.alicdn.com/imgextra/i4/31947725/O1CN01nLBLKL26w6DEY6pNx_!!0-saturn_solar.jpg', NULL, 419.00, 419.00, 31, 1, 4, '2020-08-16 20:07:42', 4, '2020-08-16 20:07:42'),
	('492467189707087872', NULL, '顺丰闪发 月光宝盒 家用街机 游戏机 可下载', 15, 'https://img.alicdn.com/imgextra/i4/510180158/O1CN01eZZtej1D2PAyJPZOr_!!0-saturn_solar.jpg', NULL, 576.00, 275.00, 36, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467189996494848', NULL, '新款sup掌上游戏机复古掌机儿童怀旧经典', 15, 'https://img.alicdn.com/imgextra/i4/796600106/O1CN01GG7Wog1CeaagEe5yU_!!0-saturn_solar.jpg', NULL, 154.80, 24.60, 31, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190030049280', NULL, '莱仕达 街机摇杆拳皇97家用电脑双人格斗', 15, 'https://img.alicdn.com/imgextra/i3/23332760/O1CN01Of4Gi41WG7l2Wcu1l_!!0-saturn_solar.jpg', NULL, 299.00, 138.00, 49, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190055215104', NULL, '莱仕达任天堂switch手柄ns pro', 15, 'https://img.alicdn.com/imgextra/i4/23332760/O1CN01wDXgj41WG7kgnLQ2p_!!0-saturn_solar.jpg', NULL, 239.00, 188.00, 51, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190080380928', NULL, '莱仕达雷霆Pro电脑模拟飞行摇杆微软民航', 15, 'https://img.alicdn.com/imgextra/i4/23332760/O1CN01zyRYm81WG7l4Fcbhv_!!0-saturn_solar.jpg', NULL, 268.00, 268.00, 64, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190097158144', NULL, 'switch pro手柄ns游戏机lite国产原装连发', 15, 'https://img.alicdn.com/imgextra/i3/23332760/O1CN01DlHnJb1WG7kozwe3f_!!0-saturn_solar.jpg', NULL, 239.00, 188.00, 59, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190130712576', NULL, '小米手机游戏手柄蓝牙无线安卓手游吃鸡神器', 15, 'https://img.alicdn.com/imgextra/i4/23332760/O1CN01w9uH7d1WG7l2ASja9_!!0-saturn_solar.jpg', NULL, 198.00, 108.00, 38, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190155878400', NULL, '小霸王游戏机怀旧款老式插卡fc电视红白机', 15, 'https://img.alicdn.com/imgextra/i3/482570042/O1CN01CzCMUY1CBHFJrmIhN_!!0-saturn_solar.jpg', NULL, 176.00, 88.00, 69, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190181044224', NULL, '卡健身环圈全套配件Ring fit Adventure中文', 15, 'https://img.alicdn.com/imgextra/i4/1349490093/O1CN01ahirzp1CYdRzUcPyz_!!0-saturn_solar.jpg', NULL, 379.01, 379.01, 38, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190197821440', NULL, '小霸王体感游戏机无线跳舞毯瑜伽垫家用双人', 15, 'https://img.alicdn.com/imgextra/i3/121373048/O1CN01yrzsdf1YO1pBrUuW3_!!0-saturn_solar.jpg', NULL, 598.00, 598.00, 42, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190222987264', NULL, 'sup掌上游戏机怀旧款老式街机儿童便携式', 15, 'https://img.alicdn.com/imgextra/i2/796600106/O1CN01poKVWt1CeaaYBqhht_!!0-saturn_solar.jpg', NULL, 216.80, 54.80, 32, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190248153088', NULL, '吃鸡神器合金按键辅助金属机械手游手柄小经', 15, 'https://img.alicdn.com/imgextra/i4/694080077/O1CN01KoE0ec1CRJ5uRwVBz_!!0-saturn_solar.jpg', NULL, 12.00, 6.00, 26, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190264930304', NULL, '任天堂switch游戏手柄蓝戏机joycon异度之刃', 15, 'https://img.alicdn.com/imgextra/i2/58059784/O1CN01EOrvzj2M97iGdPoSc_!!0-saturn_solar.jpg', NULL, 85.01, 80.75, 44, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190290096128', NULL, 'ntendo游戏机滑轨摇杆帽拆机螺丝刀工具', 15, 'https://img.alicdn.com/imgextra/i2/58059784/O1CN01aT8JPH2M97iRpy5wr_!!0-saturn_solar.jpg', NULL, 9.91, 9.91, 56, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190306873344', NULL, 'HONCAM拳皇97街机游戏摇杆街头霸王', 15, 'https://img.alicdn.com/imgextra/i1/2206706223283/O1CNA1HRCRXB100ebc64c1fa0b0ba73b001f_!!1-0-picassodesign.jpg', NULL, 476.00, 218.00, 39, 1, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190332039168', NULL, '飞智蜂翼PRO手机散热器蜂刺黄蜂2游戏手', 15, 'https://img.alicdn.com/imgextra/i1/3217513641/O1CNA1MctnuC100ebd282bbd0b0f7561000a_!!1-0-picassodesign.jpg', NULL, 291.00, 110.00, 61, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190357204992', NULL, '莱仕达双翼2 微软模拟飞行摇杆民航飞机操', 15, 'https://img.alicdn.com/imgextra/i2/23332760/O1CN01qrUQz91WG7ksgLUBY_!!0-saturn_solar.jpg', NULL, 329.00, 299.00, 20, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190382370816', NULL, '外星科技 ET-78N健身运动娱乐 电视', 15, 'https://img.alicdn.com/imgextra/i2/40978509/O1CN01HPARrz2CjAhsU4oRk_!!0-saturn_solar.jpg', NULL, 49.90, 49.90, 21, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190399148032', NULL, '全开腕带游戏机手柄健身环保护壳周边配件', 15, 'https://img.alicdn.com/imgextra/i2/58059784/O1CN01s1JRUd2M97hrcSQIU_!!0-saturn_solar.jpg', NULL, 25.01, 8.90, 60, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467190424313856', NULL, '小霸王游戏机怀旧红白机经典FC超级玛丽坦克', 15, 'https://img.alicdn.com/imgextra/i1/121373048/O1CN01VA0YIz1YO1iyC4TYO_!!0-saturn_solar.jpg', NULL, 99.00, 88.00, 52, 2, 4, '2020-08-16 20:09:53', 4, '2020-08-16 20:09:53'),
	('492467194270490624', NULL, '方太Y21E二星带烘干消毒碗柜家用嵌入式台式', 16, 'https://img.alicdn.com/imgextra/i2/25879592/O1CN01WKR2D12KjBgAdp3cQ_!!0-saturn_solar.jpg', NULL, 2199.00, 2099.00, 23, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194295656448', NULL, '索太 HJ 双电机集成灶侧吸式油烟机灶具', 16, 'https://img.alicdn.com/imgextra/i3/101309349/O1CN01jIpbdV2IvtR3EkId4_!!0-saturn_solar.jpg', NULL, 7160.00, 3580.00, 35, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194325016576', NULL, '华为智慧屏X65 65吋OLED智能电视 4K超高清', 16, 'https://img.alicdn.com/imgextra/i4/114234393/O1CN01sbolfl1iK2X5cKLJC_!!0-saturn_solar.jpg', NULL, 24999.00, 24999.00, 39, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194345988096', NULL, '康佳kktv K32 电视机32英寸高清', 16, 'https://img.alicdn.com/imgextra/i3/58600869/O1CN01mXY3R41II2nTaamTX_!!0-saturn_solar.jpg', NULL, 1099.00, 699.00, 69, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194362765312', NULL, '首降1000元华为智慧屏75吋高清视', 16, 'https://img.alicdn.com/imgextra/i4/114234393/O1CN01Kqs9qK1iK2XD0SXmB_!!0-saturn_solar.jpg', NULL, 12999.00, 12999.00, 27, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194379542528', NULL, '华为荣耀智慧屏X1 65英寸4K全面屏智能电视', 16, 'https://img.alicdn.com/imgextra/i2/34403627/O1CN01aA3E6j1cfD9CZSc1g_!!0-saturn_solar.jpg', NULL, 3299.00, 3299.00, 21, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194404708352', NULL, '首降1000元华为智慧屏65吋高清视', 16, 'https://img.alicdn.com/imgextra/i3/114234393/O1CN01NbQ9eF1iK2X8lbVvl_!!0-saturn_solar.jpg', NULL, 6999.00, 6999.00, 41, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194417291264', NULL, '索太 HP双电机翻盖集成灶侧吸式油烟机灶', 16, 'https://img.alicdn.com/imgextra/i3/101309349/O1CN01J3LVhl2IvtQuXEuFJ_!!0-saturn_solar.jpg', NULL, 8160.00, 4080.00, 51, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194442457088', NULL, '华为智慧屏V55i-B 55吋4K超高清 华为', 16, 'https://img.alicdn.com/imgextra/i3/114234393/O1CN01Us20HP1iK2X8cxVj7_!!0-saturn_solar.jpg', NULL, 3799.00, 3799.00, 62, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194463428608', NULL, '32寸高清网络电视机 65寸4k高清曲面电视机', 16, 'https://img.alicdn.com/imgextra/i4/426020125/O1CN01wo7ZGv1CnI7EZqJoU_!!0-saturn_solar.jpg', NULL, 966.00, 483.00, 51, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194480205824', NULL, 'TCL 55Q8 55英寸 4K超高清人工智能AI安卓智', 16, 'https://img.alicdn.com/imgextra/i2/55269747/O1CN01v7zavj2LsB4MmZHai_!!0-saturn_solar.jpg', NULL, 5999.00, 4599.00, 65, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194496983040', NULL, 'TCL 65Q8 65英寸 4K超高清安卓全场景AI人工', 16, 'https://img.alicdn.com/imgextra/i1/55269747/O1CN01zo26om2LsB4L9SOxf_!!0-saturn_solar.jpg', NULL, 8999.00, 6699.00, 32, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194522148864', NULL, '液晶显示器可移动电视机支架落地式挂架', 16, 'https://img.alicdn.com/imgextra/i1/520080149/O1CN017ySJka1CyHcSfVopv_!!0-saturn_solar.jpg', NULL, 499.00, 109.00, 52, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194534731776', NULL, '奢华美式卧室电视柜主卧高款欧式实木电视机', 16, 'https://img.alicdn.com/imgextra/i3/294130142/O1CN016AUwYn1Cv4rGsofUd_!!0-saturn_solar.jpg', NULL, 12376.00, 6188.00, 39, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194555703296', NULL, '新品发售华为荣耀智慧屏X1 55英寸4K', 16, 'https://img.alicdn.com/imgextra/i4/34403627/O1CN015rJ47l1cfD97LWFuY_!!0-saturn_solar.jpg', NULL, 2299.00, 2299.00, 25, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194576674816', NULL, 'Huawei/华为智慧屏 V65i 65', 16, 'https://img.alicdn.com/imgextra/i1/114234393/O1CN01Rvnkjw1iK2X9pqbBm_!!0-saturn_solar.jpg', NULL, 5499.00, 5499.00, 66, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194593452032', NULL, 'Samsung/三星新品上市55英寸4K超高清电视机', 16, 'https://img.alicdn.com/imgextra/i2/109845444/O1CN01wRN1Bt1q5OnYlWnsT_!!0-saturn_solar.jpg', NULL, 3599.00, 2999.00, 63, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194618617856', NULL, '飞利浦电视旗舰店65英寸8005网络智能', 16, 'https://img.alicdn.com/imgextra/i1/596120070/O1CN01myML1U1CO6LCC0BN1_!!0-saturn_solar.jpg', NULL, 9099.00, 8999.00, 25, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194631200768', NULL, '电视机55高清4k智能haier全面屏英寸海尔', 16, 'https://img.alicdn.com/imgextra/i1/128935493/O1CN01E0gY1B1qRqCr39zvE_!!0-saturn_solar.jpg', NULL, 3999.00, 3999.00, 28, 1, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467194652172288', NULL, '三星65英寸QLED量子点 4K平板电视机', 16, 'https://img.alicdn.com/imgextra/i2/109845444/O1CN01PJKd0n1q5OnaVVjWo_!!0-saturn_solar.jpg', NULL, 10999.00, 7999.00, 24, 2, 4, '2020-08-16 20:09:54', 4, '2020-08-16 20:09:54'),
	('492467199140077568', NULL, '海尔10公斤直驱变频洗烘一体滚筒洗衣机智能', 17, 'https://img.alicdn.com/imgextra/i3/18307420/O1CN01GCHo6424gPQT8oIgO_!!0-saturn_solar.jpg', NULL, 6999.00, 5899.00, 49, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199156854784', NULL, '松下10kg洗烘一体机除螨除菌智能滚筒', 17, 'https://img.alicdn.com/imgextra/i4/46723735/O1CN01WfykEt1dSfrqKOroC_!!0-saturn_solar.jpg', NULL, 6598.00, 5798.00, 55, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199182020608', NULL, '海尔10kg洗衣机全自动家用滚筒变频洗烘一体', 17, 'https://img.alicdn.com/imgextra/i3/18307420/O1CN01NjZoZo24gPQQV0oMK_!!0-saturn_solar.jpg', NULL, 8499.00, 7499.00, 54, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199194603520', NULL, '长虹洗衣机全自动家用租房小型洗脱一体甩干', 17, 'https://img.alicdn.com/imgextra/i4/590730082/O1CN01yvhvro1CTb2VfyPSC_!!0-saturn_solar.jpg', NULL, 710.00, 308.00, 56, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199211380736', NULL, '松下洗衣机10kg洗烘一体机除菌除味', 17, 'https://img.alicdn.com/imgextra/i3/46723735/O1CN01F2HnZG1dSfvJOML6i_!!0-saturn_solar.jpg', NULL, 15698.00, 8498.00, 64, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199236546560', NULL, '海尔10kg烘干洗衣机全自动家用滚筒彩屏变频', 17, 'https://img.alicdn.com/imgextra/i2/18307420/O1CN01P2QaKr24gPQNWOEYZ_!!0-saturn_solar.jpg', NULL, 6999.00, 5999.00, 56, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199249129472', NULL, '松下10kg滚筒洗衣机智能变频', 17, 'https://img.alicdn.com/imgextra/i2/46723735/O1CN019Kb9141dSfrlBEpdb_!!0-saturn_solar.jpg', NULL, 4998.00, 4698.00, 63, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199270100992', NULL, '海尔洗烘一体洗衣机滚筒10公斤直驱变频', 17, 'https://img.alicdn.com/imgextra/i1/18307420/O1CN01QDFTaH24gPQS0C3cu_!!0-saturn_solar.jpg', NULL, 6899.00, 5999.00, 21, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199286878208', NULL, '海尔统帅杀菌洗烘一体家用滚筒全自动洗衣机', 17, 'https://img.alicdn.com/imgextra/i1/18307420/O1CN01vMnPqf24gPQNeaVBj_!!0-saturn_solar.jpg', NULL, 3999.00, 2499.00, 32, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199312044032', NULL, 'Panasonic/松下 XQG80-N80WT 8KG高效变频静', 17, 'https://img.alicdn.com/imgextra/i1/46723735/O1CN01nwmkct1dSfvI5Cwbq_!!0-saturn_solar.jpg', NULL, 4298.00, 3598.00, 69, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199328821248', NULL, 'Panasonic/松下 XQG90-NG90WT 9kg除螨除菌', 17, 'https://img.alicdn.com/imgextra/i1/46723735/O1CN01NA7fb41dSfvJXZqpH_!!0-saturn_solar.jpg', NULL, 6298.00, 5298.00, 49, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199345598464', NULL, '松下8kg智能静音滚筒BLDC电机', 17, 'https://img.alicdn.com/imgextra/i2/46723735/O1CN01hhfb6q1dSfvIiCn8M_!!0-saturn_solar.jpg', NULL, 4598.00, 3398.00, 62, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199366569984', NULL, '海尔智能10公斤洗烘一体变频滚筒洗衣机', 17, 'https://img.alicdn.com/imgextra/i3/18307420/O1CN01LIPOXo24gPQNt4Hwc_!!0-saturn_solar.jpg', NULL, 5899.00, 3999.00, 47, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199379152896', NULL, '海飞10公斤半自动双桶洗衣机大容量宿舍家用', 17, 'https://img.alicdn.com/imgextra/i4/551140077/O1CN01Sjygfc1CRJ4NwrQlH_!!0-saturn_solar.jpg', NULL, 278.00, 258.00, 64, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199400124416', NULL, '长虹10KG全自动洗衣机家用波轮热烘干', 17, 'https://img.alicdn.com/imgextra/i3/756460102/O1CN01u99wED1Ccl0C5iavo_!!0-saturn_solar.jpg', NULL, 1158.00, 658.00, 59, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199429484544', NULL, '小天鹅洗衣机全自动家用滚筒洗衣机洗脱一体', 17, 'https://img.alicdn.com/imgextra/i1/31288939/O1CN01s2PZQq2Fu736dOzvf_!!0-saturn_solar.jpg', NULL, 4599.00, 2799.00, 34, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199446261760', NULL, '西门子家用全自动洗衣机 变频超薄嵌入', 17, 'https://img.alicdn.com/imgextra/i1/58294401/O1CN018LuGYV1iNhhFC8lSV_!!0-saturn_solar.jpg', NULL, 5999.00, 4299.00, 26, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199463038976', NULL, '西门子家用全自动洗烘一体机洗衣烘干机10KG', 17, 'https://img.alicdn.com/imgextra/i1/58294401/O1CN01vDzshB1iNhhOPD3CN_!!0-saturn_solar.jpg', NULL, 7299.00, 6199.00, 28, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199479816192', NULL, '海尔直驱变频滚筒洗衣机全自动9公斤家用', 17, 'https://img.alicdn.com/imgextra/i1/431180161/O1CN01bxhF2O1D3mNCfFcpR_!!0-saturn_solar.jpg', NULL, 4999.00, 2499.00, 48, 2, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467199500787712', NULL, '西门子家用全自动滚筒洗衣机 9kg大容量', 17, 'https://img.alicdn.com/imgextra/i3/58294401/O1CN01IA0Kxw1iNhhc1Vhdg_!!0-saturn_solar.jpg', NULL, 4999.00, 4199.00, 58, 1, 4, '2020-08-16 20:09:55', 4, '2020-08-16 20:09:55'),
	('492467202155782144', NULL, '海尔家用吹风机负离子护发不伤发大功率电吹', 18, 'https://img.alicdn.com/imgextra/i3/1220520171/O1CN01P8DbfS1D8MLIqcOgV_!!0-saturn_solar.jpg', NULL, 338.00, 219.00, 66, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202176753664', NULL, '电吹风机发型师专用理发店发廊大功率静音', 18, 'https://img.alicdn.com/imgextra/i4/111378706/O1CN01LafzvH2EBOkDiMOx2_!!0-saturn_solar.jpg', NULL, 399.00, 199.00, 49, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202193530880', NULL, '海尔家用电吹风机负离子护发无辐射吹风机孕', 18, 'https://img.alicdn.com/imgextra/i3/1220520171/O1CN0183Ma6L1D8MLKKxMKW_!!0-saturn_solar.jpg', NULL, 389.00, 249.00, 55, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202210308096', NULL, '家用冷热风低辐射负离子健康护发电吹风机', 18, 'https://img.alicdn.com/imgextra/i1/3356906734/O1CNA1sgIKWq100ebce7ae0a0b0f9acd000x_!!1-0-picassodesign.jpg', NULL, 799.00, 179.00, 51, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202222891008', NULL, '平价推荐!原来负离子吹风机真的不一样', 18, 'https://img.alicdn.com/imgextra/i4/545620196/O1CN01TScO7E1DJoESGckj9_!!0-saturn_solar.jpg', NULL, 199.00, 149.00, 37, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202248056832', NULL, 'VGO2020新品吹发棒负离子护发电吹风', 18, 'https://img.alicdn.com/imgextra/i3/295680041/O1CN01oRarwz1CAor3dTQ7N_!!0-saturn_solar.jpg', NULL, 1999.00, 999.00, 38, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202256445440', NULL, '电吹风机置物架卫生间免打孔风筒支架挂架', 18, 'https://img.alicdn.com/imgextra/i1/45180165/O1CN01YaBtu81D5bxdGgdVf_!!0-saturn_solar.jpg', NULL, 39.80, 19.90, 34, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202281611264', NULL, 'VGO吹风机负离子 护发家用静音 无声吹风筒', 18, 'https://img.alicdn.com/imgextra/i2/295680041/O1CN01ADVJyP1CAor0C0TYA_!!0-saturn_solar.jpg', NULL, 599.00, 249.00, 60, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202294194176', NULL, '松下吹风机家用大功率纳米水离子不伤发冷热', 18, 'https://img.alicdn.com/imgextra/i1/109946936/O1CN01jUEu2P216jjEZGj5R_!!0-saturn_solar.jpg', NULL, 899.00, 329.00, 52, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202319360000', NULL, '拍下优惠100元德国原装59秒速干!超静音!', 18, 'https://img.alicdn.com/imgextra/i2/793800186/O1CN01eY2Fe01DFEG4jwakb_!!0-saturn_solar.jpg', NULL, 456.00, 208.00, 40, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202331942912', NULL, 'Lowrarouge罗拉吹风机家用负离子护发大功率', 18, 'https://img.alicdn.com/imgextra/i4/385420161/O1CN01Xu7iai1D3mNrwe4MK_!!0-saturn_solar.jpg', NULL, 899.00, 249.00, 51, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202348720128', NULL, 'LANSAM电吹风机家用大功率理发店发廊', 18, 'https://img.alicdn.com/imgextra/i4/113326244/O1CN01km13dB1vzneRnC8hV_!!0-saturn_solar.jpg', NULL, 560.00, 560.00, 61, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202373885952', NULL, '月立小型迷你电吹风机小功率学生女生宿舍用', 18, 'https://img.alicdn.com/imgextra/i4/114507183/O1CN01J0baVX22vrYb20T6Q_!!0-saturn_solar.jpg', NULL, 269.00, 139.00, 54, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202390663168', NULL, '小适新品电吹风 全新技术升级!', 18, 'https://img.alicdn.com/imgextra/i2/575970061/O1CN010HZr1z1CJymCbipIv_!!0-saturn_solar.jpg', NULL, 299.00, 139.00, 31, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202407440384', NULL, '松下吹风机家用纳米水离子大功率风筒智能冷', 18, 'https://img.alicdn.com/imgextra/i4/109946936/O1CN01nZTQle216jjBZP261_!!0-saturn_solar.jpg', NULL, 2199.00, 1299.00, 28, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202428411904', NULL, '电吹风机家用理发店风力大功率发廊专用风筒', 18, 'https://img.alicdn.com/imgextra/i2/108728080/O1CN01DDnJtU29YgozD0aiB_!!0-saturn_solar.jpg', NULL, 359.00, 75.00, 52, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202449383424', NULL, '电吹风机家用大功率宿舍用学生风筒发廊静音', 18, 'https://img.alicdn.com/imgextra/i2/437930091/O1CN01cAzorG1CXic7hAmfJ_!!0-saturn_solar.jpg', NULL, 199.00, 49.90, 64, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202466160640', NULL, '大风力电吹风机发廊大功率蓝光护发水负离子', 18, 'https://img.alicdn.com/imgextra/i4/108728080/O1CN01XZ5hI029YgolVHYso_!!0-saturn_solar.jpg', NULL, 299.00, 128.00, 64, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202482937856', NULL, '松下纳米水负离子电吹风机家用理发店大功率', 18, 'https://img.alicdn.com/imgextra/i1/109946936/O1CN01WLXHSV216jjFakLGr_!!0-saturn_solar.jpg', NULL, 1199.00, 429.00, 42, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467202499715072', NULL, '吹风机家用理发店不伤发大功率发廊专用电吹', 18, 'https://img.alicdn.com/imgextra/i4/124057834/O1CN01uFX1CH27k1NsXBVS5_!!0-saturn_solar.jpg', NULL, 288.00, 59.00, 35, 1, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467205385396224', NULL, '苏泊尔大吸力油烟机侧吸式家用厨房抽油姻机', 19, 'https://img.alicdn.com/imgextra/i3/45653021/O1CN01YQiXB51YBf8BfXWsc_!!0-saturn_solar.jpg', NULL, 1699.00, 899.00, 20, 2, 4, '2020-08-16 20:09:56', 4, '2020-08-16 20:09:56'),
	('492467205414756352', NULL, '志高家用抽油烟机中式厨房吸油烟机小型顶吸', 19, 'https://img.alicdn.com/imgextra/i1/504330018/O1CN01mlBuyy1C0HjlikBCm_!!0-saturn_solar.jpg', NULL, 999.00, 288.00, 24, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205431533568', NULL, '志高欧式顶吸式抽油烟机家用厨房大吸力吸油', 19, 'https://img.alicdn.com/imgextra/i2/504330018/O1CN01Ze0YD31C0HjUzujc5_!!0-saturn_solar.jpg', NULL, 1596.00, 598.00, 45, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205456699392', NULL, 'Hisense/海信7501抽油烟机家用', 19, 'https://img.alicdn.com/imgextra/i1/116055893/O1CN01wj7xJe1tP2dFpxnGS_!!0-saturn_solar.jpg', NULL, 1699.00, 999.00, 41, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205477670912', NULL, '家用抽油烟机顶吸式T型脱排自动清洗欧式', 19, 'https://img.alicdn.com/imgextra/i4/437670070/O1CN01lkhLXR1CO6K2CozYC_!!0-saturn_solar.jpg', NULL, 576.00, 288.00, 47, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205490253824', NULL, '新飞双电机自动清洗抽油烟机壁挂式抽烟机家', 19, 'https://img.alicdn.com/imgextra/i1/614100170/O1CN01VnyWrh1D7tweHkIlr_!!0-saturn_solar.jpg', NULL, 598.00, 268.00, 57, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205507031040', NULL, '万家乐AL021壁挂式 抽油烟机 家用 厨房烟机', 19, 'https://img.alicdn.com/imgextra/i3/120986112/O1CN01xeZrJz1v1LMxN4wDR_!!0-saturn_solar.jpg', NULL, 1996.00, 1996.00, 46, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205540585472', NULL, '抽烟机双电机油烟机侧吸式自动清洗家用吸抽', 19, 'https://img.alicdn.com/imgextra/i4/48631256/O1CN01aeFxB61L9I4HkyYOC_!!0-saturn_solar.jpg', NULL, 1968.00, 238.00, 27, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205557362688', NULL, 'Macro/万家乐 CXW-200-AL713侧吸式抽油烟机', 19, 'https://img.alicdn.com/imgextra/i4/120986112/O1CN019GaFIF1v1LN4JC1zE_!!0-saturn_solar.jpg', NULL, 748.00, 748.00, 41, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205578334208', NULL, '顾家集成灶一体灶变频家用消毒柜油烟机侧吸', 19, 'https://img.alicdn.com/imgextra/i3/43675131/O1CN01hJMX321nm2pYnlXjy_!!0-saturn_solar.jpg', NULL, 12999.00, 2380.00, 51, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205595111424', NULL, '好太太抽油烟机家用厨房大吸力侧吸壁挂式油', 19, 'https://img.alicdn.com/imgextra/i4/1201140180/O1CN01ApT1vC1DCTuPFG2UF_!!0-saturn_solar.jpg', NULL, 3999.00, 1398.00, 59, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205611888640', NULL, '华帝新品i11151抽油烟机家用侧式吸油烟机厨', 19, 'https://img.alicdn.com/imgextra/i1/26768098/O1CN01atXqZu29gvxOPvAk7_!!0-saturn_solar.jpg', NULL, 4999.00, 4999.00, 63, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205632860160', NULL, '格兰仕抽油烟机家用厨房侧吸式排抽烟机油畑', 19, 'https://img.alicdn.com/imgextra/i2/1122690194/O1CN01LnDVtw1DItSBVfazF_!!0-saturn_solar.jpg', NULL, 899.00, 689.00, 34, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205649637376', NULL, '创维油烟机7字型顶侧双吸家用厨房抽油烟机', 19, 'https://img.alicdn.com/imgextra/i4/307060015/O1CN01YESg4f1ByuYdJrppt_!!0-saturn_solar.jpg', NULL, 3299.00, 999.00, 35, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205670608896', NULL, '德普凯信 嵌入式集成灶蒸烤箱一体灶家用', 19, 'https://img.alicdn.com/imgextra/i2/25582089/O1CN0119VkpY1RIny8nmUR4_!!0-saturn_solar.jpg', NULL, 8250.00, 5299.00, 43, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205683191808', NULL, '美的自动清洗侧吸式抽油烟机家用厨房大吸力', 19, 'https://img.alicdn.com/imgextra/i2/869070069/O1CN01Aa0joy1CNdwBMyLPp_!!0-saturn_solar.jpg', NULL, 1599.00, 1399.00, 68, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205699969024', NULL, '华帝i11144抽油烟机家用吸油烟机厨房欧式油', 19, 'https://img.alicdn.com/imgextra/i3/26768098/O1CN012e1gWm29gvxR6Iiog_!!0-saturn_solar.jpg', NULL, 4999.00, 4499.00, 47, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205720940544', NULL, '苏泊尔C2侧吸抽油烟姻机家用机燃气灶套餐', 19, 'https://img.alicdn.com/imgextra/i1/45653021/O1CN01aeikKH1YBf8BqyxQ3_!!0-saturn_solar.jpg', NULL, 1999.00, 1399.00, 65, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205733523456', NULL, '[专柜同款]方太SY09G中式抽油烟机家用吸油', 19, 'https://img.alicdn.com/imgextra/i2/25879592/O1CN018iwE1B2KjBg7zcNJq_!!0-saturn_solar.jpg', NULL, 2250.00, 1499.00, 34, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467205762883584', NULL, '7字型双电机大吸力抽油烟机家用厨房顶吸式', 19, 'https://img.alicdn.com/imgextra/i4/108432020/O1CN01OLElTF1QnCfDMSsHE_!!0-saturn_solar.jpg', NULL, 1099.00, 499.00, 64, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208682119168', NULL, '红富士苹果冰糖心10斤脆甜农家苹果丑苹果', 20, 'https://img.alicdn.com/imgextra/i1/131310321/O1CN01GNEjJw1EF3hIHpOPd_!!0-saturn_solar.jpg', NULL, 9.90, 9.90, 61, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208698896384', NULL, '红心火龙果新鲜广西金都一号水果3/5斤大', 20, 'https://img.alicdn.com/imgextra/i2/123723296/O1CN01rNnLYW1aDc32BiXNx_!!0-saturn_solar.jpg', NULL, 51.80, 17.80, 60, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208715673600', NULL, '云南突尼斯软籽石榴10斤新鲜应当季酸甜大红', 20, 'https://img.alicdn.com/imgextra/i2/120349015/O1CN01jBPKB02GSv8mZQKzV_!!0-saturn_solar.jpg', NULL, 99.80, 28.80, 38, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208732450816', NULL, '猕猴桃新鲜包邮绿心奇异果水果当季徐香10斤', 20, 'https://img.alicdn.com/imgextra/i4/461380127/O1CN01i4pC7h1CoCuxbTSCj_!!0-saturn_solar.jpg', NULL, 99.80, 8.90, 50, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208753422336', NULL, '古田新鲜芙蓉李子红心三华李桃脱骨脆酸甜李', 20, 'https://img.alicdn.com/imgextra/i3/1192120166/O1CN01glbQdW1D64MZxhVgv_!!0-saturn_solar.jpg', NULL, 49.90, 35.90, 39, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208774393856', NULL, '陕西绿心猕猴桃新鲜包邮大果应当季水果孕妇', 20, 'https://img.alicdn.com/imgextra/i1/1350310095/O1CN01RWoj5d1CZYFBlMZJi_!!0-saturn_solar.jpg', NULL, 38.00, 9.90, 43, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208791171072', NULL, '红富士苹果水果新鲜烟台10斤装当季整箱包邮', 20, 'https://img.alicdn.com/imgextra/i2/293400076/O1CN01VEwq491CQqiN8dN57_!!2-saturn_solar.png', NULL, 99.00, 23.80, 44, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208807948288', NULL, '双十一 聚划算折上折快加购', 20, 'https://img.alicdn.com/imgextra/i1/125444957/O1CN01p3gygg1mULuiwzEmf_!!0-saturn_solar.jpg', NULL, 8.60, 8.60, 46, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208824725504', NULL, '果林外传云南昭通华硕红富士苹果甜脆糖心5', 20, 'https://img.alicdn.com/imgextra/i1/763120011/O1CN01gSuMHv1Bx4yLiG8Ph_!!0-saturn_solar.jpg', NULL, 112.00, 56.90, 38, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208833114112', NULL, '新疆西梅新鲜水果喀什法兰西小西梅李子当季', 20, 'https://img.alicdn.com/imgextra/i4/1058430090/O1CN01G4uti31CXGGC58A8u_!!0-saturn_solar.jpg', NULL, 88.00, 78.00, 43, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208854085632', NULL, '亏本冲量2000+石林人参果圆果!!!', 20, 'https://img.alicdn.com/imgextra/i1/2206804962106/O1CNA1QQ8ET0100e6fdf61f70b1af3590008_!!1-0-picassodesign.jpg', NULL, 98.00, 12.90, 56, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208879251456', NULL, '红心猕猴桃新鲜包邮大果奇异果孕妇弥猴桃泥', 20, 'https://img.alicdn.com/imgextra/i1/1140720060/O1CN010hOvN61CJWNgO9Uoh_!!2-saturn_solar.png', NULL, 169.80, 19.80, 23, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208896028672', NULL, '礼盒装猕猴桃新鲜包邮陕西徐香泥猴桃孕', 20, 'https://img.alicdn.com/imgextra/i1/1350310095/O1CN0115LsZY1CZYF3Mhgnj_!!0-saturn_solar.jpg', NULL, 68.00, 38.80, 50, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208912805888', NULL, '四川攀枝花凯特大芒果新鲜水果青芒果当季应', 20, 'https://img.alicdn.com/imgextra/i3/613930088/O1CN01TqnFSC1CWLTBs6kh5_!!0-saturn_solar.jpg', NULL, 48.00, 34.80, 28, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208929583104', NULL, '芭芭农场突尼斯软籽石榴新鲜水果甜石榴整箱', 20, 'https://img.alicdn.com/imgextra/i1/476740113/O1CN01Y98fQS1ChnMtw1vmT_!!0-saturn_solar.jpg', NULL, 69.00, 22.80, 56, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208942166016', NULL, '当季整箱包邮5斤10斤特大果奇异果现货应季', 20, 'https://img.alicdn.com/imgextra/i4/1350310095/O1CN014IcNrH1CZYF4rUJAA_!!0-saturn_solar.jpg', NULL, 48.00, 9.90, 45, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208967331840', NULL, '圣女果新鲜千禧小番茄水果当季5斤西红柿应', 20, 'https://img.alicdn.com/imgextra/i3/111076881/O1CN01Bcox3820hXvNjG0QN_!!0-saturn_solar.jpg', NULL, 74.50, 29.80, 57, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208979914752', NULL, '陕西周至绿心猕猴桃新鲜包邮孕妇当季时令水', 20, 'https://img.alicdn.com/imgextra/i2/1350310095/O1CN01Njrz9U1CZYF7WX9Km_!!0-saturn_solar.jpg', NULL, 48.00, 48.00, 49, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467208996691968', NULL, '蒲江红心猕猴桃坏果秒赔', 20, 'https://img.alicdn.com/imgextra/i4/1319730188/O1CN01YdXusf1DG94oTQRW8_!!0-saturn_solar.jpg', NULL, 16.80, 16.80, 44, 2, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467209013469184', NULL, '脆甜子弹头枣脆甜新鲜水果5斤顺丰包邮', 20, 'https://img.alicdn.com/imgextra/i4/455610097/O1CN0192rrNH1CaT29sC1gw_!!0-saturn_solar.jpg', NULL, 29.90, 29.90, 50, 1, 4, '2020-08-16 20:09:57', 4, '2020-08-16 20:09:57'),
	('492467211374862336', NULL, 'Apple教育优惠-买MacBook Air, 搭配AirPods', 21, 'https://img.alicdn.com/imgextra/i2/50078981/O1CN01LZNmkg2GDLg1EA86O_!!0-saturn_solar.jpg', NULL, 9245.00, 9245.00, 51, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211404222464', NULL, '红富士苹果水果新鲜烟台10斤装当季整箱包邮', 21, 'https://img.alicdn.com/imgextra/i2/293400076/O1CN01VEwq491CQqiN8dN57_!!2-saturn_solar.png', NULL, 99.00, 23.80, 44, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211420999680', NULL, '当季新鲜水果红富士苹果冰糖心10斤脆甜包邮', 21, 'https://img.alicdn.com/imgextra/i3/131310321/O1CN01VmMmSH1EF3hjg8TKB_!!0-saturn_solar.jpg', NULL, 9.90, 9.90, 30, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211437776896', NULL, '双十一 聚划算折上折快加购', 21, 'https://img.alicdn.com/imgextra/i1/125444957/O1CN01p3gygg1mULuiwzEmf_!!0-saturn_solar.jpg', NULL, 8.60, 8.60, 50, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211454554112', NULL, '山东烟台栖霞红富士苹果脆甜新鲜水果当季10', 21, 'https://img.alicdn.com/imgextra/i1/1032140023/O1CN01CJF9WY1C2ZijfPYjd_!!2-saturn_solar.png', NULL, 22.80, 9.20, 29, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211471331328', NULL, '果林外传云南昭通华硕红富士苹果甜脆糖心5', 21, 'https://img.alicdn.com/imgextra/i1/763120011/O1CN01gSuMHv1Bx4yLiG8Ph_!!0-saturn_solar.jpg', NULL, 112.00, 56.90, 64, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211488108544', NULL, '苹果水果新鲜红富士整箱10斤批山东烟台栖', 21, 'https://img.alicdn.com/imgextra/i3/700480065/O1CN01V88DIO1CLoKVyu0lP_!!0-saturn_solar.jpg', NULL, 59.80, 59.80, 35, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211504885760', NULL, '正宗洛川苹果水果新鲜陕西红富士脆甜应当季', 21, 'https://img.alicdn.com/imgextra/i1/129933481/O1CN01V495pg1baLJPhwDdD_!!0-saturn_solar.jpg', NULL, 13.80, 13.80, 44, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211521662976', NULL, '甘肃天水花牛苹果10斤包邮萍平果粉面红蛇果', 21, 'https://img.alicdn.com/imgextra/i3/128356174/O1CN01LRzx441vTjvGZqarE_!!0-saturn_solar.jpg', NULL, 59.60, 29.80, 58, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211538440192', NULL, '陕西洛川苹果水果新鲜应当季孕妇吃脆甜大红', 21, 'https://img.alicdn.com/imgextra/i2/129933481/O1CN01PIILQY1baLIDcOm9K_!!0-saturn_solar.jpg', NULL, 49.80, 46.80, 21, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211559411712', NULL, '洛川红富士苹果水果新鲜当季整箱10斤一级大', 21, 'https://img.alicdn.com/imgextra/i4/108671029/O1CN01pmYe3A1JTKAGPFbR7_!!0-saturn_solar.jpg', NULL, 138.00, 26.80, 30, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211576188928', NULL, '山东烟台红富士苹果新鲜吃的应季脆甜带箱', 21, 'https://img.alicdn.com/imgextra/i3/128831609/O1CN01A2tccT1NkxrpWYZM4_!!0-saturn_solar.jpg', NULL, 98.00, 21.80, 58, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211588771840', NULL, '陕西洛川红富士苹果水果新鲜当季整箱10斤甜', 21, 'https://img.alicdn.com/imgextra/i3/679130037/O1CN01AAnuWv1C8zGLQGgJt_!!0-saturn_solar.jpg', NULL, 99.00, 46.80, 32, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211605549056', NULL, '正宗红富士陕西苹果水果新鲜10斤当季一整箱', 21, 'https://img.alicdn.com/imgextra/i1/215350195/O1CN01jRZeNJ1DJLqZwWpCQ_!!0-saturn_solar.jpg', NULL, 99.80, 22.80, 22, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211626520576', NULL, '烟台栖霞红富士苹果水果新鲜应季整箱10斤', 21, 'https://img.alicdn.com/imgextra/i2/131864412/O1CN01jcQ07T1iSk1xeb2I9_!!0-saturn_solar.jpg', NULL, 80.00, 59.80, 28, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211639103488', NULL, '陕西洛川苹果水果新鲜红富士应当季10斤整', 21, 'https://img.alicdn.com/imgextra/i4/129933481/O1CN01tzatDZ1baLJY0QxXd_!!0-saturn_solar.jpg', NULL, 39.80, 38.80, 41, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211660075008', NULL, '四川嘎啦苹果10丑苹果盐源小萍果冰糖心水', 21, 'https://img.alicdn.com/imgextra/i4/474200131/O1CN015g0tTf1Cq2V4x96Y6_!!2-saturn_solar.png', NULL, 36.80, 26.80, 25, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211676852224', NULL, '陕西洛川红富士新鲜苹果水果脆甜冰糖心应当', 21, 'https://img.alicdn.com/imgextra/i3/129933481/O1CN01PzffU01baLJB2h4os_!!0-saturn_solar.jpg', NULL, 29.80, 29.80, 36, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211697823744', NULL, '陕西洛川苹果新鲜水果红富士苹果9枚90m', 21, 'https://img.alicdn.com/imgextra/i4/241710056/O1CN01342gEj1CHgnOfn3O7_!!0-saturn_solar.jpg', NULL, 198.00, 198.00, 52, 2, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467211714600960', NULL, '陕西红富士苹果水果新鲜当季整箱10斤脆甜', 21, 'https://img.alicdn.com/imgextra/i1/133527917/O1CN01RxyJwg28M2Gp2zrzl_!!0-saturn_solar.jpg', NULL, 69.80, 49.80, 62, 1, 4, '2020-08-16 20:09:58', 4, '2020-08-16 20:09:58'),
	('492467214092771328', NULL, '正宗洛川苹果水果新鲜陕西红富士脆甜应当季', 22, 'https://img.alicdn.com/imgextra/i1/129933481/O1CN01V495pg1baLJPhwDdD_!!0-saturn_solar.jpg', NULL, 13.80, 13.80, 24, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214109548544', NULL, '东北干碗紫桃鸡心形李子干核新鲜水果桃形香', 22, 'https://img.alicdn.com/imgextra/i1/1269850121/O1CN01pNesYm1ClSXVWf4X3_!!0-saturn_solar.jpg', NULL, 66.00, 39.80, 23, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214122131456', NULL, '陕西洛川红富士新鲜苹果水果脆甜冰糖心应当', 22, 'https://img.alicdn.com/imgextra/i3/129933481/O1CN01PzffU01baLJB2h4os_!!0-saturn_solar.jpg', NULL, 29.80, 29.80, 37, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214143102976', NULL, '福建漳州土楼红皮香蕉红美人香蕉果园直发新', 22, 'https://img.alicdn.com/imgextra/i1/1165700147/O1CN01x4Sjaa1CxMpuF0l5z_!!0-saturn_solar.jpg', NULL, 66.00, 19.80, 62, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214164074496', NULL, '海福盛香蕉片草莓干20g 新鲜冻干水果干儿童', 22, 'https://img.alicdn.com/imgextra/i4/1330590047/O1CN01Sexyup1CDZEKgft8c_!!0-saturn_solar.jpg', NULL, 14.75, 6.63, 67, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214176657408', NULL, '现货 第2件半价雷州冰糖木瓜 青皮红心牛奶', 22, 'https://img.alicdn.com/imgextra/i2/45844419/O1CN01X6F4UT1iVwoZXnNST_!!0-saturn_solar.jpg', NULL, 48.00, 23.90, 34, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214201823232', NULL, '自家果园梨子水果新鲜采摘脆甜皇冠梨安徽砀', 22, 'https://img.alicdn.com/imgextra/i4/1327050169/O1CN01J3usDh1D7RY5PpPYo_!!0-saturn_solar.jpg', NULL, 22.90, 22.90, 26, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214222794752', NULL, '青苹果10斤新鲜孕妇水果应当季时令酸甜脆', 22, 'https://img.alicdn.com/imgextra/i3/495690123/O1CN01c0HQPt1CmNKC6CYat_!!0-saturn_solar.jpg', NULL, 60.00, 19.60, 56, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214239571968', NULL, '红富士苹果冰糖心10斤脆甜农家苹果丑苹果', 22, 'https://img.alicdn.com/imgextra/i1/131310321/O1CN01GNEjJw1EF3hIHpOPd_!!0-saturn_solar.jpg', NULL, 9.90, 9.90, 24, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214252154880', NULL, '羊角蜜甜瓜香瓜新鲜当季水果包邮整箱5斤', 22, 'https://img.alicdn.com/imgextra/i1/120684065/O1CN012ATgJQ1ftoal4QdfR_!!0-saturn_solar.jpg', NULL, 98.00, 22.80, 47, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214273126400', NULL, '本店任选1件起包邮龙烜 高山香甜大香', 22, 'https://img.alicdn.com/imgextra/i4/1056570067/O1CN01MpU4CA1CMj93t6fG6_!!0-saturn_solar.jpg', NULL, 8.80, 5.80, 69, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214289903616', NULL, '陕西洛川苹果水果新鲜红富士应当季10斤整', 22, 'https://img.alicdn.com/imgextra/i4/129933481/O1CN01tzatDZ1baLJY0QxXd_!!0-saturn_solar.jpg', NULL, 39.80, 38.80, 27, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214306680832', NULL, '苹果水果新鲜红富士整箱10斤批山东烟台栖', 22, 'https://img.alicdn.com/imgextra/i3/700480065/O1CN01V88DIO1CLoKVyu0lP_!!0-saturn_solar.jpg', NULL, 59.80, 59.80, 43, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214323458048', NULL, '乐享熊碳烤香蕉片500g非油炸香蕉片干整', 22, 'https://img.alicdn.com/imgextra/i4/487670027/O1CN01fLx6fP1C4PJGzLx04_!!0-saturn_solar.jpg', NULL, 8.90, 8.90, 32, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214344429568', NULL, '云南高山大香蕉 带箱10斤装 自然熟青香蕉热', 22, 'https://img.alicdn.com/imgextra/i2/1367190109/O1CN01Wx0USh1CfxmtGvs85_!!0-saturn_solar.jpg', NULL, 45.60, 22.80, 22, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214361206784', NULL, '正宗红富士陕西苹果水果新鲜10斤当季一整箱', 22, 'https://img.alicdn.com/imgextra/i1/215350195/O1CN01jRZeNJ1DJLqZwWpCQ_!!0-saturn_solar.jpg', NULL, 99.80, 22.80, 58, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214373789696', NULL, '民勤黄河蜜瓜10斤沙漠哈密瓜香瓜黄金甜瓜', 22, 'https://img.alicdn.com/imgextra/i1/128356174/O1CN01e7owKP1vTjvAucqPQ_!!0-saturn_solar.jpg', NULL, 79.60, 29.80, 68, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214394761216', NULL, '香梨10斤带箱梨子水果新鲜直批整箱红香酥', 22, 'https://img.alicdn.com/imgextra/i3/556430152/O1CN01doJhhI1Czeomy2zgs_!!0-saturn_solar.jpg', NULL, 9.80, 9.80, 59, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214411538432', NULL, '新鲜粉蕉小米蕉小香蕉自然熟甜苹果粉蕉当季', 22, 'https://img.alicdn.com/imgextra/i3/817480069/O1CN01SUoI921CNdwAFawod_!!0-saturn_solar.jpg', NULL, 39.80, 24.80, 21, 1, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59'),
	('492467214428315648', NULL, '越南特级红心火龙果新鲜顺丰包邮水果当季大', 22, 'https://img.alicdn.com/imgextra/i1/120653139/O1CN01sUCbS41Z3hroVxrZM_!!0-saturn_solar.jpg', NULL, 388.00, 39.90, 68, 2, 4, '2020-08-16 20:09:59', 4, '2020-08-16 20:09:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='商品分类表';

-- 正在导出表  lhl-basic.goods_category 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` (`id`, `name`, `pid`, `sort`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
	(7, '电子产品', 0, 1, 4, '2020-08-01 16:43:09', NULL, NULL),
	(8, '家用电器', 0, 2, 4, '2020-08-01 16:43:23', NULL, NULL),
	(9, '手机', 7, 1, 4, '2020-08-01 16:43:42', NULL, NULL),
	(10, '冰箱', 8, 2, 4, '2020-08-01 16:43:53', NULL, NULL),
	(11, '手表', 7, 23, NULL, '2020-08-16 19:53:11', NULL, NULL),
	(12, '电脑', 7, 12, NULL, '2020-08-16 19:53:20', NULL, NULL),
	(13, '显卡', 7, 54, NULL, '2020-08-16 20:04:52', NULL, NULL),
	(14, '收音机', 7, 56, NULL, '2020-08-16 20:05:07', NULL, NULL),
	(15, '游戏机', 7, 45, NULL, '2020-08-16 20:05:40', NULL, NULL),
	(16, '电视', 8, 12, NULL, '2020-08-16 20:06:48', NULL, NULL),
	(17, '洗衣机', 8, 45, NULL, '2020-08-16 20:06:58', NULL, NULL),
	(18, '吹风机', 8, 12, NULL, '2020-08-16 20:07:09', NULL, NULL),
	(19, '抽油烟机', 8, 12, NULL, '2020-08-16 20:08:55', NULL, NULL),
	(20, '水果', 0, 12, NULL, '2020-08-16 20:09:05', NULL, NULL),
	(21, '苹果', 20, 12, NULL, '2020-08-16 20:09:13', NULL, NULL),
	(22, '香蕉', 20, 32, NULL, '2020-08-16 20:09:23', NULL, NULL);
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
	(9, 13),
	(9, 17),
	(9, 18),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 23),
	(9, 24);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 正在导出表  lhl-basic.sys_menu 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `name`, `access_url`, `pid`, `sort`, `level`) VALUES
	(10, '系统管理', '', 0, 20, 1),
	(11, '用户管理', '/user/index', 10, 1, 2),
	(12, '角色管理', '/role/index', 10, 2, 2),
	(13, '菜单管理', '/menu/index', 10, 3, 2),
	(17, '管理模块', '', 0, 15, 1),
	(18, '商品分类管理', '/goodsCategory/index', 17, 1, 2),
	(19, '首页配置', '', 0, 14, 1),
	(20, '轮播图配置', '/carousel/index', 19, 3, 2),
	(21, '平台用户管理', '/platformUser/index', 17, 5, 2),
	(22, '商家管理', '', 0, 5, 1),
	(23, '订单管理', '/goodsOrder/index', 22, 10, 2),
	(24, '查看平台订单', '/sysGoodsOrder/index', 17, 3, 2);
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
  `slat` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码盐',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统用户名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统用户表';

-- 正在导出表  lhl-basic.sys_user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `account`, `password`, `slat`, `name`) VALUES
	(4, '123456', 'f479f0dd3aa977c42d69b04d4a4a0a8f', '100192354538', '吕宏力');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 lhl-basic.user_role_link 结构
CREATE TABLE IF NOT EXISTS `user_role_link` (
  `user_id` int(11) DEFAULT NULL COMMENT '系统用户表id',
  `role_id` int(11) DEFAULT NULL COMMENT '系统角色表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色中间表';

-- 正在导出表  lhl-basic.user_role_link 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user_role_link` DISABLE KEYS */;
INSERT INTO `user_role_link` (`user_id`, `role_id`) VALUES
	(4, 9);
/*!40000 ALTER TABLE `user_role_link` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
