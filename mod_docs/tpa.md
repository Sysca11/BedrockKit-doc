## TPA HOME 与WARP
### 概述
文件名:`bdxtpa.dll`  
语言包:`landpack/tpa.json`  
配置文件:`config/tpa.json`  
数据库:`data/tpa`

### 功能
tpa玩家间发送传送请求  
home玩家设置家  
warp:op设置公共传送点  

### 指令
`/tpa <to/here> <player>` 向目标玩家发起传送请求，其中`to`为传送到目标玩家位置，`here`为将目标玩家传送到你的位置    
`/tpa gui` 打开GUI  
`/tpa ac/de/cancel/toggle`  
`ac` 同意请求  
`de` 拒绝请求  
`cancel` 取消你发送的请求  
`toggle` 改变你的tpa接受状态，tpa接受状态指是否允许别人向你发送请求

`/back` 回到死亡点  
`/suicide` 自杀

`/warp go/add/ls/del/gui`
`/warp go <传送点名>` 到传送点  
`/warp ls` 查看所有传送点  
`/warp gui` 打开GUI  
`/warp add <传送点名>` 添加传送点(需要OP)  
`/warp del <传送点名>` 删除传送点(需要OP)

`/home go/add/ls/del/gui`
`/home go <家名>` 传送回家  
`/home ls` 查看所有家  
`/home gui` 打开GUI  
`/home add <家名>` 添加一个家  
`/home del <家名>` 删除一个家

<u>其中，OP可以通过`/homeas`指令以玩家身份执行home命令，从而查看玩家家或者删除玩家家</u>  
例如:`/homeas steve ls`  
`/homeas steve del jia`

### 配置文件
```
{
"max_homes":5,     //玩家最大设置家数量
"tpa_timeout":20000,   //tpa请求超时时间，单位毫秒，默认20s
"tpa_ratelimit":5000, //连续tpa请求冷却时间，单位毫秒，默认5s
"home_land_distance":8, //不能在无权限的land周围设置home的距离
"BACK_ENABLED":true, //是否启用/back命令
"SUICIDE_ENABLED":true //是否启用/suicide命令
}
```