# GLang格式手册
> **GLang 描述了游戏内的简单GUI布局**
> 第一行，描述了GUI的具体信息
> type=类型,cb=回调函数,cb2=关闭gui时的回调(可以不指定),title=标题,content=内容（可以不指定)
> 类型分为`simple和full`，`simple`为只有一列按钮的gui，`full`为只有一个提交按钮的复杂gui

## 下面分别以simple和full为例填写表单
### Simple表单：
<pre>
type=simple,cb=SIMPLE_CB,title=My First Form,content=”Do you,,,, like this\n?”
text=Button1
text=§3Button2,img=textures/ui/icon_sign
</pre>

### LUA

<pre>
function SIMPLE_CB(name,index,text)
--- 如果点击了按钮1，if you clicked Button1
--- name=”Steve” , index = 0, text=”Button1”
end
</pre>

---

### Full表单：
<pre>
type=full,cb=FULL_CB,title=My Second Form                   !!!! 这里不能指定content
type=label,text=”My Label 1,You Can use \n here”              //标签
type=toggle,text=”Turn Me On!”,def=true                    //开关，默认打开
type=toggle,text=”Turn Me Off!”,def=0                      //开关，默认关闭
type=slider,text=”Volume!”,min=0,max=100,def=50            //滑动，最小0，最大100，默认50
type=input,text=”Input Your Name here”,placeholder=”your name”     //文本框，placeholder为框内灰色内容
type=dropdown,text=”select a pet”,args=[“dog”,”cat”]           //下拉框，args为选项
</pre>

#### LUA:
<pre>
function FULL_CB(name,raw,data)
--- 如果开关分别打开，关闭，滑动到69，输入kksk，选择cat
--- name=”Steve”
--- raw = { 1: 0 (label),2:1 (打开开关),3:0 (关闭开关),4: 69, 5: “kksk”,6: 1 (选择第二项)}
--- data = { 1 : “cat” }
end
</pre>

---

## 进阶教程：
### 换行
> 直接在字符串中输入\n
> 例如”aaa\nbbb”

### 动态GUI
> GLang动态参数绑定
> GUI文件中，可以用%1,%2代表没有确定的项，通过GUi参数的指定项来替换%1,%2

例如
**文件 gui/guiMain**
<pre>
type=simple,cb=CB,title=T,content=My money is %1
text=exit
</pre>

通过lua调用
`GUI(“Steve”,”guiMain”,getMoney(“Steve”))`      来显示这个gui

而`dropdown`可以使用另一种形式的参数
<pre>
type=dropdown,text=选择一个家,args=%1
type=dropdown,text=选择一个玩家,args=%0
type=label,text=Test %2
</pre>

**此处，%0默认被替换为在线玩家列表**
`GUI(“Steve”,”gui2”,getHomesV(“Steve”),”test”)`

**小提示：每一个带后缀V的api，返回的列表字符串都可以用在这里**