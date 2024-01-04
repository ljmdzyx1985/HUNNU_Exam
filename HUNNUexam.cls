% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[2019/12/30] % 指定LaTeX格式和版本
\ProvidesClass{HUNNUexam}[2022/06/27 V1.0 Exam Paper for HUNNUer] % 提供文档类信息
\LoadClass[12pt,twocolumn,landscape,UTF8,twoside,fontset=windows]{ctexart}%% 载入 ctexart 文档类，设置12pt字体，双栏，横向页面布局，UTF8编码，双面打印，以及Windows字体集，Linux下编译，首先复制windows字体到Linux
%%* 所需宏包
\RequirePackage[paperwidth=36.8cm,paperheight=26cm,top=2cm,bottom=2cm,right=2cm,left=3cm,columnsep=1.5cm]{geometry}%8开纸张的大小,分栏间隔
\RequirePackage{bbding} % 提供特殊符号和图标
\RequirePackage{amsmath} % 数学公式宏包
\RequirePackage{amsfonts} % 数学字体宏包
\RequirePackage{amssymb} % 数学符号宏包
\RequirePackage{wasysym} % 提供更多的特殊符号
\RequirePackage{makeidx} % 创建索引宏包
\RequirePackage{graphicx} % 图片插入宏包
\RequirePackage{setspace} % 设置行距宏包
\RequirePackage{paralist} % 提供紧凑的列表环境
\RequirePackage{lastpage} % 获取文档中最后一页的页码
\RequirePackage{enumerate} % 枚举列表宏包
\RequirePackage{fancyhdr} % 自定义页眉页脚宏包
\RequirePackage{tikz} % 绘图宏包
\RequirePackage{xeCJK} % 提供中日韩文字处理宏包
\RequirePackage{zhnumber} % 提供中文数字宏包
\RequirePackage{indentfirst} % 首行缩进宏包
\RequirePackage{xhfill} % 提供水平填充宏包
\RequirePackage{color} % 提供颜色支持宏包
\RequirePackage{etoolbox} % 提供工具宏包
\RequirePackage{expl3} % LaTeX3编程语言宏包
\RequirePackage{multirow} % 提供多行单元格合并宏包
\RequirePackage{tabularx} % 提供更强大的表格宏包
\RequirePackage{tabu} % 提供更丰富的表格功能宏包
\RequirePackage{diagbox} % 绘制斜线表头的宏包
\RequirePackage{ltxcmds} % 提供更多命令宏包
\RequirePackage{calc} % 提供数学计算宏包
\RequirePackage{fancyhdr} % 自定义页眉页脚宏包
\RequirePackage{subfigure} % 提供子图宏包
\RequirePackage{refcount} % 提供引用计数宏包
\RequirePackage{wrapfig} % 提供图文绕排宏包
\RequirePackage{ulem} % 强调文本宏包
\RequirePackage{ifthen} % 判断条件宏包
\RequirePackage{lastpage} % 获取文档中最后一页的页码
\RequirePackage{CJKfntef} % 在CJK（中文、日文、韩文）环境中处理字体样式的宏包，如下划线、删除线等
%%* 试卷格式设置
\newboolean{printanswers} % 是否打印答案的布尔变量
\newboolean{twopagenum} % 是否打印一页两页码的布尔变量

%%*中英文字体设置
\setCJKfamilyfont{zhsong}[AutoFakeBold={2.17}]{SimSun} % 设置宋体字体，并允许字体伪粗体
% \newcommand*{\songti}{\CJKfamily{zhsong}} % 创建宋体字的命令
\setlength{\headheight}{20pt} % 设置页面的页眉高度
\setlength{\baselineskip}{24pt}% 设置基本行间距
\setmainfont{Times New Roman} % 设置西文主要字体为Times New Roman
\setsansfont{Arial} % 设置西文字体为Arial

%%* 大题题号计数器
\newcounter{dati} % 设计一个自己的计数器，名字叫 dati
\setcounter{dati}{0} % 计数器初始赋值为零

%%* 总分分数计数器
\newcounter{sumofparts} % 总分计数器，名字叫 sumofparts
\setcounter{sumofparts}{0} % 赋初值为零

% 设置有无分隔线
% \columnseprule=0.4pt % 试卷分隔线的宽度

