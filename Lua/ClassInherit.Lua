Account = {
    money = 0
};

function Account:Check()
    print(self.money)
end

local mt = {
    __index = Account
}

--- 点声明New
---@param o table
function Account.new(o)
    o = o or {}
    setmetatable(o, mt)
    return o
end

a = Account.new();

-- !!!
-- Lua语言无法在表A中找到字段'Check'
-- 所以它会在元表的__index中搜索
-- 下列代码大致如下:
-- getmetatable(a).__index:Check();
a:Check(); -- 0
-- a的元表是mt,而mt.__index是Accout,因此,上述的表达式也等价于
-- Account.Check(a)

b = Account.new {
    money = 100
};

b:Check() -- 100

--- 冒号声明New
---@param o table
function Account:New(o)
    o = o or {};
    self.__index = self;
    setmetatable(o, self)
    return o;
end

-- 调用Account:New()时,隐藏参数self得到的实参是Account
-- Account.__index等于Account
c = Account:New();

c:Check(); -- 0

d = Account:New{
    money = 1000
}

d:Check();

-- 继承不仅可以用作方法,还可以作用于其它在新账户中没有的字段
-- 因此,一个类不仅可以提供方法,还可以为实例中的字段提供常量和默认值.
