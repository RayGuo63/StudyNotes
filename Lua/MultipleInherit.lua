-- 多重继承
local function search(k, plist)
    for key, value in pairs(plist) do
        local v = plist[key][k];
        if v then
            return v;
        end
    end
end

function CreateClass(...)
    local c = {};
    local parents = {...}

    -- Old 在父类列表中查找类缺失的方法
    -- setmetatable(c, {
    --     __index = function(t, k)
    --         return search(k, parents)
    --     end
    -- })

    -- New Old搜索具有一定的复杂性,性能不如单继承
    -- 改进的方法:将被继承的方法复制到子类中
    setmetatable(c, {
        __index = function(t, k)
            local v = search(k, parents);
            -- 保存下来用作下次访问
            -- 优点: 第一次读取时,没有该值则调用__index,
            -- 第二次读取时可以直接调用t[k]
            t[k] = v;
            return v;
        end
    })

    -- 将'c'作为其实例的元表
    c.__index = c;

    -- 为新类定义一个新的构造函数
    function c:new(o)
        o = o or {};
        setmetatable(o, c)
        return o
    end

    return c;
end

Account = {};

function Account:GetMoney()
    print(self.money)
end

NameClass = {};
function NameClass:GetName()
    return self.name;
end
function NameClass:SetName(n)
    self.name = n;
end

NameAccount = CreateClass(Account, NameClass);
aAccount = NameAccount:new{
    name = 'Ray'
}
print(aAccount:GetName()) -- Ray
print(aAccount:GetMoney()) -- nil

bAccount = NameAccount:new{
    money = 1000
};

print(aAccount:GetName()) -- nil
print(aAccount:GetMoney()) -- 1000

