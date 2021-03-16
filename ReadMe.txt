使用Latex制作的湖南师范大学考试试卷，使用8K纸张。

1、填空题：
\tkhx{} 填空画线，根据答案留大小，前后默认多留0.5cm；
\tkkh{} 填空括号，根据答案留大小，前后默认多留0.5cm；
\tkhx[1]{}答案前后多留1cm ；

2、选择题：
\xx{}{}{}{} 四选项；
\xxiii{}{}{} 三选项；
\xxv {}{}{}{}{} 五选项；
\xxvi{}{}{}{}{}{} 六选项；
选项自动对齐；

3、判断题：
在题后面加\pd{t}为对；
在题后面加\pd{f}为错；
判断默认括号间距为1cm；
\pd[2]{t}把间距改为2cm；
每道题后面加点，方便考生找位置；

4、简答：
\jd{}默认留4cm间距；
\jd[5]{}改为5cm间距；

5、是否显示答案：
文件头通过 printanswers确定；
\setboolean{printanswers}{true} 打印答案；
\setboolean{printanswers}{false} 不打印答案；

6、页码设置：
\setboolean{twopagenum}{true}一大页打印两个页码，每栏一个页码；
\setboolean{twopagenum}{false}一大页打印一个页码并居中显示；

7、装订线设置：
制定装订线，双面打印在相同的位置；

8、2021年03月13日新修订了一个版本，格式和内容进一步剥离，整体结构更加合理。

参考的模板是

https://www.latexstudio.net/archives/11328

https://www.latexstudio.net/archives/51758.html，

PS：
CTeX是包含了这个文件(picins.sty)的，但是TeXLive没有，需要手动安装。

Step 1
下载整个picins.zip，把解压出来的整个 picins 目录，拷贝到 texmf-dist/tex/latex 目录下。

或更准确的办法是把两个 .sty 文件放进 tex/latex/picins 目录，把 .dvi 和 .doc 文件放进 doc/latex/picins 目录，把剩下的文件放进 source/latex/picins 目录。以上参考它在 MiKTeX 中的目录树。

Step 2
win+R 输入 texhash 运行 texhash 刷新 Tex 文件数据库即可。
