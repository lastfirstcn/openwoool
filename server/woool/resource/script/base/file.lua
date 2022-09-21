--file.lua
--����lua�ļ������ķ���

--�·��ʵ���ϲ������Ե��

--\u60ca\u559c\u4e0d\u3001\u610f\u5916\u4e0d\u0020\u5f88\u65e0\u8bed\u0020\u5bf9\u5427\u0020\u66f4\u591a\u8d44\u6e90\u4e0b\u8f7d\u0020\u609f\u7a7a\u6e90\u7801\u7f51\u0020\u0077\u0077\u0077\u002e\u0077\u006b\u0079\u006d\u0077\u002e\u0063\u006f\u006d

--���ļ�������(�ļ�������ģʽ)�������ļ������nil
function openFile(filename,mode)
	local f = io.open(filename,mode)
	if f then
		return f
	else
		return nil
	end
end

--��ȡ�ļ�ȫ�����ݣ�����(�ļ����)������һ��string
function readAllFile(f)
	return f:read("*all")
end

--��ȡ�ļ�һ�����ݣ�����(�ļ����)������һ��string
function readLineFile(f)
	return f:read("*line")
end

--д�ļ����ݣ�����(�ļ�������ַ���)
function writeFile(f,...)
	local arg = {...}
	f:write(unpack(arg))
end

--�ر��ļ�,����(�ļ����()
function closeFile(f)
	f:close()
end