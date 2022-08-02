# 方法参数

[refrences](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/keywords/method-parameters)

1.[params](#1.params)指定此参数采用可变数量的参数。

2.[in](#2.in(参数修饰符))指定此参数由引用传递，但只由调用方法读取。

3.[ref](#3.ref)指定此参数由引用传递，可能由调用方法读取或写入。

4.[out](#4.out(参数修饰符))指定此参数由引用传递，由调用方法写入。



## 1.params

使用 `params` 关键字可以指定采用数目可变的参数的方法参数。 参数类型必须是一维数组。

在方法声明中的 `params` 关键字之后不允许有任何其他参数，并且在方法声明中只允许有一个 `params` 关键字。

使用 `params` 参数调用方法时，可以传入：

- 数组元素类型的参数的逗号分隔列表。
- 指定类型的参数的数组。
- 无参数。 如果未发送任何参数，则 `params` 列表的长度为零。

E:

```c#
public static void UseParams(params int[] list)
    {
        for (int i = 0; i < list.Length; i++)
        {
            Console.Write(list[i] + " ");
        }
        Console.WriteLine();
    }
```

## 2.in(参数修饰符)

## 3.ref

## 4.out(参数修饰符)