# Git

## 1.提示Git报错：Another git process seems to be running in this repository

解决方法：

```
git clean -f .git/index.lock
```



## 2.强行覆盖分支

```
git checkout develop
git reset --hard origin/master
git push -f
```



## 3.删除远程分支(master)

```
git push origin --delete master
```



## 4.切换用户名

```
git config --global user.name 'XX'
```

