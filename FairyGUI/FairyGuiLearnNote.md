#   1.富文本 

##     1.更改文本的对齐方式

​     

```c#
obj.GetChild("xxx").asRichTextField.align = AlignType.Right;

public enum AlignType
    {
        Left,
        Center,
        Right
    }
```

# 2.多语言

##   1.多语言解决方案

​    

```c#
TextAsset text = Resources.Load("Excels/xxx_Chinese") as TextAsset;
string content = text.text;//获取到文本内容
Debug.Log(content);
FairyGUI.Utils.XML xml = new FairyGUI.Utils.XML(content);
UIPackage.SetStringsSource(xml);
```

## 2.注意

  1.语言文件要在创建UI前载入，不支持实时切换语言文件。如果要在游戏中切换语言，那只能先销毁所有UI，卸载所有包。

# 3.当前界面引用了其它界面包里的资源时

 1.UIPackage.AddPackage("xx/xxx");

 2.加载UI包之后,图片可以正常显示

