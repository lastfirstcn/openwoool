
local attr = {
	Item_Field_QualityLevel, --Ʒ��  BYTE
	Item_Field_StrengthLevel, -- ǿ���ȼ�	BYTE
	Item_Field_StrengthXp, -- ǿ������	int
	Item_Field_StarLevel, -- �Ǽ�	BYTE
	Item_Field_Bind, -- �Ƿ��	bool
}

local ret = {}
for i, v in ipairs(attr) do
	ret[v] = i
end

return ret
