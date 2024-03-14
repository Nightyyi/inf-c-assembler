local xBase = 100
local yBase = 115
local newfilepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\codefilenew.txt"

translateToGame = function()
    local file = io.open(newfilepath, "r" )
    for n=0,16383,1 do
        local line = file:read("*l")
        x = (n%256)+xBase
        y = yBase-math.floor(n/256)
        if line == "" or line == nil then 
            line = 0x20000000
        end
        print(line)
        print(n .. " " .. x .. " " .. y .. " ")
    
        id = sim.partID(x, y)
        sim.partProperty(id, "ctype",tonumber(line))
    end
    file:close()
end


translateToGame()