%%* 定义试卷题头
\newcommand{\examtitle}[7]{ % 定义一个新命令，名为 `\examtitle`，接受7个参数
    \noindent % 开始一个段落并禁止首行缩进
    \pagenumstyle % 应用页码样式，具体定义在其他部分
    \begin{spacing}{1.5} % 开始一个1.5倍行间距的环境
        \begin{center} % 开始一个居中环境
            % 根据 `printanswers` 布尔变量判断是否打印答案版
            \ifthenelse{\boolean{printanswers}}{ % 如果打印答案
                % 设置字体为黑体，字号为小三，并输入相关信息
                \heiti\zihao{-3}
                湖南师范大学 {\courseyear} 学年第 {\courseterm} 学期 {\specialty} {\grade} 级 \heiti\zihao{5} 期末/补考/重修 \heiti\zihao{-3} 课程 \\
                % 使用下划线强调课程名称，并展示标准答案及评分细则
                \uline{\coursename} 考核试题标准答案及评分细则
                \newline % 插入换行
                % 插入一些课程详细信息
                \vspace{2mm} % 在上一行和下一行之间插入2mm的垂直空间
                \zihao{-4} \songti % 设置字体为宋体，字号为小四，并加粗显示课程代码等信息
                \bf{课程代码：{\coursecode} 考核方式：{\exammode} 考试时量：{\examtime} 分钟 试卷类型：{\examtype}}
            }{ % 否则，如果不打印答案
                % 设置字体为黑体，字号为小三，并输入相关信息
                \heiti\zihao{-3}
                湖南师范大学工程与设计学院\\
                {\courseyear} 学年第 {\courseterm} 学期 {\specialty} {\grade} 级 \\
                % 显示课程名称和考试类型
                《{\coursename}》课程期末/补考/重修考试试题
                \newline % 插入换行
                % 在上一行和下一行之间插入2mm的垂直空间
                \vspace{2mm}
                \zihao{-4} \songti % 设置字体为宋体，字号为小四，并显示课程代码等信息
                课程代码：{\coursecode} 考核方式：{\exammode} 考试时量：{\examtime} 分钟 试卷类型：{\examtype}
                \examscoretable{#1}{#2}{#3}{#4}{#5}{#6}{#7} % 调用 `\examscoretable` 命令插入总分表
                \examothertable % 调用 `\examothertable` 命令放置诚信考试框和教务办填写框
            }
        \end{center} % 结束居中环境
    \end{spacing} % 结束1.5倍行间距环境
    \vspace{-25pt} % 将后续内容向上推进25pt
    \zihao{-4} \songti % 设置后续内容的字体为宋体，字号为小四
    \singlespacing % 设置后续内容的行间距为单倍行距
}
%%! 用于创建试卷的总计分表头，它将收集的各个部分的分数累加起来以计算总分
%%* 定义总计分表头
\newcommand{\examscoretable}[7]{ % 定义一个新命令 \examscoretable，接受七个参数代表七个题目的分数
    % 下面七行代码将每个题目的分数累加到计数器 sumofparts 中，用于计算总分
    \addtocounter{sumofparts}{#1} % 将第一个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#2} % 将第二个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#3} % 将第三个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#4} % 将第四个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#5} % 将第五个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#6} % 将第六个参数的值加到 sumofparts 计数器
    \addtocounter{sumofparts}{#7} % 将第七个参数的值加到 sumofparts 计数器
    
    \begin{table}[h] % 创建一个浮动表格环境，[h] 位置参数表示尽可能在此处放置
        \zihao{-4} \songti % 设置表格内文字为小四号宋体
        \centering % 表格内容居中
        \setlength{\tabcolsep}{2.8mm} % 设置表格列之间的间距
        \renewcommand\arraystretch{1.5} % 将表格的行高设置为默认行高的1.5倍
        \begin{tabular}{*{11}{|c}|} % 开始一个有11列的表格环境，每一列都有垂直分割线
            \hline % 表格的横线
            % 表格表头
            题号 & 一 & 二 & 三 & 四 & 五 & 六 & 七 & 总分 & 合分人 & 复查人 \\
            \hline % 表格的横线
            % 表格第二行，展示每个部分应得的分数，如果参数值大于0则显示
            应得分 & \ifnum#1>0 #1\fi & \ifnum#2>0 #2\fi & \ifnum#3>0 #3\fi & \ifnum#4>0 #4\fi & \ifnum#5>0 #5\fi & \ifnum#6>0 #6\fi & \ifnum#7>0 #7\fi & \arabic{sumofparts} & & \\
            \hline % 表格的横线
            % 表格第三行，预留空格用于填写实际得分
            实得分 & & & & & & & & & & \\
            \hline % 表格的横线
        \end{tabular}
    \end{table} % 结束表格环境
}
%%! 定义了一个命令 \makepart，用于创建常见类型的题目及其评分表头。
%%! 命令会根据是否需要打印答案（由布尔变量 printanswers 决定）来显示不同的内容。
%%! 如果打印答案，仅显示题目信息；否则，还会显示评分表格供考试评分人员填写。
%%* 定义常用命题计分表头
\newcommand{\makepart}[3]{ % 定义一个新命令，名为 \makepart，这个命令将接收三个参数
    \stepcounter{dati} % 大题计数器增加，每使用一次这个命令，对应的计数器值增加1
    % 判断是否打印答案，根据打印答案与否，显示不同的内容
    \ifthenelse{\boolean{printanswers}}{
        % 如果打印答案，则不用插入得分表，而是直接显示题目相关信息
        \noindent % 不缩进
        % 设置字体大小为小四号，字体为宋体，并加粗（题目序号和描述）
        \textbf{\zihao{-4}\songti\zhnum{dati}、#1（每题~#2~分，共~#3~分）}
    }{
        % 如果不打印答案，需显示得分表供评分使用
        \noindent % 不缩进
        \hspace{-0.1cm} % 微调水平间距，轻微向左移动
        % 定义一个宽度为页面宽度一半的盒子，用于插入得分表格
        \begin{minipage}{0.475\textwidth}
            % 使用 wrapfigure 环境包裹得分表，使其与紧随其后的文本呈现绕排效果
            \begin{wrapfigure}[3]{l}{3.75cm} % wrapfigure 参数设定为3行高，左对齐，宽度3.75cm
                \vspace{-16pt} % 调整垂直间距
                \setlength{\tabcolsep}{2.8mm} % 设置表格单元格之间的距离
                \renewcommand\arraystretch{1.1} % 调整表格行间距
                % 创建得分表格
                \begin{tabular}{|c|c|c|}
                    \hline % 表格顶部横线
					\raisebox{-4pt}{得分} & \raisebox{-4pt}{评卷人} & \raisebox{-4pt}{复查人} \\[2mm] % 表头
                    \hline % 表格中间横线
                    & & \\[2mm] % 空行供填写信息
                    \hline % 表格底部横线
                \end{tabular}
            \end{wrapfigure}
            % 显示题目信息（题目序号和描述），并显示每题的分数和该部分总分
            \textbf{\zihao{-4}\songti\zhnum{dati}、#1（每题~#2~分，共~#3~分）}
        \end{minipage}\\\\ % 结束盒子，并添加必要的换行以便于后续内容的正确排版
    }
}
%%! 定义了一个 \makeparttk 命令用于填空题的题目和分数表头的创建。当不需要打印含有答案的版本时，除了题目信息外，此命令还会创建一个得分表格用于记录评卷人和复查人的信息。
%%* 定义填空题命题计分表头
\newcommand{\makeparttk}[3]{ % 定义一个新命令 \makeparttk，接受三个参数
    \stepcounter{dati} % 大题计数器加一，用于自动编号大题
    % 根据是否打印答案，显示不同的内容
    \ifthenelse{\boolean{printanswers}}{
        % 如果打印答案，显示题目标题和得分信息，不包括得分表
        \noindent % 不缩进
        % 设置标题为加粗、小四号宋体字，并标出题目序号和各空得分情况
        \textbf{\zihao{-4}\songti\zhnum{dati}、#1（每空~#2~分，共~#3~分）}
    }{
        % 如果不打印答案，则需要显示得分表
        \noindent % 不缩进
        \hspace{-0.1cm} % 向左微调一点空间
        % 定义一个宽度为文本宽度一半的盒子，用于放置得分表
        \begin{minipage}{0.475\textwidth}
            % 使用 wrapfigure 环境使得分表能够和文本绕排
            \begin{wrapfigure}{l}{3.8cm} % 设置得分表的宽度
                \vspace{-16pt} % 调整表格和文字的垂直间距
                \centering % 表格居中
                \setlength{\tabcolsep}{2.8mm} % 设置单元格之间的距离
                \renewcommand\arraystretch{1.1} % 调整行高
                % 创建得分表表格
                \begin{tabular}{|c|c|c|}
                    \hline
					\raisebox{-4pt}{得分} & \raisebox{-4pt}{评卷人} & \raisebox{-4pt}{复查人} \\[2mm] % 表头
                    \hline
                    & & \\[2mm] % 空行
                    \hline
                \end{tabular}
            \end{wrapfigure}
            % 显示题目标题和得分信息，设置为加粗、小四号宋体字
            \textbf{\zihao{-4}\songti\zhnum{dati}、#1（每空~#2~分，共~#3~分）}
        \end{minipage}\\\\ % 结束盒子，添加必要的换行
    }
}
%%! 定义了一个 \makepartdx 命令，专门用于单选题的题目和分数表头的设置。
%%! 此命令会根据是否需要打印答案的选项来调整显示的内容，当需要评分表时，会创建一个得分表格用于记录评分和复查的信息，并在表格旁边显示单选题的题目和答题说明。

%%* 定义单选题命题计分表头
\newcommand{\makepartdx}[3]{ % 定义一个新命令 \makepartdx，此命令接受三个参数
    \stepcounter{dati} % 大题计数器增加，用于自动编号大题
    % 根据是否打印答案的布尔变量printanswers的值，决定显示内容
    \ifthenelse{\boolean{printanswers}}{
        % 如果打印答案，则显示题目信息，包括题干和每题分数
        \noindent % 不缩进
        % 设置题目信息为加粗、小四号宋体字，并添加题目说明
        \textbf{\zihao{-4}\songti\zhnum{dati}、#1（在本题的每一小题的备选答案中，只有一个答案是正确的，请把你认为正确答案的题号，填入题干的括号内。多选不给分。每题~#2~分，共~#3~分）}
    }{
        % 如果不打印答案，显示得分表和题目信息
        \noindent % 不缩进
        \hspace{-0.1cm} % 向左微调一点空间
        % 定义一个宽度为文本宽度一半的盒子，用于放置得分表
        \begin{minipage}{0.475\textwidth}
            % 设置得分表的绕排环境
            \begin{wrapfigure}{l}{3.8cm} % 设置得分表的宽度
                \vspace{-16pt} % 调整表格和周围文本的垂直间距
                \centering % 表格居中显示
                \setlength{\tabcolsep}{2.8mm} % 设置单元格之间的距离
                \renewcommand\arraystretch{1.1} % 调整行高
                % 创建得分表格
                \begin{tabular}{|c|c|c|}
                    \hline
					\raisebox{-4pt}{得分} & \raisebox{-4pt}{评卷人} & \raisebox{-4pt}{复查人} \\[2mm] % 表头
                    \hline
                    & & \\[2mm] % 空行
                    \hline
                \end{tabular}
            \end{wrapfigure}
            % 显示单选题题目信息，包括答题说明和分值情况
            \textbf{\zihao{-4}\songti\zhnum{dati}、#1（在本题的每一小题的备选答案中，只有一个答案是正确的，请把你认为正确答案的题号，填入题干的括号内。多选不给分。每题~#2~分，共~#3~分）}
        \end{minipage}\\\\ % 结束盒子，添加必要的换行以便于后续内容的正确排版
    }
}
%%! 定义了一个 \makepartnoteq 命令，用于不常用题型的题目和分数表头的设置。
%%! 此命令会根据是否需要打印答案的选项来调整显示的内容，当需要评分表时，会创建一个得分表格用于记录评分和复查的信息，并在表格旁边显示该题型的题目描述和分值情况。
%%* 定义不常用命题题头
\newcommand{\makepartnoteq}[3]{ % 定义一个新命令 \makepartnoteq，此命令接受三个参数
    \stepcounter{dati} % 大题计数器增加，用于自动编号大题
    % 根据是否打印答案的布尔变量printanswers的值，决定显示内容
    \ifthenelse{\boolean{printanswers}}{
        % 如果打印答案，则显示题目信息，包括题干和总分数
        \noindent % 不缩进
        % 设置题目信息为加粗、小四号宋体字，并添加题目序号和总分情况
        \textbf{\zihao{-4}\songti\zhnum{dati}、#1（本大题共~#2~小题，共~#3~分）}
    }{
        % 如果不打印答案，显示得分表和题目信息
        \noindent % 不缩进
        \hspace{-0.1cm} % 向左微调一点空间
        % 定义一个宽度为文本宽度一半的盒子，用于放置得分表
        \begin{minipage}{0.475\textwidth}
            % 设置得分表的绕排环境
            \begin{wrapfigure}{l}{3.8cm} % 设置得分表的宽度
                \vspace{-16pt} % 调整表格和周围文本的垂直间距
                \centering % 表格居中显示
                \setlength{\tabcolsep}{2.8mm} % 设置单元格之间的距离
                \renewcommand\arraystretch{1.1} % 调整行高
                % 创建得分表格
                \begin{tabular}{|c|c|c|}
                    \hline
                    \raisebox{-4pt}{得分} & \raisebox{-4pt}{评卷人} & \raisebox{-4pt}{复查人} \\[2mm] % 表头
                    \hline
                    & & \\[2mm] % 空行
                    \hline
                \end{tabular}
            \end{wrapfigure}
            % 显示题目信息，包括题目序号和总分情况
            \textbf{\zihao{-4}\songti\zhnum{dati}、#1（本大题共~#2~小题，共~#3~分）}
        \end{minipage}\\\\ % 结束盒子，添加必要的换行以便于后续内容的正确排版
    }
}
%%! 定义了两个保存盒子 \zdxa 和 \zdxb 分别用于存放试卷的装订线部分的内容，正面和背面。
%%! 每个盒子中包含了一系列指令创建一个带有提示文字和两条由点组成的虚线的装订区域。
%%! 定义的 \zdxa，用来存放考试纸的正面装订线部分。然后使用 \parbox 创建了一个宽度为27cm的盒子，其内容包括学院、专业/班级、姓名、学号和座位号的填写栏目。
%%! 这些栏目使用了下划线命令 \uline 并结合 \makebox 来指定填写内容的对齐方式和宽度。
%%! 接下来，通过 \vspace 命令对装订线上下的空间进行微调，然后使用 \dotfill 创建了两条点状虚线，代表装订的位置，并在两条虚线之间添加了一行文字提示考生在装订线内不要答题。
%%! 这样设计是为了在打印考试试卷时，容易让考生看到和使用，同时也方便考试试卷的装订。
%%* 正面姓名栏+密封线
\newsavebox{\zdxa} % 定义一个新的保存盒子 \zdxa，用于存放装订线正面的内容
\sbox{\zdxa}{ % 将下面的内容保存到 \zdxa 盒子中
    \parbox{27cm}{ % 创建一个宽度为27cm的盒子来存放内容
        \centering % 内容居中
        \zihao{4} \songti % 设置字体大小为小四号宋体
        \hspace{1cm} % 在行首添加1cm的水平空间
        % 创建填写学院、专业/班级、姓名、学号、座位号的空行，使用下划线，并给予适当的长度和对齐方式
        学院：\uline{\makebox[28mm][c]{}} ~~~ 专业/班级：\uline{\makebox[28mm][c]{}} ~~~ 姓名：\uline{\makebox[28mm][c]{}} ~~~ 学号：\uline{\makebox[28mm][c]{}} ~~~ 座位号：\uline{\makebox[10mm][c]{}} \\
        \vspace{-1mm} % 在下一行之前减少1mm的垂直空间
        \zihao{5} \songti % 设置字体大小为五号宋体
        \dotfill\\ % 生成一行由点组成的虚线（装订线的上边界）
        \vspace{-1mm} % 再次减少1mm的垂直空间，以调整下面文字与装订线的位置关系
        % 提示文字，告诉使用者装订线内不要答题
        装~~~~~~~~订~~~~~~~~线~~~~~~~~内~~~~~~~~不~~~~~~~~要~~~~~~~~答~~~~~~~~题\\
        \vspace{-3mm} % 再减少3mm的垂直空间，以调整下面的装订线（虚线）的位置
        \dotfill % 生成另一行由点组成的虚线（装订线的下边界）
    }
}

%%* 背面装订线
\newsavebox{\zdxb} % 定义一个新的保存盒子 \zdxb，用于存放装订线背面的内容
\sbox{\zdxb}{ % 将下面的内容保存到 \zdxb 盒子中
    \parbox{27cm}{ % 创建一个宽度为27cm的盒子来存放内容
        \centering % 内容居中
        \zihao{5} \songti % 设置字体大小为五号宋体
        \dotfill\\ % 生成一行由点组成的虚线（装订线的上边界）
        \vspace{-1mm} % 在下一行之前减少1mm的垂直空间
        % 提示文字，告诉使用者装订线内不要答题
        装~~~~~~~~订~~~~~~~~线~~~~~~~~内~~~~~~~~不~~~~~~~~要~~~~~~~~答~~~~~~~~题\\
        \vspace{-3mm} % 再减少3mm的垂直空间，以调整下面虚线的位置
        \dotfill % 生成另一行由点组成的虚线（装订线的下边界）
    }
}
%%! 定义了两个命令 \putzdxa 和 \putzdxb 用于将之前定义的装订线内容放置在页面上的特定位置。
%%! 这些命令分别通过 \hspace 调整水平位置，通过 \rotatebox 将内容旋转90度以便垂直放置于页面边缘，模拟实际考试试卷上的装订线位置。
%%! 这样可以确保在打印出来的试卷上，学生不会在装订线内答题，从而避免在试卷装订过程中答案被遮挡。
%%* 设置正面密封线的摆放位置
\newcommand{\putzdxa}{ % 定义一个新命令 \putzdxa，用于放置正面密封线
    \hspace{-20mm} % 向左移动20mm，以调整密封线的水平位置
    \parbox{1cm}{ % 创建一个宽度为1cm的盒子来存放密封线
        \rotatebox[origin=c]{90}{\usebox{\zdxa}} % 将 \zdxa 盒子中的内容旋转90度并显示
    }
}

%%* 设置背面密封线的摆放位置
\newcommand{\putzdxb}{ % 定义一个新命令 \putzdxb，用于放置背面密封线
    \hspace{4mm} % 向右移动4mm，以调整密封线的水平位置
    \parbox{1cm}{ % 创建一个宽度为1cm的盒子来存放密封线
        \rotatebox[origin=c]{-90}{\usebox{\zdxb}} % 将 \zdxb 盒子中的内容旋转-90度并显示
    }
}

%%* 不同页码输出格式
\newcommand{\pagenumstyle}{ % 定义一个用来配置页码样式的新命令
    % 判断是否是两页码模式
    \ifthenelse{\boolean{twopagenum}}{%
        % 如果是双页码模式
        \pagestyle{fancy} % 使用fancy风格的页码
        \renewcommand{\headrulewidth}{0pt} % 将页眉横线的宽度设置为0pt, 即去除页眉横线
        % 设置页脚，以特定格式显示总页数和当前页数
        \fancyfoot[CO,CE]{ % 在奇数页中间(CO)和偶数页中间(CE)放置页脚
            共~\the\numexpr2*\getpagerefnumber{LastPage}\relax~页~~~~ % 计算并显示总页数
            第~\the\numexpr2*\value{page}-1\relax~页~~ % 显示当前页码（左侧）
            \hspace*{.4\linewidth} % 在左侧页码和右侧页码之间添加空间
            共~\the\numexpr2*\getpagerefnumber{LastPage}\relax~页~~~~ % 再次显示总页数
            第~\the\numexpr2*\value{page}\relax~页 % 显示当前页码（右侧）
        }
        % 判断是否处于打印答案模式
        \ifthenelse{\boolean{printanswers}}{%
            % 如果处于打印答案模式，不需要执行任何特殊操作
        }{
            % 如果不是打印答案模式，在奇数页和偶数页的页眉放置密封线
            \fancyhead[RE]{% 在奇数页的右侧页眉(RE)位置放置密封线
                \leavevmode\vbox to0pt{\vss\rlap{\putzdxb}\vskip -26cm} % 位置调整为-26cm
            }
            \fancyhead[LO]{% 在偶数页的左侧页眉(LO)位置放置密封线
                \leavevmode\vbox to0pt{\vss\rlap{\putzdxa}\vskip -26cm} % 位置调整为-26cm
            }
        }
    }{%
        % 如果不是双页码模式
        \pagestyle{fancy} % 使用fancy风格的页码
        \renewcommand{\headrulewidth}{0pt} % 去除页眉的横线
        % 设置页脚，显示总页数和当前页数
        \fancyfoot[CO,CE]{ % 在奇数页和偶数页的中间位置放置页脚
            第~\thepage~页~~共~\pageref{LastPage}~页 % 显示当前页和总页数
        }
        % 判断是否处于打印答案模式
        \ifthenelse{\boolean{printanswers}}{%
            % 如果处于打印答案模式，不需要执行任何特殊操作
        }{
            % 如果不是打印答案模式，在奇数页和偶数页的页眉放置密封线
            \fancyhead[RE]{% 在奇数页的右侧页眉(RE)位置放置密封线
                \leavevmode\vbox to0pt{\vss\rlap{\putzdxb}\vskip -26cm} % 位置调整为-26cm
            }
            \fancyhead[LO]{% 在偶数页的左侧页眉(LO)位置放置密封线
                \leavevmode\vbox to0pt{\vss\rlap{\putzdxa}\vskip -26cm} % 位置调整为-26cm
            }
        }
    }
}

%%* 诚信考试框
\newsavebox{\cxks} % 创建一个新的盒子用于存储诚信考试框的内容
\sbox{\cxks}{ % 将盒子内容设置为带有边框和粗体的提醒文本
    % 使用fbox生成带有边框的文本盒子
    \fbox{\textbf{\songti\zihao{-3} 诚信参考，考试舞弊将带来严重后果！}} % 用粗体宋体小三号字体强调诚信考试的重要性
}

%%* 教务办填写框
\newsavebox{\jwbk} % 创建一个新的盒子用于存储教务办填写框的内容
\sbox{\jwbk}{ % 设置盒子内容，提供教务办填写信息的表格
    \songti\zihao{-4} % 使用宋体小四号字体
    \renewcommand\arraystretch{0.8} % 设置表格的行高为默认行高的0.8倍
    % 创建一个表格用于填写
    \begin{tabular}{|c|} 
        \hline \raisebox{-4pt}{教务办填写} \\[2mm] % 表格第一行，用于提示
        \hline \raisebox{-4pt}{\uline{~~~~~~}年\uline{~~~~}月\uline{~~~~}日} \\[2mm] % 表格第二行，用于填写日期
        \hline \raisebox{-4pt}{考~~~~试~~~~用} \\[2mm] % 表格第三行，显示该表格用途
        \hline % 表格的最后一行
    \end{tabular}%
}

%%* 放置诚信和教务填写表格
\newcommand{\examothertable}{ % 定义一个新命令用于将诚信考试框和教务办填写框放置到文档顶部
    % 创建一个浮动体，使得表格总是出现在页面的顶部
    \begin{figure}[t]
        \centering % 将内容居中
        % 定义一个画布用于定位
        \begin{picture}(1,1)(230,0)
            \put(12,0){\rotatebox[origin=c]{0}{\usebox{\cxks}}} % 在画布上放置诚信考试框
            \put(340,-15){\rotatebox[origin=c]{0}{\usebox{\jwbk}}} % 在画布上放置教务办填写框
        \end{picture}
    \end{figure}
}

%%! 定义两个新的 LaTeX 命令 \tkhx 和 \tkkh，用于填空题的排版。
%%! 这两个命令允许用户根据填空题的答案长度来自动调整后续空白的长度。可选参数可以改变额外空白的默认长度。
%%! 这些命令在使用 printanswers 布尔选项时有用，根据是否打印答案来调整显示的内容，当打印答案时答案内容会显示，
%%! 不打印答案时则会显示与答案同宽的空白占位符。

%%*填空题用横线
% 新命令 \tkhx 用于创建带横线的填空题，其中横线的长度可以根据答案的长度动态调整
% 第一个可选参数(#1)：设置答案前后额外的空白长度，默认值为0.5cm
% 第二个必需参数(#2)：填空处的答案内容
\newcommand{\tkhx}[2][0.5]{ % 定义填空题命令，带有默认参数0.5cm
	\;\uline{ % 开始下划线，前面有一个小空格
		\mbox{\hspace*{#1 cm}} % 在答案前添加一定长度的空白，长度由第一个参数决定
		\ifthenelse{\boolean{printanswers}}{ % 如果printanswers为真，则打印答案
			#2 % 打印答案内容
		}{ % 否则
			\hphantom{#2} % 插入一个与答案内容同宽的空白占位符
		}
		\mbox{\hspace*{#1 cm}} % 在答案后添加一定长度的空白，长度由第一个参数决定
	} % 结束下划线
	% 使用 mbox 避免在更新 ulem 包之后出现错误
}

%%*填空题用括号
% 新命令 \tkkh 用于创建带括号的填空题，其中括号内的空间可以根据答案的长度动态调整
% 第一个可选参数(#1)：设置答案前后额外的空白长度，默认值为0.5cm
% 第二个必需参数(#2)：填空处的答案内容
\newcommand{\tkkh}[2][0.5]{ % 定义填空题命令，带有默认参数0.5cm
	\;(% 开始括号，前面有一个小空格
		\hspace*{#1 cm} % 在答案前添加一定长度的空白，长度由第一个参数决定
		\ifthenelse{\boolean{printanswers}}{ % 如果printanswers为真，则打印答案
			#2 % 打印答案内容
		}{ % 否则
			\hphantom{#2} % 插入一个与答案内容同宽的空白占位符
		}
		\hspace*{#1 cm} % 在答案后添加一定长度的空白，长度由第一个参数决定
	) % 结束括号
}

%%! \xx命令用于四个选项的情况，\xxiii用于三个选项，\xxv用于五个选项，而\xxvi用于六个选项。
%%! 每个命令首先测量每个选项的宽度，并将最宽的选项宽度保存为\lmax，然后根据\lmax与行宽（一半或四分之一）的比较结果来决定选项是各占一行还是排在同一行。

%%*选择题选项命令
%%\xx{}{}{}{} 四选项;
%%选项自动对齐；
% 创建新长度变量以存储选项的宽度值
\newlength{\la}
\newlength{\lb}
\newlength{\lc}
\newlength{\ld}
\newlength{\lee} % 用于五选项中的'E'选项
\newlength{\lf}  % 用于六选项中的'F'选项
\newlength{\lhalf}
\newlength{\lquarter}
\newlength{\lmax} % 用于存储最大选项宽度

% \xx 用于生成四个自动对齐的选择题选项
\newcommand{\xx}[4]{\\[.5pt] % 在选项前添加一个小间距
	% 测量并存储每个选项的宽度
	\settowidth{\la}{A、#1~~~}
	\settowidth{\lb}{B、#2~~~}
	\settowidth{\lc}{C、#3~~~}
	\settowidth{\ld}{D、#4~~~}
	% 比较宽度并存储最大值到 \lmax
	\ifthenelse{\lengthtest{\la > \lb}}
	{\setlength{\lmax}{\la}}{\setlength{\lmax}{\lb}}
	\ifthenelse{\lengthtest{\lmax < \lc}}{\setlength{\lmax}{\lc}}{}
	\ifthenelse{\lengthtest{\lmax < \ld}}{\setlength{\lmax}{\ld}}{}
	% 设置半行宽和四分之一行宽的长度变量，用于后续的排版
	\setlength{\lhalf}{0.5\linewidth}
	\setlength{\lquarter}{0.25\linewidth}
	% 根据最大宽度决定选项的排版方式
	\ifthenelse{\lengthtest{\lmax > \lhalf}}
	{ % 如果最大宽度大于半行宽，每个选项单独一行
		\noindent{}A、#1 \\ B、#2 \\ C、#3 \\ D、#4 
	}  
	{ % 如果最大宽度不超过半行宽
		\ifthenelse{\lengthtest{\lmax > \lquarter}}
		{ % 如果最大宽度大于四分之一行宽，每两个选项排在一行
			\noindent
			\makebox[\lhalf][l]{A、#1~~~}% 
			\makebox[\lhalf][l]{B、#2~~~}\\%
			\makebox[\lhalf][l]{C、#3~~~}%
			\makebox[\lhalf][l]{D、#4~~~}
		} 
		{ % 如果最大宽度小于或等于四分之一行宽，四个选项排在一行
			\noindent\makebox[\lquarter][l]{A、#1~~~}% 
			\makebox[\lquarter][l]{B、#2~~~}%     
			\makebox[\lquarter][l]{C、#3~~~}%      
			\makebox[\lquarter][l]{D、#4~~~}
		}
	}
}

%%*\xxiii{}{}{} 三选项;
% \xxiii 用于生成三个自动对齐的选择题选项
\newcommand{\xxiii}[3]{\\[.5pt] % 在选项前添加一个小间距
	% 测量并存储每个选项的宽度
	\settowidth{\la}{A、#1~~~}
	\settowidth{\lb}{B、#2~~~}
	\settowidth{\lc}{C、#3~~~}
	% 比较宽度并存储最大值到 \lmax
	\ifthenelse{\lengthtest{\la > \lb}}
	{\setlength{\lmax}{\la}}{\setlength{\lmax}{\lb}}
	\ifthenelse{\lengthtest{\lmax < \lc}}{\setlength{\lmax}{\lc}}{}
	% 根据最大宽度决定选项的排版方式
	\ifthenelse{\lengthtest{\lmax > \lhalf}}
	{ % 如果最大宽度大于半行宽，每个选项单独一行
		\noindent{}A、#1 \\ B、#2 \\ C、#3 
	}  
	{ % 如果最大宽度不超过半行宽
		\ifthenelse{\lengthtest{\lmax > \lquarter}}
		{ % 如果最大宽度大于四分之一行宽，每两个选项排在一行
			\noindent
			\makebox[\lhalf][l]{A、#1~~~}% 
			\makebox[\lhalf][l]{B、#2~~~}\\%
			\makebox[\lhalf][l]{C、#3~~~}
		} 
		{ % 如果最大宽度小于或等于四分之一行宽，三个选项排在一行
			\noindent
			\makebox[\lquarter][l]{A、#1~~~}% 
			\makebox[\lquarter][l]{B、#2~~~}%     
			\makebox[\lquarter][l]{C、#3~~~}
		}
	}
}

%%*\xxv{}{}{}{}{} 五选项;
% \xxv 用于生成五个自动对齐的选择题选项
\newcommand{\xxv}[5]{\\[.5pt] % 在选项前添加一个小间距
	% 测量并存储每个选项的宽度
	\settowidth{\la}{A、#1~~~}
	\settowidth{\lb}{B、#2~~~}
	\settowidth{\lc}{C、#3~~~}
	\settowidth{\ld}{D、#4~~~}
	\settowidth{\lee}{E、#5~~~}
	% 比较宽度并存储最大值到 \lmax
	\ifthenelse{\lengthtest{\la > \lb}}
	{\setlength{\lmax}{\la}}{\setlength{\lmax}{\lb}}
	\ifthenelse{\lengthtest{\lmax < \lc}}{\setlength{\lmax}{\lc}}{}
	\ifthenelse{\lengthtest{\lmax < \ld}}{\setlength{\lmax}{\ld}}{}
	\ifthenelse{\lengthtest{\lmax < \lee}}{\setlength{\lmax}{\lee}}{}
	% 根据最大宽度决定选项的排版方式
	\ifthenelse{\lengthtest{\lmax > \lhalf}}
	{ % 如果最大宽度大于半行宽，每个选项单独一行
		\noindent{}A、#1 \\ B、#2 \\ C、#3 \\ D、#4 \\ E、#5
	}  
	{ % 如果最大宽度不超过半行宽
		\ifthenelse{\lengthtest{\lmax > \lquarter}}
		{ % 如果最大宽度大于四分之一行宽，每两个选项排在一行
			\noindent
			\makebox[\lhalf][l]{A、#1~~~}% 
			\makebox[\lhalf][l]{B、#2~~~}\\%
			\makebox[\lhalf][l]{C、#3~~~}%
			\makebox[\lhalf][l]{D、#4~~~}\\%
			\makebox[\lhalf][l]{E、#5~~~}
		} 
		{ % 如果最大宽度小于或等于四分之一行宽，五个选项排在一到两行
			\noindent
			\makebox[\lquarter][l]{A、#1~~~}% 
			\makebox[\lquarter][l]{B、#2~~~}%     
			\makebox[\lquarter][l]{C、#3~~~}%
			\makebox[\lquarter][l]{D、#4~~~}\\%
			\makebox[\lquarter][l]{E、#5~~~}
		}
	}
}

%%*\xxvi{}{}{}{}{}{} 六选项;
% \xxvi 用于生成六个自动对齐的选择题选项
\newcommand{\xxvi}[6]{\\[.5pt] % 在选项前添加一个小间距
	% 测量并存储每个选项的宽度
	\settowidth{\la}{A、#1~~~}
	\settowidth{\lb}{B、#2~~~}
	\settowidth{\lc}{C、#3~~~}
	\settowidth{\ld}{D、#4~~~}
	\settowidth{\lee}{E、#5~~~}
	\settowidth{\lf}{F、#6~~~}
	% 比较宽度并存储最大值到 \lmax
	\ifthenelse{\lengthtest{\la > \lb}}
	{\setlength{\lmax}{\la}}{\setlength{\lmax}{\lb}}
	\ifthenelse{\lengthtest{\lmax < \lc}}{\setlength{\lmax}{\lc}}{}
	\ifthenelse{\lengthtest{\lmax < \ld}}{\setlength{\lmax}{\ld}}{}
	\ifthenelse{\lengthtest{\lmax < \lee}}{\setlength{\lmax}{\lee}}{}
	\ifthenelse{\lengthtest{\lmax < \lf}}{\setlength{\lmax}{\lf}}{}
	% 根据最大宽度决定选项的排版方式
	\ifthenelse{\lengthtest{\lmax > \lhalf}}
	{ % 如果最大宽度大于半行宽，每个选项单独一行
		\noindent{}A、#1 \\ B、#2 \\ C、#3 \\ D、#4 \\ E、#5 \\ F、#6
	}  
	{ % 如果最大宽度不超过半行宽
		\ifthenelse{\lengthtest{\lmax > \lquarter}}
		{ % 如果最大宽度大于四分之一行宽，每两个选项排在一行
			\noindent
			\makebox[\lhalf][l]{A、#1~~~}% 
			\makebox[\lhalf][l]{B、#2~~~}\\%
			\makebox[\lhalf][l]{C、#3~~~}%
			\makebox[\lhalf][l]{D、#4~~~}\\%
			\makebox[\lhalf][l]{E、#5~~~}%
			\makebox[\lhalf][l]{F、#6~~~}
		} 
		{ % 如果最大宽度小于或等于四分之一行宽，六个选项排在两行
			\noindent
			\makebox[\lquarter][l]{A、#1~~~}%
			\makebox[\lquarter][l]{B、#2~~~}%
			\makebox[\lquarter][l]{C、#3~~~}%
			\makebox[\lquarter][l]{D、#4~~~}\\%
			\makebox[\lquarter][l]{E、#5~~~}%
			\makebox[\lquarter][l]{F、#6~~~}
		}
	}
}

%%*判断题后面加括号
% 新命令 \pd 用于创建判断题的答案括号
% 第一个可选参数 #1: 设置答案括号的宽度，默认为1cm
% 第二个必需参数 #2: 判断题的答案（t 表示正确，即 $\surd$；任何其他值表示错误，即 $\times$）
\newcommand{\pd}[2][1]{ % 定义判断题答案位置的命令
	\nolinebreak\dotfill\mbox{\raisebox{-1.8pt} % 插入连续点线，提升点线避免与文本混淆
		{$\cdots$}(\makebox[#1 cm][c]{ % 创建一个盒子，其中内容居中，宽度为参数#1 cm
			\ifthenelse{\boolean{printanswers}} % 判断是否打印答案
			{
				\ifthenelse{\equal{#2}{t}}{$\surd$}{$\times$} % 如果答案是't'，则打印勾（正确），否则打印叉（错误）
			}
			{
				\hphantom{#2} % 如果不打印答案，插入一个对应答案宽度的空白盒子
			}
		})
	}
}

%%*计算题
% 新命令 \js 用于创建计算题的答案位置
% 第一个可选参数 #1: 设置答案部分的高度，默认为4cm
% 第二个必需参数 #2: 计算题的答案内容
\newcommand{\js}[2][4]{ % 定义计算题答案位置的命令
	\par % 新段落开始
	\begin{minipage}[t][#1cm][t]{\linewidth}{ % 用minipage环境创建一个固定高度的盒子，以容纳答案
			\ifthenelse{\boolean{printanswers}}{ % 判断是否打印答案
				\begin{spacing}{1.5} % 如果打印答案，则使用1.5倍行距
					解：\setlength\parindent{2.5em}#2 % 打印“解：”并插入答案，首行缩进2.5em
				\end{spacing}
			}
			{
				% 如果不打印答案，则不插入任何内容
			}
		}
	\end{minipage}
}

%%*简答题
% 新命令 \jd 用于创建简答题的答案位置
% 第一个可选参数 #1: 设置答案部分的高度，默认为4cm
% 第二个必需参数 #2: 简答题的答案内容
\newcommand{\jd}[2][4]{ % 定义简答题答案位置的命令
	\par % 新段落开始
	\begin{minipage}[t][#1cm][t]{\linewidth}{ % 用minipage环境创建一个固定高度的盒子，以容纳答案
			\ifthenelse{\boolean{printanswers}}{ % 判断是否打印答案
				\begin{spacing}{1.5} % 如果打印答案，则使用1.5倍行距
					答：\setlength\parindent{2.5em}#2 % 打印“答：”并插入答案，首行缩进2.5em
				\end{spacing}
			}
			{
				% 如果不打印答案，则不插入任何内容
			}
		}
	\end{minipage}
}

%%*步骤给分点
% 新命令 \bzgf 用于在打印答案时，为答题步骤提供分数点
% 参数 #1: 分数点的分值
\newcommand{\bzgf}[1]{ 
	\ifthenelse{\boolean{printanswers}} % 判断是否打印答案
	{
		\nolinebreak\dotfill\mbox{\raisebox{-1.8pt}{$\cdots$}(#1~分)} % 如果打印答案，插入连续点线并显示分数点
	}
	{
		% 如果不打印答案，则不插入任何内容
	}
}
