## 服务器简单log和实用工具
### 概述
文件名:`bdxhelper.dll`  
语言包:无  
配置文件:`config/helper.json`

## 功能
记录玩家聊天、IP、指令历史到`bdx.log`  
点地执行指令  
强制开启ability  
以玩家身份运行(非execute)  
若干指令  

## 命令列表
以玩家身份执行命令:`/runas <player> <命令>`  
例如:`runas @a me hi`  
 
给予称号:`/cname set Steve <称号>`  
删除称号:`/cname rm Steve`   
例如:`/cname set Steve OWNER`

**注意:控制台输入中文可能会乱码，建议游戏内输入，请注意玩家名大小写**

将玩家传送到指定服务器:`/transfer <player> <IP> [端口]`  
例如:`/transfer @a mc114.top 19132`

黑名单列表:`/ban list`  
将玩家加入黑名单:`/ban ban <玩家名/IP> [时间(秒数)]`(顺带一提，"/"是"或"的意思)  
将玩家移除黑名单:`/ban unban <玩家名/IP>`  
例如:`/ban ban Steve 10` 将Steve封禁10s  
`/ban ban Steve` 将Steve永久封禁  
`/ban banip 114.5.1.4` 禁止IP为114.5.1.4的玩家加入  

强制踢出一个玩家:`/skick`  

**输入/skick 字符串，可以踢出所有以此字符串为前缀的玩家**  

例如:`/skick s` 会踢出Steve和s_b  
`/skick ""` 会踢出所有玩家  

## 配置文件格式
`enable_expplay:boolean` -> 是否开启实验性游戏,true开启  
`CMDMAP:{int,string}` -> 物品id和以此id点地时执行的指令  
例如:
```
{
0:"me 空手点地",
2:"me 土块点地"
}
```