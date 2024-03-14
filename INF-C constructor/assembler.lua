local filepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\infc code.txt"
local newfilepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\codefile.txt"
local precompilefilepath = "C:\\Users\\win10\\Pictures\\programming projects\\lua\\INF-C constructor\\precompile.txt"

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
    local file = io.open(precompilefilepath, "r" )
    local counter1 = 0
    local codeLenList = {}
    for line in file:lines() do
        codeLenList[counter1] = line
        counter1 = counter1 + 1
    end
    file:close()

    local Codelist = {}
    local codeLen = 1
    counter1 = 0
    local file = io.open(filepath, "r" )
    for line in file:lines() do
        local z = slice(line)
        local opcode = z[1]
        local oper1 = z[2]
        local oper2 = z[3]
        local oper3 = z[4]
        print(codeLenList[counter1])
        counter1 = counter1 + 1
        -- Clear the core
        if opcode == "CLRC" then 
            Codelist[codeLen] = "LDB " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(tonumber(0xFFFF))
            codeLen=codeLen+1
        -- Load Immediately oper1 into oper2 register
        elseif opcode == "LDIM" then 
            Codelist[codeLen] = "LDB " .. tostring(oper1)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper2-1))
            codeLen=codeLen+1
        -- Adds registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "ADD" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(3)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
        -- Subtracts registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "SUB" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(4)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
        -- Bitwise XOR's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "XOR" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(8)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
        -- Bitwise AND's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "AND" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(7)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
        -- Bitwise OR's registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "OR" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(9)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
        -- Builds an instruction using registers oper1 and oper 2 together and writes the value to register oper 3
        elseif opcode == "BULD" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(9)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "RWR " .. tostring(2^(oper3-1))
            codeLen=codeLen+1
         -- Writes register oper 1 to oper 2 in memory
        elseif opcode == "WRI" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(9)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "WRI " .. tostring(oper2)
            codeLen=codeLen+1
         -- always jump to oper 1 
        elseif opcode == "JMPA" then 

            Codelist[codeLen] = "SJMP " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper1)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 is equal to register oper 2, to oper 3
        elseif opcode == "JMPEQ" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 if not equal to register oper 2, to oper 3
        elseif opcode == "JMPNEQ" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(4)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 is greater than register oper 2, to oper 3
        elseif opcode == "JMPGT" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(8)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 is lesser register oper 2, to oper 3
        elseif opcode == "JMPLS" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(16)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 is equal or greater than register oper 2, to oper 3
        elseif opcode == "JMPEQGT" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(32)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- Jumps IF register oper 1 is equal or lesser than register oper 2, to oper 3
        elseif opcode == "JMPEQLS" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(1)
            codeLen=codeLen+1
            Codelist[codeLen] = "CRP " .. tostring(oper2+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "ARW " .. tostring(2)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(64)
            codeLen=codeLen+1
            Codelist[codeLen] = "LDB " .. tostring(codeLenList[tonumber(oper3)])
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- takes register oper 1 as a pointer to somewhere in memory to execute
        elseif opcode == "EXEC" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(6)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "SJMP " .. tostring(128)
            codeLen=codeLen+1
            Codelist[codeLen] = "JMP " .. tostring(0)
            codeLen=codeLen+1
         -- takes register oper 1 and outputs it to oper 2 
        elseif opcode == "COUT" then 
            Codelist[codeLen] = "CRP " .. tostring(oper1+1)
            codeLen=codeLen+1
            Codelist[codeLen] = "INV " .. tostring(6)
            codeLen=codeLen+1
            Codelist[codeLen] = "DO " .. tostring(0)
            codeLen=codeLen+1
            Codelist[codeLen] = "REV " .. tostring(2^(oper2-1))
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