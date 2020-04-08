## bossbar,npc,map
### 概述
文件:`Bossbar.dll`  
数据:`data/npcutil`

### 依赖
`bdxlua.dll`

### 功能
自定义bossbar、自定义npc、自定义map  

### 指令
`/bb pin <信息>` 在bossbar上添加一条不会消失的信息  
`/bb unpin` 取消bossbar上的信息  
`/bb length "100"` bossbar血量(百分比)  
例如:`/bb pin "服务器群号:1919810"`

`/map <文件名>` 将你手上的填充过的地图内容设置为.bin文件的内容  
**注意:你必须使用使用过的地图而不是空地图**  
例如:`/map 0` 将手上的地图内容设置为0.bin中的内容  

`/npc add <名字> <生物英文名> <头顶显示的名字> <lua回调函数>` 添加一个NPC  
例如:`/npc add npc1 pig 李田所 onNPC` 添加一个名为`npc1`的NPC，他是一头`猪`，他头顶显示`李田所`，如果你摸他就会触发lua中的`onNPC`函数

`/npc list [名字]` 查看npc列表  
例如:`/npc list` 查看你附近的NPC  
`/npc list npc1` 查看名为`npc1`的NPC

`/npc remove [名字]` 移除一个名为`名字`的NPC  
例如:`/npc remove npc1` 移除一个名为`npc1`的NPC

`/npc setrot <名字> <头俯仰角度> <身体角度1> <身体角度2>` 调节NPC的方向
**注意:NPC只能在主维度(也就是主世界)创建，且有可能在所有维度(主世界、末地、下界)的同坐标都显示NPC**

**NPC的lua回调指，NPC被点击时，调用指定回调函数
例如上文例子的npc1被点击就会调用`onNPC(点击者名字)`**

