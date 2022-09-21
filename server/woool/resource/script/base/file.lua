--file.lua
--定义lua文件操作的方法

--下方彩蛋惊喜留给有缘人

--\u60ca\u559c\u4e0d\u3001\u610f\u5916\u4e0d\u0020\u5f88\u65e0\u8bed\u0020\u5bf9\u5427\u0020\u66f4\u591a\u8d44\u6e90\u4e0b\u8f7d\u0020\u609f\u7a7a\u6e90\u7801\u7f51\u0020\u0077\u0077\u0077\u002e\u0077\u006b\u0079\u006d\u0077\u002e\u0063\u006f\u006d

--打开文件：参数(文件名，打开模式)，返回文件句柄或nil
function openFile(filename,mode)
	local f = io.open(filename,mode)
	if f then
		return f
	else
		return nil
	end
end

--读取文件全部内容：参数(文件句柄)，返回一个string
function readAllFile(f)
	return f:read("*all")
end

--读取文件一行内容：参数(文件句柄)，返回一个string
function readLineFile(f)
	return f:read("*line")
end

--写文件内容：参数(文件句柄，字符串)
function writeFile(f,...)
	local arg = {...}
	f:write(unpack(arg))
end

--关闭文件,参数(文件句柄()
function closeFile(f)
	f:close()
end