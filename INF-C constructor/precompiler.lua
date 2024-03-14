local filepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\infc code.txt"
local newfilepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\precompile.txt"

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
    local codeLenList = {}
    local codeLen = 0
    local codeLine = 1
    local file = io.open(filepath, "r" )
    for line in file:lines() do
        local z = slice(line)
        local opcode = z[1]
        local oper1 = z[2]
        local oper2 = z[3]
        local oper3 = z[4]
        Codelist[codeLine] = tostring(codeLen)
        -- Clear the core
        if opcode == "CLRC" then 
            codeLen=codeLen+2
        -- Load Immediately oper1 into oper2 register
        elseif opcode == "LDIM" then 
            codeLen=codeLen+2
        -- Adds registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "ADD" then 
            codeLen=codeLen+7
        -- Subtracts registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "SUB" then 
            codeLen=codeLen+7
        -- Bitwise XOR's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "XOR" then 
            codeLen=codeLen+7
        -- Bitwise AND's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "AND" then 
            codeLen=codeLen+7
        -- Bitwise OR's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "OR" then 
            codeLen=codeLen+7
        -- Builds an instruction using registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "BULD" then 
            codeLen=codeLen+7
         -- Writes register oper 1 to oper 2 in memory
        elseif opcode == "WRI" then 
            codeLen=codeLen+4
         -- always jump to oper 1 
        elseif opcode == "JMPA" then 
            codeLen=codeLen+3
         -- Jumps IF register oper 1 is equal to register oper 2, to oper 3
        elseif opcode == "JMPEQ" then 
            codeLen=codeLen+7
         -- Jumps IF register oper 1 if not equal to register oper 2, to oper 3
        elseif opcode == "JMPNEQ" then 
            codeLen=codeLen+7
         -- Jumps IF register oper 1 is greater than register oper 2, to oper 3
        elseif opcode == "JMPGT" then 
            codeLen=codeLen+7
         -- Jumps IF register oper 1 is lesser register oper 2, to oper 3
        elseif opcode == "JMPLS" then 
            codeLen=codeLen+7
         -- Jumps IF register oper 1 is equal or greater than register oper 2, to oper 3
        elseif opcode == "JMPEQGT" then 
            codeLen=codeLen+7
         -- Jumps IF register oper 1 is equal or lesser than register oper 2, to oper 3
        elseif opcode == "JMPEQLS" then 
            codeLen=codeLen+7
         -- takes register oper 1 as a pointer to somewhere in memory to execute
        elseif opcode == "EXEC" then 
            codeLen=codeLen+5
         -- takes register oper 1 and outputs it to oper 2 
        elseif opcode == "COUT" then 
            codeLen=codeLen+4
        end
        codeLine = codeLine + 1
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