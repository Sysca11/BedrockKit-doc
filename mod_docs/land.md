## Land领地

### 概述
文件名: bdxland.dll</br>
语言包: landpack/land.json</br> 
配置文件: config/land.json</br>
数据库: data/land_v2</br>

### 依赖
bdxmoney.dll

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

`/land trust/untrust/give`</br>
`/land trust <玩家名>` 信任玩家，玩家拥有除更改被信任人和出售领地以外的所有权限</br>
`/land untrust <玩家名>` 取消信任玩家</br>
`/land give <玩家名>` 转让领地主人权限(目标玩家必须在线)</br>
`/land perm <数字>` 更改脚下领地权限掩码

0: NOTHING 无权限(默认)</br>
1: PERM_INTERWITHACTOR 和生物互动，比如喂食，骑马，让宠物坐下</br>
2: PERM_USE 空手点击</br>
4: PERM_ATK 攻击实体</br>
8: PERM_BUILD 建造</br>
16: PERM_DESTROY 破坏

默认的land perm为0，表示陌生人没有被授予任何默认权限</br>
如果想给陌生人权限，请更改perm值，perm值为权限值之和</br>
例如: 允许领地内陌生人攻击实体和空手点击</br>
根据land perm计算得出: 2(空手点击)+4(攻击实体)=6</br>
则输入: `/land perm 6`

注: *OP拥有所有领地的所有权限，同时OP买领地不扣钱*

### 配置文件
```
{
"BUY_PRICE": 10, //一方块购买价格
"SELL_PRICE": 10, //一方块卖出价格
"PROTECT_FARM": true, //默认保护耕地
"PROTECT_IFRAME": true, //默认保护展示框
"LAND_MIN_Y": 0 //领地保护作用的最低高度，低于此高度领地将不受保护
}
```