## LUA脚本支持
### 概述
文件名:`bdxlua.dll`  
lua脚本:`lua/main.lua`  
GUI脚本:`gui/`  

### 命令列表
执行lua函数:`/lcall <lua函数名>`  
玩家调用名字为 `u_函数名` 的函数，例如:  
xianbei执行`/lcall redtea`，则调用`u_redtea("xianbei")`

重载lua:`/lreload`  
为玩家显示GUI脚本:`/gui <GUI名>` GUI脚本存放在`gui/u_名字`

### lua接口  
参见 [LUAAPI.md](../bdxlua-doc/LUAAPI.md)