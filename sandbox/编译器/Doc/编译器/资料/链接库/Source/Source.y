l  e原型:int OpenSource(char &sourcepath[]);
功能:打开资源文件。
说明:成功，返回一个该资源文件的文件句柄，无法打开或文件类型错误则返回0。sourcepath为全路径名。

原型:void CloseSource(char fp);
功能:关闭资源文件。
说明:参数为资源文件的文件句柄。

原型:int LoadData(char &buf[],long id,char fp);
功能:载入与id号关联的记录到buf所指的内存中。
说明:返回载入的长度，不存在该记录则返回0。
举例:
#include <Source.y>
char datfp;
char str[100];
void main()
{
 datfp = OpenSource("/LavaData/src.dat");//打开资源文件
 LoadData(str, 0, datfp);
 SetScreen(0);
 printf(str);
 getchar();
 CloseSource(datfp);
}   �> 㩳              OpenSource         	 �  r �5)89   ?
 	 �8 �  58
 yan �89E  	 � ?	 ? ?�>	 㩳               CloseSource         �?�>! 㩳              LoadData             �8  �8 �  58 �  F 58  1895   �   !K 5G E  �8  �8 	 /89    G !E  �8  ��8  �8   �8 ?;1  	 389$  �  F 58;1  �  E 58;�   ?