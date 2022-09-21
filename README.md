![](https://picture-czy.oss-cn-beijing.aliyuncs.com/img/202209202334685.png)

### 安装

```sh
git clone https://github.com/Colzry/SimpleVim.git
cd SimpleVim/
bash install.sh
```

### 卸载

```sh
cd ~/SimpleVim/
bash uninstall.sh
```

### 使用
```bash
<Leader> 为空格键

vv或者kj     退出插入模式
Ctrl+a		全选
U			光标向下移动5行=5j
E			光标向上移动5行=5k
=			查找模式时，下一个匹配值
-			查找模式时，上一个匹配值
<Leader>+1	   移动到行首
<Leader>+0	   移动到行尾
S			保存文件
Q    		退出vim编辑器
R			刷新vimrc文件
s]			水平向右分割窗口
s[        	水平向左分割窗口
sk			垂直向上分割窗口
sj			垂直向下分割窗口
<Leader>+h	   光标移动到左窗口
<Leader>+l	   光标移动到右窗口
<Leader>+j	   光标移动到下窗口
<Leader>+k	   光标移动到上窗口
<Leader>+↑	   光标所在窗口向上拉长
<Leader>+↓	   光标所在窗口向下拉长
<Leader>+←	   光标所在窗口向左拉长
<Leader>+→	   光标所在窗口向右拉长
<Leader>+w	   删除光标所在单词
<Leader>+u		向下翻半屏
<Leader>+d		向上翻半屏
<Leader>+n		打开文件树形结构列表
<Leader>+m		查看文件函数列表
{            光标向上移动一个代码块
}            光标向下移动一个代码块
di(          删除括号里的内容
di{          删除花括号里的内容
:e 文档名     进入vim后，不离开 vim 的情形下打开其他文档
:files 或 :buffers 或 :ls     可以列出目前 缓冲区 中的所有文档。加号 + 表示 缓冲区已经被修改过了。＃代表上一次编辑的文档，%是目前正在编辑中的文档
:b 文档名或编号      移至该文档
<Leader>+cc			注释当前行
<Leader>+cu			取消注释
```
