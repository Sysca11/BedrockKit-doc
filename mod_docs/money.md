## 经济
### 概述
文件名:`bdxmoney.dll`  
语言包:`landpack/money.json`  
配置文件:`config/money.json`  
数据库:`data/money.db` 数据库为sqlite格式

### 依赖
`bdxlua.dll`

### 功能
带流水的经济，通过sql储存，可多服同步

### 指令
`/money query/hist [玩家名]`  
`query` 查自己的余额或者指定玩家的  
`hist` 查自己的历史或者指定玩家的  
例如:`/money query`  
`/money hist steve`

`pay/set/add/reduce`
`/money pay <玩家名> <数目>` 向指定玩家转账若干的钱  
`/money set <玩家名> <数目>` 设置目标玩家的钱数(仅OP可用)  
`/money add <玩家名> <数目>` 为目标玩家增加若干金钱  
`/money reduce <玩家名> <数目>` 从目标玩家的账户中拿走若干的钱  

<u>这里的目标为玩家名，不区分大小写</u>  

`/money_op purge [秒]` 清除多少秒之前的记录，不填写为清除全部  
`/money_op pay/set/add/reduce`

<u>注意:`/money_op reduce`存在返回状态，可以联动链命令方块使用</u>

### 配置文件
```
{
"def_money":0,   //默认金钱，整数
"pay_tax":0.0   //玩家汇款税率，浮点数 税=金额*pay_tax
}
```
### lua API
通过lbind调用  
`lbind("getMoney",玩家名)->金钱` 获取玩家钱数
`lbind("rdMoney",玩家名,钱数)->bool` 扣去玩家金钱，返回扣钱成功状态
`lbind("addMoney",玩家名,钱数)` 为玩家加钱