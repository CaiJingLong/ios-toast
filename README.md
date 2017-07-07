# ios-toast-swift

swift 3.1语法

    如果想支持其他的语法请自己修改
    这里主要是模仿android端的提示方案


## 食用方法:
1. clone 项目
2. 将source下的方法copy到源码内,如果有文件重名请自己改名
3. ```toast("提示语句")```
4. ```toast("提示内容",3) //内容 时长```

## 源码分析
    都是伪代码

### 代码分布
    ToastView:自定义view相关的代码,基本没啥东西,就是加载了xib文件
    Toast:帮助类,其中定义了如何附着到window中,位置,根据文字计算文字大小,渐隐动画等相关内容

### 提示
这里对于项目没有太多的侵入性
总体原理大概就是创建一个view,将view附着到前台window中
这里有一点,这里的toast会覆盖掉软键盘

### 如果想要修改view的样式,可以自己修改ToastView.xib/ToastView.swift
    内容很简单,就在ToastView中
    可以自定义内容,更加丰富多彩,也可以基于扩展
    content 是一个UILabel,用于显示内容

### 想要修改提示位置
    Toast.swift 的 57~60行

### 想要修改大小
    Toast.swift的35~50行左右

### 动画效果
    Toast.swift的66~87行

### License/开源协议
    Copyright 2017 JingLong Cai

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.