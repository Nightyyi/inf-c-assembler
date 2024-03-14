local filepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\codefile.txt"
local newfilepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\codefilenew.txt"

-- template
function readFile(filepath)
    local file = io.open(filepath, "r" )
    for line in file:lines() do
        print(line)
        end
    file:close()
end
--slices a string 
function slice(string)
    local list = {}
    local n = 1
    for i in string.gmatch(string, "%S+") do
    list[n] = i
    n=n+1
    end
    return(list)
end

function interpret(filepath,newfilepath) 
    local Codelist = {}
    local codeLen = 1
    local file = io.open(filepath, "r" )
    Codelist[codeLen] = 0x20000000
    codeLen=codeLen+1
    for line in file:lines() do
        local z = slice(line)
        opcode = z[1]
        oper1 = z[2]
        oper2 = z[3]
        oper3 = z[4]
        if opcode == "LDB" then 
            Codelist[codeLen] = 0x20010000+oper1
            codeLen=codeLen+1
        elseif opcode == "LDR" then 
            Codelist[codeLen] = 0x20020000+oper1
            codeLen=codeLen+1
        elseif opcode == "LDDB" then 
            Codelist[codeLen] = 0x20030000+oper1
            codeLen=codeLen+1
        elseif opcode == "INV" then 
            Codelist[codeLen] = 0x20040000+oper1
            codeLen=codeLen+1
        elseif opcode == "DO" then 
            Codelist[codeLen] = 0x20050000
            codeLen=codeLen+1
        elseif opcode == "REV" then 
            Codelist[codeLen] = 0x20060000+oper1
            codeLen=codeLen+1
        elseif opcode == "JMP" then 
            Codelist[codeLen] = 0x20070000+oper1
            codeLen=codeLen+1
        elseif opcode == "SJMP" then 
            Codelist[codeLen] = 0x20080000+oper1
            codeLen=codeLen+1
        elseif opcode == "HINV" then
            Codelist[codeLen] = 0x20090000+oper1
            codeLen=codeLen+1
        elseif opcode == "WRI" then 
            Codelist[codeLen] = 0x200A0000+oper1
            codeLen=codeLen+1
        elseif opcode == "RWR" then 
            Codelist[codeLen] = 0x200B0000+oper1
            codeLen=codeLen+1
        elseif opcode == "ARW" then 
            Codelist[codeLen] = 0x200C0000+oper1
            codeLen=codeLen+1
        elseif opcode == "CRP" then 
            Codelist[codeLen] = 0x200D0000+oper1
            codeLen=codeLen+1
        end
    end 
    file:close()

    local file = io.open(newfilepath, "w" )
    for i=1,codeLen+1,1 do 
        if Codelist[i] ~= nil then
            file:write(Codelist[i])
            file:write("\n")
        end
    end
    file:close()
end





interpret(filepath,newfilepath)