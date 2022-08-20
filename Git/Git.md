# Git

## 1.提示Git报错：Another git process seems to be running in this repository

解决方法：

```
git clean -f .git/index.lock
```