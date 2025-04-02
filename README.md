<!-- 温泉度假村管理系统 -->
# 温泉度假村管理系统

## 系统说明

此系统是韶关学院19软件工程林文新毕业设计作品
本系统分为两个子系统，一是游客前台子系统，二是后台管理子系统。游客前台子系统主要提供游客用户浏览度假村信息与提供房间预订功能，而后台管理子系统就是对前台的信息进行管理以及业务对接等，使温泉度假村各项事务进行信息化管理。

* 前台系统结构包含注册、登录、景点风光、预订房间、景区文章、个人中心功能。

* 后台系统结构包含登录、管理员用户管理、游客用户管理、角色管理、权限管理、房间管理、景点管理、订单管理、数据统计、个人中心。

## 系统使用说明

### 数据库部署

* 安装mysql数据库软件(尽量mysql8)
* 创建resort_man_sys(也可以是其它名称，如果是其它请在后端接口配置中更改)[后台配置](/rms_backstage_server/src/config/default.json),[前台配置](/rms_forestage%20_server/src/config/default.json)
* [运行mysqlDB的resort_man_sys.sql](/mysqiDB/resort_man_sys.sql)
* 数据库表比较多，可能在23年4月时还没有全部用到，因为是为了拓展的

### 项目软件部署与运行

* 安装node.js(尽量node16)
* 在终端分别打开目录[后台前端：/rms_backstage_browser/](/rms_backstage_browser/)、[后台后端：/rms_backstage_server/](/rms_backstage_server/)、[前台前端：/rms_forestage_browser/](/rms_forestage_browser/)、[前台后端：/rms_forestage_server/](/rms_forestage%20_server/)
* npm i 命令加载依赖
* 直接运行命令npm start（都在package.js做了配置，运行项目都使用npm start命令即可）
* 打开相应前端项目地址即可查看页面

### 软件现状

* 软件功能并未完善 特别是业务方面
* 后续完善请看[我的gitee项目地址](https://gitee.com/linwx001/resort-management-system)、[我的github项目地址](https://github.com/linwjing/rms)

## 展望

* (1)	进一步对温泉度假村进行业务的刨析，补充完善温泉度假村管理的功能，如实景看房看景、地图导肮、房间物品管理、度假村内设施管理等
* (2)	进一步优化性能和页面UI
* (3)	剔除非必要功能，减少冗余，功能做到在精不在泛 
* (4)	对简化业务流程，避免温泉度假村人员在多个页面进行反复切换，做到业务自动化，方便管理员管理

