function safe_clear(name,item,count)                                                  
        -- return bool (success)                                                      
        if string.find(item,' ')==nil then                                            
                -- item = name + auxVal                                               
                item=item.." 0"                                                       
        end                                                                           
        local count2=count-1                                                          
        -- print(count2)                                                              
        local suc,res=runCmdEx(string.format("clear \"%s\" %s %d",name,item,count2))  
        if suc==false then                                                            
                Log("clear failed",name,res)                                          
                return false                                                          
        end                                                                           
        local suc,res2=runCmdEx(string.format("clear \"%s\" %s 1",name,item))         
        if suc==false then                                                            
                Log("clear2 failed",name,res," -> ",res2)                             
                return false                                                          
        end                                                                           
        return true                                                                   
end                                                                                   
