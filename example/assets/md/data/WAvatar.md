# 头像
## 图标头像
```widgets
avatarIcon1,avatarIcon1c,avatarIcon2q,avatarIcon2
```
## 图片头像
> 下面的例子，不同的 `  fit `下的效果是不一样的。
当图片是高>宽时，` cover `与` fitWidth `看上去差异不大。
当图片是宽>高时，` cover `与` fitHeight `看上去差异不大。
如果图片宽高比更好是1:1，那么几种 ` fit `值，除了 ` cover ` 取决于图片原尺寸与展示尺寸的比例会引起差异意外，其他的值效果均相差不大。

> 当比例不为 1:1 时，` cover `与` scaleDown `均会出现留白。
高>宽 时，` fitHeight ` 左右两边会出现留白
宽>高 时，` fitWidth ` 上下两遍会出现留白

### 圆形
#### 高>宽
```widget
avatarCircleHtw
```
#### 宽>高
```widget
avatarCircleWth
```
### 方型
#### 高>宽
```widget
avatarSquareHtw
```
#### 宽>高
```widget
avatarSquareWth
```
