## 领地
### 概述
文件名:`bdxland.dll`  
语言包:`landpack/land.json`  
配置文件:`config/land.json`  
数据库:`data/land_v2`

### 依赖
`BDXMONEY.dll`

### 指令
`/land a/b/exit` ("/"为"或"的意思)  
`/land a` 为进入选点a模式，此时点地选点a  
`/land b` 为进入选点b模式，此时点地选点b  
选完两个点就可以输入`/land buy`，退出选点请输入`/land exit`  

`/land buy/sell/info/gui`  
`buy` 购买  
`sell` 卖出你脚下的领地  
`info` 查询脚下领地信息  
`gui` 领地gui  

`trust/untrust/give`
`/land trust <玩家名>` 信任玩家，玩家拥有除更改被信任人和出售领地以外的所有权限
`/land untrust <玩家名>` 取消信任玩家
`/land give <玩家名>` 转让领地主人权限(目标玩家必须在线)
`/land perm <数字>` 更改脚下领地权限掩码
```
enum LandPerm : u16 {
	NOTHING = 0,   //无默认权限
	PERM_INTERWITHACTOR = 1, //和生物互动，比如喂食，骑马，让宠物坐下
	PERM_USE = 2,  //空手点击
	PERM_ATK = 4,  //攻击实体
	PERM_BUILD = 8, //建造
	PERM_DESTROY=16 //破坏
};
```
默认的land perm为0，表示陌生人没有被授予任何默认权限。  
如果想给陌生人权限，请更改perm值，perm值为权限值之和  
例如:让领地支持攻击实体和空手点击，可以输入:  
`/land perm 6` 因为*2+4=6*

#### 备注
**OP拥有所有领地的所有权限，同时OP买领地不扣钱**

### 配置文件
```
{
"BUY_PRICE":10, //一格领地对应购买价格
"SELL_PRICE":10, //卖出价格
"PROTECT_FARM":true, //默认保护耕地，现在不能修改
"PROTECT_IFRAME":true //默认保护展示框,现在不能修改
"LAND_MIN_Y":0
}
```
