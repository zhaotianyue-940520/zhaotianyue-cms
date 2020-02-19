/*
Navicat MySQL Data Transfer

Source Server         : 1708E
Source Server Version : 50527
Source Host           : 127.0.0.1:3306
Source Database       : cms_project1

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-02-19 18:31:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `picture` varchar(200) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0,刚发布,1审核通过,-1 审核未通过',
  `deleted` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `commentCnt` int(11) DEFAULT NULL,
  `articleType` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `complainCnt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_USER` (`user_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CHAN` (`channel_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CATE` (`category_id`),
  CONSTRAINT `cms_article_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `cms_user` (`id`),
  CONSTRAINT `cms_article_ibfk_4` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`),
  CONSTRAINT `cms_article_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '中方关于中美第一阶段经贸协议的声明', '<h1 class=\"dabiaoti\" style=\"text-align:center;color:#333333;font-size:30px;font-family:微软雅黑;font-weight:normal;\">\n	<img src=\"http://img3.chinadaily.com.cn/images/201912/14/5df41380a31099ab43d7d1b7.jpeg\" id=\"img-5df41380a31099ab43d7d1b7\" />\n</h1>\n<div id=\"Content\" class=\"article\" style=\"margin:30px 0px 0px;padding:0px;font-size:16px;font-family:微软雅黑, Arial;\">\n	<p style=\"color:#333333;text-indent:2em;\">\n		新华社北京12月13日电 经过中美两国经贸团队的共同努力，双方在平等和相互尊重原则的基础上，已就中美第一阶段经贸协议文本达成一致。协议文本包括序言、知识产权、技术转让、食品和农产品、金融服务、汇率和透明度、扩大贸易、双边评估和争端解决、最终条款九个章节。同时，双方达成一致，美方将履行分阶段取消对华产品加征关税的相关承诺，实现加征关税由升到降的转变。\n	</p>\n	<p style=\"color:#333333;text-indent:2em;\">\n		中方认为，中美两国作为全球最大经济体，处理两国经贸关系必须从大局出发，达成经贸协议有利于中美两国人民和世界人民的根本利益，将在经贸、投资、金融市场等方面产生积极效应。本协议总体上符合中国深化改革开放的大方向，以及自身推动经济高质量发展的内在需要。协议相关内容的落实，将有助于强化知识产权保护，改善营商环境，扩大市场准入，更好维护包括外国企业在内的各类企业在华合法权益，也有利于保护中方企业在对美经贸活动中的合法权益。随着中国国内市场的扩大，中方企业按照世贸组织规则和市场化、商业化原则，增加从包括美国在内的各国进口优质、有竞争力的产品和服务，有助于顺应国内消费升级的趋势，满足人民日益增长的美好生活需要。本协议有利于中美两国加强经贸领域的合作，有效管控和解决经贸领域的分歧，促进中美经贸关系稳定发展。在当前全球经济面临下行压力的背景下，本协议有利于增强全球市场信心，稳定市场预期，为正常的经贸和投资活动创造良好环境。\n	</p>\n	<p style=\"color:#333333;text-indent:2em;\">\n		双方约定，下一步双方将各自尽快完成法律审核、翻译校对等必要的程序，并就正式签署协议的具体安排进行协商。\n	</p>\n	<p style=\"color:#333333;text-indent:2em;\">\n		协议签署后，希望双方能够遵守协议约定，努力落实好第一阶段协议相关内容，多做有利于双边经贸关系发展和全球经济金融稳定的事情，维护世界和平与繁荣。\n	</p>\n</div>', '20191214/0e36fb75-697a-41dc-868c-cbc611cf7aac.jpeg', '3', '10', '1', '0', '1', '1', '0', '2019-12-14 08:32:39', '2019-12-18 20:02:11', '0', '0000000001', '0');
INSERT INTO `cms_article` VALUES ('2', '美国众议院司法委员会投票通过弹劾特朗普条款', '<h1 class=\"dabiaoti\" style=\"text-align:center;color:#333333;font-size:30px;font-family:微软雅黑;font-weight:normal;\">\n	<strong><span style=\"color:#E53333;\">美国众议院司法委员会投票通过弹劾特朗普条款</span></strong> \n</h1>\n<div class=\"fenx\" style=\"margin:20px 0px 0px;padding:0px;font-family:微软雅黑, Arial;\">\n	<div class=\"xinf-le\" style=\"margin:0px 5px 0px 0px;padding:0px;color:#666666;\">\n		作者： 王晋燕 来源：<a>央视新闻客户端</a> \n	</div>\n	<div class=\"xinf-le\" style=\"margin:0px 5px 0px 0px;padding:0px;color:#666666;\">\n		2019-12-14 00:54&emsp;\n	</div>\n</div>\n<div id=\"Content\" class=\"article\" style=\"margin:30px 0px 0px;padding:0px;font-size:16px;font-family:微软雅黑, Arial;\">\n	<p align=\"justify\" style=\"color:#333333;text-indent:30px;text-align:justify;\">\n		当地时间12月13日上午，美国众议院司法委员会投票表决通过针对总统特朗普的两项弹劾条款。\n	</p>\n	<p align=\"justify\" style=\"color:#333333;text-indent:30px;text-align:justify;\">\n		美国众议院司法委员会10日公布了针对特朗普的两项弹劾条款，即滥用职权和妨碍国会调查。美国媒体分析称，美国众议院民主党人正加速推进弹劾特朗普，预计12月20日前众议院将举行全院投票表决。（央视记者 王晋燕）\n	</p>\n</div>', '20191219/2d603ba0-e8ae-4576-9514-80a2aef10444.jpeg', '3', '9', '1', '0', '1', '1', '0', '2019-12-14 08:35:50', '2019-12-19 08:37:10', '14', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('3', '浓眉有望参加明天与雄鹿之战', '<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/Rl2wbxy1FpYoZI\" alt=\"浓眉有望参加明天与雄鹿之战\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	安东尼-戴维斯因脚踝伤势缺席了昨天与步行者的比赛，结果湖人客场不败纪录因此中断。今天接受采访时，浓眉哥表示希望参加明天与雄鹿的焦点大战。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	浓眉哥在作客Dan Patrick Show期间被问到，明天是否会参加与雄鹿的比赛，他回答道：“希望会，计划是这样。到时候看脚踝的感觉吧。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	本赛季，浓眉哥场均可以得到27.4分9.3个篮板3.3次助攻，表现极为出色。\n</p>', '20191219/9a643871-7cf6-4a3f-a693-939a1752d665.jpg', '5', '17', '1', '0', '1', '1', '0', '2019-12-17 15:10:57', '2019-12-19 08:34:13', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('4', '券商起爆，牛市到来？小心点，这次的“牛”风格不一样', '<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/db9393c3dc56467dbe7f243cc1ffbbd4\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">文/维维安</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">牛市启动，券商先行！</span>南京证券的连板，苏州银行的涨停瞬间引爆了大金融板块的做多情绪，A股的3000点不知不觉又在年尾给收了回来......\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	眼看着“3000点攻坚战”圆满完成，大霄同志又开始自我膨胀了，不得不说，这次的“大国牛”的说法好生新颖，大霄同志超乎常人的政治觉悟已经溢于言表：\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/c01ef4e4887f404eb1f8daefdab0847d\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	更有耐心的散户朋友做了大数据统计：这是沪指历史上第100次向上突破3000点。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	古语云，再而衰，三而竭，可这惊心动魄的第100次突破，好像有点不太一样——沪深两市都放量了!（时隔三月，两市成交额再度突破6000亿元）\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	撇开股指不谈，“爆量”阵容还在壮大进行时——<span style=\"font-weight:700;\">截至上周五，华宝中证全指证券ETF份额从三季度末的45.46亿份增至59.92亿份，增幅达31.8%。国泰中证全指证券公司ETF、南方中证全指证券公司ETF等也都同样出现了大幅增长。</span>\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/6d2b32f2d7b44eee92e285d09f4abf99\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	按照我们的惯性思维去理解，底部持续放量，再叠加一些盘面上反映出来的积极信号，意味着转势的开始。<span style=\"font-weight:700;\">（北上资金连续24日净流入，近半数个股涨幅超过指数，132只个股创年内新高等等）</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	牛市真的来了？这次的3000点收复是“真突破”无疑了？千呼万唤的“价值牛”已经按捺不住到草原上吃草的冲动，不再任性跟散户玩“躲猫猫”了？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	很多投资者还在顾盼为难。曾几何时，疯牛也好，慢牛也罢，有多少轮“牛市”的口号就击碎了多少轮价值投资的信仰。这次在实体经济寒冬中匍匐前进的“XX牛”又有几分成色？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	暂且先不把这波小牛市看多远。着眼当下，我们可以拆解一下近期A股走强的逻辑。你会发现，最近的行情，用“性价比牛”来概括比较合适。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	01\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	有人要问了，为什么说是“性价比”牛，而不是 “结构牛”，甚至是“科技牛”呢？毕竟，无线耳机，5G和胎压监测等泛科技概念的表现，散户朋友们都有目共睹。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">但你可能没仔细斟酌一下，这波小牛市的核心做多力量，特别是 “放量”上涨，直接形成反转上行趋势的个股，分布在哪些行业和概念里？</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	你看看，最近一波涨的很凶的，同时又放出巨量的，基本都是证券，银行，钢铁，汽车这一类前期错杀比较严重，估值相对较低的股票。而放量则意味着近期资金“抄底式”集中涌入，这与漫步者、万通智控等靠市场惯性缩量上冲的科技股是完全不一样的逻辑。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	像苏州银行这类“放量”上涨的地方农商行标的，两个涨停板之后市净率也才1.33倍。跟美股里盘子大得多的美国银行（BAC）估值相同。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/c6c13b74347448329c5fb3d38ce551f7\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n	<p class=\"pgc-img-caption article-img-caption\" style=\"margin-left:10px;font-size:12px;color:#999999;\">\n		▲注：数据来源于新浪财经\n	</p>\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	钢铁行业，动态市盈率过高的包钢股份（38倍PE），西宁特钢（31倍PE）没怎么涨，但动态市盈率只有4倍多的华菱钢铁上涨了17%，跑赢大盘明显。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	低位股的春天来了？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	02\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	反过来看看，今年涨幅比较大，已经不再“便宜”的白酒股、医药股，乃至部分高位的科技股呢？最近的走势都不太妙。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">举个例子，贵州茅台5日涨幅0.78%，通策医疗5日累跌3%，恒瑞医药5日跌幅0.49%，立讯精密5日上涨3%，中国软件5日下跌0.23%。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这些标的，均是今年上半年为市场热捧的种类。不仅基金、机构重仓，外资也在持续加码，似乎12月以来突然遭到了实力资金的集体“漠视”，做多热情严重不足。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	明眼人一看就知道问题出在哪儿——<span style=\"font-weight:700;\">通策医疗的滚动市盈率超过70倍，恒瑞医药也接近。立讯精密的滚动市盈率大概在50倍，中国软件的滚动市盈率更为吓人，达到了380多倍。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	图：恒瑞医药K线图\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/e6e4e7dc4b1f48cd8b8ed90b06917ec6\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n	<p class=\"pgc-img-caption article-img-caption\" style=\"margin-left:10px;font-size:12px;color:#999999;\">\n		▲注：数据来源于东方财富网\n	</p>\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这些高估值的股票，并没有跟涨，反而有借成交量放大而“出货”的嫌疑。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	至于上半年热捧的猪肉股，则是在“二邦”的带领下纷纷跌破前期构筑的平台，而这些个股现在的股价，部分仍然达到去年的3到4倍。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	所以我说，这一波不是什么“科技牛”，也不是什么“题材牛”，实质上就是“性价比”牛。因为低位的消费也在跟涨（比如三全食品、科沃斯等等），而高位的科技股也在血崩（中国软件、梦网集团等）。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	资金借势做高低位切换，博弈“性价比”的思路非常明显。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	03\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	“性价比”牛之所以成立，也有基本面的逻辑来支持。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	目前来说“性价比”最高的几个板块之中，<span style=\"font-weight:700;\">银行板块受益于盈利周期见底带来的资产质量改善（不良贷款率已经趋于平稳）；建材行业对逆周期调控政策给出正向反馈（基建复苏，这几天玻璃、水泥等原材料价格已经进入了上涨小周期），传媒受益于政策边际改善及需求复苏（影视传媒行业经过整顿与治理，行业洗牌比较充分，供求关系改善），汽车受益于消费促进政策预期及行业出清后的景气复苏（对汽车消费税率和消费政策松紧度的调整）。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但是前期的高位股，集中分布的几个行业（医药、白酒、养殖业），又有多强的预期来支撑股价继续上涨呢？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	很显然，政策上的强刺激没必要，市场的供求关系也没有打破平衡（像立讯精密这样，产品刚刚在市场放量，站上产业风口的除外），甚至像“二师兄”这种被市场哄抬起来的物价炒作更不符合价值投资的风向。你看前阵子超预期的通胀公布后市场未下跌，说明市场已经对猪肉价格担忧充分定价，相关股票的“高位”属性依旧明显。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	炒股都是炒预期。<span style=\"font-weight:700;\">高位股抱团的瓦解，这说明市场对高位的个股可能已经开始陆续重新定价，有强业绩预期支撑的则会保持相对坚挺（立讯精密这类），而业绩预期已经消化完毕的牛鬼蛇神，基本上是跟不上这波来之不易的“小牛市”节奏了。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	图：立讯精密的“高估值”有业绩支撑\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/16775fe6a18f47fe8729a731d3454028\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n	<p class=\"pgc-img-caption article-img-caption\" style=\"margin-left:10px;font-size:12px;color:#999999;\">\n		▲注：图片来源于上市公司公告\n	</p>\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">“性价比牛”，是贸易摩擦和经济触底留给我们的巨大“黄金坑”机会，且行且珍惜！</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	04\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	其实，我们即使把A股和全球股指的表现作个横向对比，也能瞥见“性价比牛”成立的端倪。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	今年美国股市飙升，屡屡创下历史新高。<span style=\"font-weight:700;\">截止11月30日，标普500指数上涨了28%，市盈率接近18倍，比其15年平均水平高出约24%。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而我们的上证指数即时市盈率不到14倍，深证成指略高一些，达到25倍左右，虽然没有“足够便宜”，但相比2015年5000点的峰值，的确是便宜了很多。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	在这种情况下，最近一段时间，以往流动性强于A股的欧美股市量能萎缩明显，而A股却迎来了久违的“补量”行情，获得北上资金大幅加仓，从量能变化的角度观察，投机热钱选择A股而不是美股做差价，显然也是有“性价比”的考虑在里面。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	细分具体行业来看，美股在近期爬坡缓慢的一个重要因素，也是高位股的表现不济。<span style=\"font-weight:700;\">在今年11月底之前，2019年标普500指数科技板块的涨幅为41%，远高于标普500指数的24%，创下2009年以来最大增幅。</span>\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/9a20a02de9aa476d823b748e041ef9f7\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但在最近全球股市同步走牛的情况下，美股中的高位股，尤其是科技股的走势表现不佳。例如AirPods系列产品都卖脱销了的苹果公司近5日涨幅只有4.44%，微软5日累涨2.36%，IBM仅仅微涨0.23%。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	与此同时，无巧不成书，美国的低估值行业及关联个股在近期与A股发生了共振性大涨。<span style=\"font-weight:700;\">比如市盈率17倍的新美亚电子，市净率0.6倍的Cenovus能源，市净率0.37倍的Abraxas石油等等，这些个股均为所在行业估值水平较低的。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不仅仅是A股，全球联动，抄底性价比的时代到来了！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	05\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	怎样去理解“性价比牛”的诞生？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">很好理解，A股在风格上腾笼换鸟的转折点，就在于中美第一阶段经贸协议文本达成一致。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	当贸易摩擦“正在进行时”，资金在美国抱团科技股，是因为处于“技术上游”的美国高科技公司在这样的贸易摩擦中最具有业绩确定性，而抱团茅台、海天这样的高位A股不放，也是因为消费的防御性最强。在这种局面未被打破之前，股市里的资金不会轻易改变态度，“性价比”的逻辑能够一直保持下去。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而中美贸易谈判文本性文件的披露，代表着大国博弈阶段性成果的定调，在这种背景下，“性价比”自然要调转过来。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/471de0d98a8b4525b2802fe537ea42f7\" alt=\"券商起爆，牛市到来？小心点，这次的“牛”风格不一样\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	毕竟A股的科技公司在消除了制裁压力，出口压力和原材料上涨带来的盈利差缩减压力之后，也迎来了久违的业绩释放“小阳春”；而多元金融的崛起则表明两国资本市场加速对外开放，互融互通的预期已经消除了政治上的阻力。至于周期性行业的修复性上涨，则是CPI涨幅放缓，PPI触底反弹，天然橡胶等大宗商品的供求关系好转，冬季“补库”需求的增强等预期来驱动。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	至于同一个行业，资金去做低位股而放弃高位股，也并不足为奇。<span style=\"font-weight:700;\">毕竟年底是基金调仓换股的高峰期，特别是近期有小道消息传闻，股市放量的原因是险资集中涌入，而险资谨小慎微的操盘风格注定其不会愿意做高位股的接盘侠。</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	“性价比牛”成为近期的主旋律，也将会成为年前A股的主要交易策略之一。高位个股跑不过大盘的情况下，留守的散户朋友们要当心了——<span style=\"font-weight:700;\">年底的“业绩反转雷”，解禁潮等利空可能会接踵而至，这些都是高位个股的性价比“越来越低”的诱因之一。</span>在这种情况下，劝各位散户朋友们立足防守，切勿伸手追高！\n</p>', '20191219/e43ef8d4-b3ab-4856-b558-1c9114e40b70.jpg', '2', '5', '1', '0', '1', '1', '0', '2019-12-17 15:11:10', '2019-12-19 08:33:22', '0', '0000000003', '3');
INSERT INTO `cms_article` VALUES ('5', '《新鹿鼎记》杀青，张一山七个老婆都是熟人啊，还有杨紫？', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	由张一山主演的《鹿鼎记》想必很多人都很期待，作为如今新生代演员演技的代名词，张一山凭借自己的独特气质备受大家的喜爱，如今不少人都是张一山的迷弟迷妹们。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/ba24c3c787284ba49528a9df2e03d1bc\" alt=\"《新鹿鼎记》杀青，张一山七个老婆都是熟人啊，还有杨紫？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	《鹿鼎记》之前就已经拍过多个版本，不论是陈小春版本，还是黄晓明版本，两人塑造的韦小宝还是很受大家的喜爱的，相信张一山这一次的扮演也会让大家眼前一亮的。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而《鹿鼎记》说起来，最让大家关系的还是剧中，韦小宝娶得七个老婆扮演的女演员究竟是谁，毕竟在书中她们都是美若天仙的存在，在剧中建宁公主将由吴优扮演，苏荃则是徐冬冬扮演，双儿是由演员白雪扮演，方怡由演员李沁扮演，沐剑屏则是唐艺昕，曾柔是演员毛晓彤，阿珂则由杨紫扮演。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/6c3bddbca74a49f98aeae775e65fd100\" alt=\"《新鹿鼎记》杀青，张一山七个老婆都是熟人啊，还有杨紫？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	杨紫与张一山的交情想必大家不必多说，两人从小长大，而且也多次合作，两人本就喜欢玩闹，想必剧组有了二人也会非常的欢乐，而吴优与徐冬冬都在余罪中与张一山有对手戏，白雪李沁唐艺昕毛晓彤与张一山都是很熟悉的。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/099b255bdb1d4174a1f175278de4b877\" alt=\"《新鹿鼎记》杀青，张一山七个老婆都是熟人啊，还有杨紫？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不知道张一山在演戏的时候，看到这些美若天仙的女孩，会不会由衷的羡慕韦小宝这样的人，如今电视剧已经杀青，想必播出已经指日可待了，大家期待这部电视剧的播出么？\n</p>', '20191218/f58afc55-0772-432d-a13b-051d03395d11.jpg', '6', '24', '1', '0', '1', '1', '0', '2019-12-17 15:11:28', '2019-12-18 20:05:49', '0', '0000000002', '1');
INSERT INTO `cms_article` VALUES ('6', '《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们', '<div class=\"article-content\" style=\"margin:0px 0px 24px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<div style=\"margin:0px;padding:0px;\">\n		<p>\n			电影《中国机长》自上映后，热度一直只增不减。除了电影本身高度还原当时情景之外。在这部电影中有很多我们熟悉的好艺人也功不可没，他们不管是主角、还是配角，都在尽心尽力，尽职尽责地演好此电影！\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p1.pstatp.com/large/pgc-image/b72aca243d904ffba45b55e4c9795c55\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			在《中国机长》上映后，作为主角的张涵予、杜江、欧豪以及袁泉、李沁、张天爱，凭借此电影收获了很多的掌声，也提高了自己的知名度。\n		</p>\n		<p>\n			他们几位可以称为《中国机长》中被观众关注到的“幕前英雄”！\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p1.pstatp.com/large/pgc-image/87fa4ac865724a0ab847263c82a97253\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p3.pstatp.com/large/pgc-image/b8e077d873984cb6b762a7fa12f42bc4\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			当然，无论是飞机的成功备降，还是一部电影的成功，都离不开那些不被关注到的“幕后英雄”。\n		</p>\n		<p>\n			在《中国机长》中演绎这些幕后英雄的演员也有很多。例如李现、阚清子由于镜头比较多，我们有注意到，但还有几位演技派，是观众没有注意到的！\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p3.pstatp.com/large/pgc-image/569f4283828f4d68a766f3bf10b0f09a\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p3.pstatp.com/large/pgc-image/f9ab0d1c00bd4c9da423bef00a12cc1d\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			第一位就是“吴樾”。吴樾是辨识度很高的一位老演员。他主演的《浪子燕青》、《欢天喜地七仙女》、以及参演的《澳门风云2》、《杀破狼·贪狼》都很受观众喜欢。\n		</p>\n		<p>\n			这次他在《中国机长》中饰演成都双流国际机场股份有限公司应急指挥中心副主任。戏份很少的他，在此电影上映后，几乎未有关注到。\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p1.pstatp.com/large/pgc-image/ae05f6380b9d4ae9a2f41d29bd645c6e\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			第二位就是“黄志忠”。黄志忠出道后，多演一些正面角色。硬朗的外表，时而不着调、时而柔情，转换的很好。\n		</p>\n		<p>\n			虽说他知名度不高，但真正喜欢他的人很多，也是名副其实的演技派。这次他在《中国机长》中饰演管制中心带班主任，很多观众也未关注到他\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p1.pstatp.com/large/pgc-image/0a09ccf20eb2431592eb7b2a3e769081\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			第三位就是“朱亚文”。有“行走的荷尔蒙”之称的他，很多作品我们都很熟悉。这次他在《中国机长》中饰演四川监管局的领导。即使如此抢眼帅气的他，在《中国机长》中戏份也很少！\n		</p>\n		<div class=\"pgc-img\" style=\"margin:0px;padding:0px;\">\n			<img src=\"http://p1.pstatp.com/large/pgc-image/1bf225942d034d2d8da27b5748297e01\" alt=\"《中国机长》中最靓的幕后英雄，认出李现、阚清子，却没认出他们\" />\n		</div>\n		<p>\n			除了他们，还有很多演技派演员，都在《中国机长》中演了一些没有台词、甚至仅有一个镜头的角色，但他们都是随叫随到，无条件的配合\n		</p>\n		<p>\n			。所以《中国机长》这部电影的成功，就如同飞机8633成功备降一样，“团结协作”必不可少！\n		</p>\n		<div>\n			<br />\n		</div>\n	</div>\n</div>\n<div class=\"bui-box article-tag\" style=\"margin:0px 0px 28px;padding:0px;color:#657180;font-family:&quot;background-color:#FFFFFF;\">\n	<div class=\"bui-left\" style=\"margin:0px;padding:0px;\">\n		<span class=\"bui-icon icon-tag\" style=\"font-size:21px;line-height:1;vertical-align:middle;color:#CACACA;font-family:tticons !important;\"></span>\n	</div>\n</div>', '20191218/728cd6e4-25db-43a5-9210-c61c064d8aa9.jpg', '6', '21', '1', '0', '1', '1', '0', '2019-12-17 15:11:58', '2019-12-18 20:04:27', '16', '0000000009', '2');
INSERT INTO `cms_article` VALUES ('7', '啊', '分为非威锋网', '20191223/2d97b379-eb50-49af-8aa8-7a73bb7aae32.jpeg', '1', '1', '1', '0', '0', '1', '0', '2019-12-23 19:30:51', '2019-12-23 19:30:51', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('8', '啊', 'zxczxc', '20191224/9cdf8bc9-1551-425d-ab8f-1ac00433d540.jpeg', '2', '5', '4', '0', '0', '1', '0', '2019-12-24 16:04:44', '2019-12-24 16:04:44', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('9', '大话西游', '离你那里拿来看你了', '20191225/9b1df630-5f3f-4992-bb9c-014f1ca8fe08.jpeg', '6', '21', '1', '0', '0', '1', '0', '2019-12-25 08:41:45', '2019-12-25 08:41:45', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('10', '突突突突突突拖拖', '突突突突突突拖拖拖拖拖拖', '20191225/58643968-85f3-4745-8167-b237f436d66f.jpeg', '2', '5', '1', '0', '0', '1', '0', '2019-12-25 17:08:21', '2019-12-25 17:08:21', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('153', '滚滚滚', '个人各个人', '', '3', '9', '1', '0', '0', '1', '1', '2020-02-12 19:28:12', '2020-02-12 19:28:12', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('154', '添加', '方法 反反复复付付付付付付付付付付付付付付', '', '4', '13', '1', '0', '0', '1', '1', '2020-02-12 19:48:21', '2020-02-12 19:48:21', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('155', '日考2.13', '发我ifhi偶尔会佛好发货', '20200213/b4eab0ee-b47f-4e2f-a434-0fd04fed9cec.jpeg', '2', '6', '1', '0', '0', '1', '0', '2020-02-13 13:34:35', '2020-02-13 13:34:35', '0', '0000000000', '0');
INSERT INTO `cms_article` VALUES ('156', '啊订单', '嘎嘎嘎嘎嘎', '', '2', '6', '1', '0', '1', '1', '0', '2020-02-18 08:48:03', '2020-02-18 08:48:03', '0', '0000000001', '0');

-- ----------------------------
-- Table structure for cms_article_tag_middle
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_tag_middle`;
CREATE TABLE `cms_article_tag_middle` (
  `aid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`,`tid`),
  KEY `tid` (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `cms_article_tag_middle_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `cms_tag` (`id`),
  CONSTRAINT `cms_article_tag_middle_ibfk_3` FOREIGN KEY (`aid`) REFERENCES `cms_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article_tag_middle
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_vote`;
CREATE TABLE `cms_article_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article_vote
-- ----------------------------
INSERT INTO `cms_article_vote` VALUES ('6', '{\"A\":\"黄赛\",\"B\":\"高博军\",\"C\":\"杨威\",\"D\":\"王天栋\"}', '1705D 最好看的人');
INSERT INTO `cms_article_vote` VALUES ('7', '{\"A\":\"黄赛\",\"B\":\"高博军\",\"C\":\"杨威\",\"D\":\"王天栋\"}', '1705D 最好看的人');
INSERT INTO `cms_article_vote` VALUES ('9', '{\"A\":\"1\",\"B\":\"2\",\"C\":\"3\",\"D\":\"4\"}', '啊啊');
INSERT INTO `cms_article_vote` VALUES ('10', '{A:张梦,B:李思博}', '1111');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CMS_CATE_REFERENCE_CMS_CHAN` (`channel_id`),
  CONSTRAINT `cms_category_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '互联网', '1');
INSERT INTO `cms_category` VALUES ('2', '软件', '1');
INSERT INTO `cms_category` VALUES ('3', '智能家居', '1');
INSERT INTO `cms_category` VALUES ('4', '虚拟货币', '2');
INSERT INTO `cms_category` VALUES ('5', '股票', '2');
INSERT INTO `cms_category` VALUES ('6', '外汇', '2');
INSERT INTO `cms_category` VALUES ('7', '黄金', '2');
INSERT INTO `cms_category` VALUES ('8', '宏观经济', '2');
INSERT INTO `cms_category` VALUES ('9', '美国', '3');
INSERT INTO `cms_category` VALUES ('10', '亚洲', '3');
INSERT INTO `cms_category` VALUES ('11', '欧洲', '3');
INSERT INTO `cms_category` VALUES ('12', '非洲', '3');
INSERT INTO `cms_category` VALUES ('13', '新车', '4');
INSERT INTO `cms_category` VALUES ('14', 'SUV', '4');
INSERT INTO `cms_category` VALUES ('15', '汽车导购', '4');
INSERT INTO `cms_category` VALUES ('16', '用车', '4');
INSERT INTO `cms_category` VALUES ('17', 'NBA', '5');
INSERT INTO `cms_category` VALUES ('18', 'CBA', '5');
INSERT INTO `cms_category` VALUES ('19', '中超', '5');
INSERT INTO `cms_category` VALUES ('20', '意甲', '5');
INSERT INTO `cms_category` VALUES ('21', '电影', '6');
INSERT INTO `cms_category` VALUES ('22', '电视剧', '6');
INSERT INTO `cms_category` VALUES ('23', '综艺', '6');
INSERT INTO `cms_category` VALUES ('24', '明星八卦', '6');
INSERT INTO `cms_category` VALUES ('25', '段子', '7');
INSERT INTO `cms_category` VALUES ('26', '爆笑节目', '7');
INSERT INTO `cms_category` VALUES ('27', '童趣萌宠', '7');
INSERT INTO `cms_category` VALUES ('28', '雷人囧事', '7');

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', '科技', null, null);
INSERT INTO `cms_channel` VALUES ('2', '财经', null, null);
INSERT INTO `cms_channel` VALUES ('3', '国际', null, null);
INSERT INTO `cms_channel` VALUES ('4', '汽车', null, null);
INSERT INTO `cms_channel` VALUES ('5', '体育', null, null);
INSERT INTO `cms_channel` VALUES ('6', '娱乐', null, null);
INSERT INTO `cms_channel` VALUES ('7', '搞笑', null, null);
INSERT INTO `cms_channel` VALUES ('8', '游戏', null, null);

-- ----------------------------
-- Table structure for cms_collect
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES ('5', null, 'http://localhost:8083/article/showdetail?id=17', '放的地方发达发达', '2019-11-26');
INSERT INTO `cms_collect` VALUES ('6', null, 'http://localhost:8083/article/showdetail?id=106', '帝国主义', '2019-12-10');
INSERT INTO `cms_collect` VALUES ('7', null, 'http://sohu.com/', 'sds', '2019-12-10');
INSERT INTO `cms_collect` VALUES ('9', '1', 'www.baidu.com', '测试收藏2', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('10', '1', 'www.zhaotianyue.com', '赵天跃', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('11', '1', 'www.zhaotianyue.com', '赵天跃2', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('14', '1', 'www.zhaotianyue.com', '杨书仪', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('15', '1', 'www.zhaotianyue.com', '赵天跃', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('16', '1', 'www.zhaotianyue.com', '反反复复凤飞飞', '2020-02-18');
INSERT INTO `cms_collect` VALUES ('17', '1', 'www.baidu.com', '订单', '2020-02-18');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleid` (`articleId`),
  KEY `userid` (`userId`),
  CONSTRAINT `cms_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `cms_user` (`id`),
  CONSTRAINT `cms_comment_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `cms_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('1', '2', '1', '				\n			', '2019-12-18 19:45:47');
INSERT INTO `cms_comment` VALUES ('2', '2', '1', '', '2019-12-18 19:47:16');
INSERT INTO `cms_comment` VALUES ('3', '2', '1', '', '2019-12-18 19:50:03');
INSERT INTO `cms_comment` VALUES ('4', '2', '1', '', '2019-12-18 19:50:10');
INSERT INTO `cms_comment` VALUES ('5', '2', '1', '				\n			来', '2019-12-18 19:50:45');
INSERT INTO `cms_comment` VALUES ('6', '2', '1', '				\n你好', '2019-12-18 19:51:25');
INSERT INTO `cms_comment` VALUES ('7', '2', '1', '				\n			方法', '2019-12-18 19:52:52');
INSERT INTO `cms_comment` VALUES ('8', '2', '1', '				\n			订单', '2019-12-18 19:53:22');
INSERT INTO `cms_comment` VALUES ('9', '2', '1', '				\n			发发发', '2019-12-18 19:53:49');
INSERT INTO `cms_comment` VALUES ('10', '2', '1', '				\n			提供给', '2019-12-18 19:55:06');
INSERT INTO `cms_comment` VALUES ('11', '2', '1', '				\n			放的地方大幅度发放到', '2019-12-18 19:56:18');
INSERT INTO `cms_comment` VALUES ('12', '2', '1', '凄凄切切群群群', '2019-12-18 19:56:26');
INSERT INTO `cms_comment` VALUES ('13', '2', '1', '89988989', '2019-12-18 19:56:50');
INSERT INTO `cms_comment` VALUES ('14', '2', '1', '噗噗噗噗噗', '2019-12-18 19:56:58');

-- ----------------------------
-- Table structure for cms_complain
-- ----------------------------
DROP TABLE IF EXISTS `cms_complain`;
CREATE TABLE `cms_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complain_type` int(11) DEFAULT NULL,
  `compain_option` varchar(32) DEFAULT NULL COMMENT '被投诉的内容',
  `src_url` varchar(128) DEFAULT NULL,
  `picture` varchar(128) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_complain
-- ----------------------------
INSERT INTO `cms_complain` VALUES ('1', '3', '0', '2', '1,3', 'https://v4.bootcss.com/docs/4.3/components/forms/', null, '测试', 'zhuzg@sohu.com', '136834512231', '2019-12-21');
INSERT INTO `cms_complain` VALUES ('2', '3', '0', '1', '1,2', 'https://www.toutiao.com/ch/news_tech/', '20191221/18d5c2ec-380b-43da-bdf7-2c263b315c4e.png', 'sdjdsjsdjhkdsjhkdsjhkdsjhk', 'zha@nice.cn', 'r3445676', '2019-12-21');
INSERT INTO `cms_complain` VALUES ('3', '4', '0', '1', '1,2', 'https://www.toutiao.com/ch/news_tech/', '20191221/46b2a61e-466e-4999-ab05-a9b72a3dcf06.png', 'sdjdsjsdjhkdsjhkdsjhkdsjhk', 'zha@nice.cn', 'r3445676', '2019-12-21');
INSERT INTO `cms_complain` VALUES ('4', '5', '68', '1', '1,2', 'https://v4.bootcss.com/docs/4.3/components/forms/', '20191221/a8b7df55-f154-4b08-9d4a-bc02c3db1981.png', 'sddsdsds', 'ddffd@sadfn.cn', '455y66767', '2019-12-21');
INSERT INTO `cms_complain` VALUES ('6', '6', '0', '1', '1', 'www.baidu.com', '20191222/99d27c7e-6d30-4de2-b9aa-a682b38d4e75.jpeg', '方法反反复复', '99999@qq.com', '12345678901', '2019-12-22');
INSERT INTO `cms_complain` VALUES ('7', '6', '0', '1', '1', 'www.baidu.com', '20191222/feff0d51-a44a-4f0d-9e57-054fe4cbf4dc.jpeg', '发发发', '99999@qq.com', '12345678901', '2019-12-22');
INSERT INTO `cms_complain` VALUES ('8', '6', '0', '1', '1', 'www.baidu.com', '20191222/6fb94c02-141d-4576-a80d-a6d9071eaa77.jpeg', '滚滚滚', '99999@qq.com', '12345678901', '2019-12-22');
INSERT INTO `cms_complain` VALUES ('9', '6', '0', '1', '1', 'www.baidu.com', '20191222/7e820f1f-0608-4ef1-b589-0c25d1aefb69.jpeg', '发发发', '99999@qq.com', '12345678901', '2019-12-22');
INSERT INTO `cms_complain` VALUES ('10', '6', '0', '2', '1', 'www.baidu.com', '20191222/6f024c56-9833-40a4-9aa3-03f77972bd7e.jpeg', '反反复复', '99999@qq.com', '12345678901', '2019-12-22');
INSERT INTO `cms_complain` VALUES ('11', '4', '2', '1', '1', 'www.baidu.com', '20191223/fd50b8a7-bc6f-4ae8-ac64-36d38f8062f8.jpeg', 'DDDDDD', '99999@qq.com', '123215', '2019-12-23');
INSERT INTO `cms_complain` VALUES ('12', '4', '2', '2', '1', 'www.baidu.com', '20191223/4ff0bb64-d31e-427f-add7-3e261813bca7.jpeg', 'REWR', '99999@qq.com', '12345678901', '2019-12-23');
INSERT INTO `cms_complain` VALUES ('13', '5', '2', '1', '1', 'www.baidu.com', '20191223/1332dd00-a363-40a6-8505-452047440317.jpeg', '9+59+', '99999@qq.com', '12345678901', '2019-12-23');
INSERT INTO `cms_complain` VALUES ('14', '4', '2', '1', '1,2', 'www.baidu.com', '20191223/85f1bfde-f2c4-4ce5-8bec-ca029a139197.jpeg', '反反复复付付付付付付付付付付付付付付', '99999@qq.com', '12345678901', '2019-12-23');

-- ----------------------------
-- Table structure for cms_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cms_favorite`;
CREATE TABLE `cms_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`user_id`,`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_link
-- ----------------------------
INSERT INTO `cms_link` VALUES ('15', 'https://www.biquge11.com/9_9664/', '笔趣网', '2019-12-20');
INSERT INTO `cms_link` VALUES ('16', 'https://github.com/zhaotianyue-940520', 'GIT', '2019-12-20');
INSERT INTO `cms_link` VALUES ('17', 'https://www.runoob.com/', '菜鸟教程', '2019-12-20');
INSERT INTO `cms_link` VALUES ('18', 'https://www.bootcss.com/', 'Bootstrap中文网', '2019-12-20');

-- ----------------------------
-- Table structure for cms_settings
-- ----------------------------
DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_name` varchar(50) DEFAULT NULL,
  `article_list_size` int(11) DEFAULT NULL,
  `slide_size` int(11) DEFAULT NULL,
  `admin_username` varchar(16) DEFAULT NULL,
  `admin_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_settings
-- ----------------------------

-- ----------------------------
-- Table structure for cms_slide
-- ----------------------------
DROP TABLE IF EXISTS `cms_slide`;
CREATE TABLE `cms_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_slide
-- ----------------------------
INSERT INTO `cms_slide` VALUES ('1', '图1', '鬼刀北漠公主风铃4k桌面壁纸_彼岸图网.jpg', null);
INSERT INTO `cms_slide` VALUES ('2', '图2', '鬼刀风铃公主珍宝4k超清壁纸3840x2160_彼岸图网.jpg', null);
INSERT INTO `cms_slide` VALUES ('3', '图3', '冰公主海琴烟 北漠公主风玲 舞会 鬼刀4k壁纸_彼岸图网.jpg', null);

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `abstract` varchar(140) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_special
-- ----------------------------
INSERT INTO `cms_special` VALUES ('1', '啊啊', '萨芬范德萨', '2019-10-25');
INSERT INTO `cms_special` VALUES ('2', '程序员节日22', '			 this is m yt test sss\r\n		', '2019-10-25');
INSERT INTO `cms_special` VALUES ('3', 'test', 'dssdffafd', '2019-10-25');

-- ----------------------------
-- Table structure for cms_special_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_article`;
CREATE TABLE `cms_special_article` (
  `sid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`sid`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_special_article
-- ----------------------------
INSERT INTO `cms_special_article` VALUES ('1', '77');
INSERT INTO `cms_special_article` VALUES ('1', '98');
INSERT INTO `cms_special_article` VALUES ('2', '78');
INSERT INTO `cms_special_article` VALUES ('2', '10000');
INSERT INTO `cms_special_article` VALUES ('3', '33');
INSERT INTO `cms_special_article` VALUES ('3', '56');

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagnageindex` (`tagname`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1138', '');
INSERT INTO `cms_tag` VALUES ('1139', ' zhSANG');
INSERT INTO `cms_tag` VALUES ('1141', ' zhSANG111');
INSERT INTO `cms_tag` VALUES ('1131', ' 尹士杰，尹士杰，尹士杰');
INSERT INTO `cms_tag` VALUES ('1125', 'article');
INSERT INTO `cms_tag` VALUES ('1111', 'bootstrap');
INSERT INTO `cms_tag` VALUES ('1112', 'css');
INSERT INTO `cms_tag` VALUES ('1129', 'dotnet');
INSERT INTO `cms_tag` VALUES ('1108', 'git');
INSERT INTO `cms_tag` VALUES ('1113', 'h5');
INSERT INTO `cms_tag` VALUES ('1124', 'hibernate');
INSERT INTO `cms_tag` VALUES ('1126', 'java');
INSERT INTO `cms_tag` VALUES ('1114', 'javascript');
INSERT INTO `cms_tag` VALUES ('1110', 'jquery');
INSERT INTO `cms_tag` VALUES ('1140', 'LISI');
INSERT INTO `cms_tag` VALUES ('1142', 'LISI11');
INSERT INTO `cms_tag` VALUES ('1106', 'maven');
INSERT INTO `cms_tag` VALUES ('1105', 'mybatis');
INSERT INTO `cms_tag` VALUES ('1109', 'mysql');
INSERT INTO `cms_tag` VALUES ('1128', 'ppt');
INSERT INTO `cms_tag` VALUES ('1127', 'python');
INSERT INTO `cms_tag` VALUES ('1104', 'spring');
INSERT INTO `cms_tag` VALUES ('1123', 'spring-mvc');
INSERT INTO `cms_tag` VALUES ('1115', 'sql');
INSERT INTO `cms_tag` VALUES ('1107', 'ssm');
INSERT INTO `cms_tag` VALUES ('1130', 'tensorFlow');
INSERT INTO `cms_tag` VALUES ('1144', '中国');
INSERT INTO `cms_tag` VALUES ('1117', '人工智能');
INSERT INTO `cms_tag` VALUES ('1146', '体育');
INSERT INTO `cms_tag` VALUES ('1136', '周发发');
INSERT INTO `cms_tag` VALUES ('1135', '周星星');
INSERT INTO `cms_tag` VALUES ('1116', '大数据');
INSERT INTO `cms_tag` VALUES ('1153', '威威，抬头纹');
INSERT INTO `cms_tag` VALUES ('1134', '张三');
INSERT INTO `cms_tag` VALUES ('1121', '操作系统');
INSERT INTO `cms_tag` VALUES ('1119', '数据库');
INSERT INTO `cms_tag` VALUES ('1118', '数据结构');
INSERT INTO `cms_tag` VALUES ('1152', '文章，测试');
INSERT INTO `cms_tag` VALUES ('1145', '日本');
INSERT INTO `cms_tag` VALUES ('1137', '梁威威');
INSERT INTO `cms_tag` VALUES ('1155', '熊');
INSERT INTO `cms_tag` VALUES ('1147', '爱好');
INSERT INTO `cms_tag` VALUES ('1154', '狗');
INSERT INTO `cms_tag` VALUES ('1120', '算法');
INSERT INTO `cms_tag` VALUES ('1122', '设计模式');
INSERT INTO `cms_tag` VALUES ('1103', '﻿java');

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `locked` int(11) DEFAULT NULL COMMENT '1:正常,0:禁用',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `role` varchar(1) DEFAULT '0' COMMENT '0:普通用户,1:管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('1', '', 'd41d8cd98f00b204e9800998ecf8427e', null, null, null, '0', '2019-12-14 08:20:21', null, null, '0', '0');
INSERT INTO `cms_user` VALUES ('2', '.', '5058f1af8388633f609cadb75a75dc9d', null, null, null, '0', '2019-12-16 13:42:24', null, null, '0', '1');
INSERT INTO `cms_user` VALUES ('3', '123456', 'c20766eb0c16bdef4f1751e0c244b96d', null, null, null, '0', '2019-12-19 19:54:12', null, null, '1', '1');
INSERT INTO `cms_user` VALUES ('4', '1708e', '94a454d26fa0b67cb2fd05899a306081', null, null, null, '0', '2019-12-24 16:04:24', null, null, '0', '0');

-- ----------------------------
-- Table structure for cms_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `option` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artice_ref` (`article_id`),
  KEY `user_ref` (`user_id`),
  CONSTRAINT `cms_vote_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `cms_article_vote` (`id`),
  CONSTRAINT `cms_vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_vote
-- ----------------------------
INSERT INTO `cms_vote` VALUES ('1', null, null, null);
