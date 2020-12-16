# BDXLua接口
## 概述
服务器启动时，会执行lua文件夹下的所有lua文件。
Lua可以热重载，通过/lreload指令。

## 类型约定
共有5种类型，
- `bool`为布尔值，可选(true,false)
- `str`为字符串
- `int`为整数
- `num`为实数
- `xstr`为可以转化为`str`的类型，包括`bool,str,int,num`以及`table`，table会被转化为类似
`["value1","value2"]`的字符串


## API文档描述约定
函数名(参数) -> (返回值,返回值...)</br>
函数介绍:

其中参数和返回值遵守以下格式:</br>
`名字:类型`  
例如:</br>
`playerName:str,money:int`

## API列表

### 服务器基础
**发送文本**
- 给玩家发送文本</br>
`sendText(玩家名:str,文本:str [,文本类型:int])`

- 给所有人发送文本</br>
`bcText(文本:str [,文本类型:int])`

其中文本类型包括

- 0: RAW (聊天框)
- 3: POPUP (物品栏上)
- 4: JUKEBOX_POPUP (音乐盒 物品栏上)
- 5: TIP (物品栏上)


**获取在线玩家列表:** `oList()`->table

**获取玩家列表，table从1开始:** `oListV()`->str</br>
获取文本形式玩家列表，如`["a","b"]`

**运行指令**
`runCmd(指令:str)`->bool</br>
以控制台身份运行指令</br>
返回指令是否运行成功</br>
例如: `runCmd(”/me test”)`</br>
*注：如果使用clear一类指令，clear失败返回false*

`runCmdAs(玩家名:str,指令:str)`->bool</br>
以玩家身份运行指令</br>
返回是否运行成功</br>
例如: `runCmdAs(“Steve”,”/me test”)`

`runCmdEx(指令:str)`->(bool,str)</br>
以**控制台**运行并**获取输出**</br>
例如:
<pre>
success,output=runCmdEx(“/clear Steve dirt 3”)
Print(success,output)  -- true     output.....
</pre>

### 数据库相关
`dget(玩家名:str,数据名:str)`->nil or str</br>
获取玩家储存数据，如果不存在返回nil，否则返回str</br>
例如: `dget(“steve”,”hasSigned”)`

`dput(玩家名:str,数据名:str,数据:xstr)`</br>
保存数据

`ddel(玩家名:str,数据名:str)`</br>
删除数据

注: 数据库实际储存格式 玩家名-数据名，类似”Steve-data1”</br>
可以使用/lua_db指令来打印数据库中实际存储的数据</br>
`/lua_db ""`->打印全部数据</br>
`/lua_db "Steve-"`->打印Steve的数据</br>
`/lua_db_del "Steve-"`->删除Steve的数据</br>

### 杂项
`Log(日志:xstr,...)` 记录日志，同时写入文件(lualog.log)和打印到屏幕</br>
例如: `Log(1,2,”114514”)`

**获取玩家位置**</br>
`getPos(玩家名:str)`->(x:num,y:num,z:num,dimensionID:int) 获取玩家位置信息
例如: `print(getPos(“Steve”))`</br>
输出: 11.2000 12.3000 3.1000 1</br>
则表明: Steve在坐标(11.2,12.3,3.1) 在维度1

**定时器**</br>
`schedule(回调函数名:str,定时间隔:int,第一次执行延迟:int)`->int</br>
计划定时任务 返回int，表示任务id</br>

`cancel(任务id:int)`
通过schedule返回的任务ID取消任务</br>
例如:
<pre>
function timer()
print(“hi”)
end
id=schedule(“timer”,10,0)     --- 每5秒执行一次
schedule(“timer”,0,10)     --- 5秒后执行，只执行一次
schedule(“timer”,10,10)    --- 5秒后执行第一次，每5秒再执行一次

cancel(id)    --- 取消第一个任务
</pre>

## init.lua及其他DLL提供的API

`TSize(x:table)->int`</br>
获得table大小

`append(x:table,val:any)`</br>
给table后面附加元素

`runCmdS(cmd:str[,break_on_error:bool])->bool`</br>
执行一串命令 例如: `say a$kill @a`

`safe_clear(name:str,item:str,count:int)->bool`</br>
安全的清除物品，item为类似"diamond","dirt 1"的字符串，数字代表特殊值，可以不写</br>
返回是否清除成功

`getHand(name:str)->item:str,aux:int`</br>
获取手上物品

`cleanHand(name:str)`</br>
清除手上物品

`dumpInv(name:str,isEnderChest:bool)->str`</br>
获取玩家背包内容

`giveItem(name:str,item:str,count:int,aux:int[,lore:table])`</br>
给玩家物品，aux特殊值</br>
例如: </br>
`giveItem(name,"diamond",10,0,{0:"super diamond"})`
`giveItem(name,"dirt",10,1)`

---

**bdxmoney:**
`getMoney(玩家名:str)`->int</br>
获取玩家钱数

`addMoney(玩家名:str,金钱:int)`</br>
给钱

`rdMoney(玩家名:str,金钱:int)->bool`</br>
扣钱，返回是否成功

---

**bdxtpa:**
`getHomes(玩家名:str)`->table</br>
获取玩家家列表
`getHomesV(玩家名:str)`->str</br>
获取玩家家列表字符串

---

**bdxland:**
`getLand(x:num,y:num,z:num,dim:int)`->(permo:int,permg:int,owners:table)</br>
获取坐标对应的领地的权限设置和主人列表

`getLandV(x:num,y:num,z:num,dim:int)`->(permo:int,permg:int,owners:str)</br>
获取坐标对应的领地的权限设置和主人列表(字符串)

## 事件监听
`Listen(事件名:str,回调:str/function)`</br>
*必须在函数声明后，再使用Listen*</br>
例如:

```lua
Listen("onCMD", function(name,cmd)
					print(cmd)
				end)
function test(name,a,b)
end
Listen("onLCMD","test")
```

**注册监听器**

其中，事件包括

事件名|触发类型|参数|参数实例|备注
--|---|---|---|--
onJoin| 玩家进入服务器 |(name:str)|("Steve")| |
onLeft|玩家退出|(name:str)|("Steve")| |
onChat(可取消)|玩家发言|(name:str,chat:str)|("Steve","hello")| |
onCMD(可取消)|玩家输入指令|(name:str,cmd:str)|("Steve","/me hello")| |
onPlayerKillMob|玩家杀死实体|(name:str,eTypeId:int)|("Steve",4132)|eTypeId为实体类型id|
onLCMD|执行/l指令|(name:str,cmdname:str,args:str)|("Steve","test","aa Steve bb")     |/l test aa @p bb|
*取消事件只需 return -1*

## 进行调试
控制台输入`!lua`可以进入lua交互shell</br>
输入两次回车执行内容</br>
输入`bye`回车，退出shell

## GLang GUI接口 （建议先阅读GLang参考 章节）
`GUI(玩家名:str,GUI文件名:str,GUI参数:xstr,...)`</br>
`GUIR(玩家名:str,GLang内容:str,GUI参数:xstr,...)`

## 指令汇总
`/lcall funcname` 玩家调用lua函数</br>
例如: `/lcall test` = `u_test(“Steve”)`

`/lreload` 重载lua

`/gui guiname` 直接显示gui</br>
例如: `/gui tpagui` 显示gui/u_tpagui给用户

`/lua_db prefix` 显示数据库中以prefix 为前缀的项目</br>
例如: `/lua_db ""`

`/l <参数>` 调用lua指令</br>
例如: `/l test @p 123`