    这是我学LavaX以来编的第一个程序^_^，因为看不惯wqx内置的那个丑陋的课程表，又顺便是练练手，就编了这个程序，能一次在屏幕上显示一个星期所有上午或下午的课表，显示中可按F4修改任意格子里的内容，不怕大家的课数不一样了，没有课的留空好了。
    本程序还有成绩统计功能，能同时记录八次考试的分数，每次考试最多支持九个科目，没有九门的朋友就把多余的留空吧！
    详细说明在程序的各个界面按求助就能看见，这里就不多说了！我很懒滴^_^
    真为这么多高三了还努力编程的大哥感到感动，我明年才高三，唉，有点怕〜〜各位高三的大哥加油啊！！！

    程序用yan的编译器2.05编的，还用了祝嘉麒的ZFStudio.y模块和Input.y模块，对此向你们表示感谢！！还要感谢LavaX之父Lee！！！还要感谢我的父母，我的家人⋯⋯呜呜-_-|||

    希望能给大家派上点用场吧！支持我哦！初次露脸，有什么不足大家就提出来吧！

======================================更新日志===========================================
***ver 1.0  〖2月6日〗
1.程序初步完成，很有成就感啊！本来要发布的，但中午停电了-_-|||，我只有中午能上网，所以就没发⋯⋯

----------------------------------

***ver 1.1  〖2月8日〗
1.美化了主菜单界面，选择方块使用平滑移动方式。
2.美化了课程表出现方式，每天增加到最多八节课。
3.加入帮助信息。


----------------------------------

***ver 1.2   〖2月9日〗
1.修正了切换课程表动画时屏幕显示错误问题。（居然是因为我for(i=0;i<=80;i++){ClearScreen();WriteBlock(0,i,160,80,1,screen);Refresh();}导致的，我把“i<=80”的等号去掉就解决了，害我还一直以为是我哪里忘记清屏了，还到处加ClearScreen();-_-|||
2.存储数据由原来的退出程序时储存改为修改完毕后储存。

