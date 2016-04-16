9  2作 者:红色激情
时 间:2007.5.18
原型:void XZout(char x, char y, char &str[], char mode);
功能:显示5*5所有可打印符号和字母。
说明:TextOut用法差不多。支持所有转意字符和换行符，str为要显示的字符串，x,y为要打印的屏幕坐标
 mode:
  bit6为1时直接在屏幕上显示。
  bit3为1时图形的所有点取反。
  bit2-0: 1:copy 2:not 3:or 4:and 5:xor

举例:
#include <XZout.y>

void main()
{
 ClearScreen();
 XZout(0, 0, "! \" $ % & ' ( ) * + , - . / 0", 1);
 XZout(0, 5, "1 2 3 4 5 6 7 8 9 : ; < = > ? A", 1);
 XZout(0, 10, "B C D E F G H I J K L M N O P Q ", 1);
 XZout(0, 15, "R S T U V W X Y Z [ \\ ] ^ _ a", 1);
 XZout(0, 20, "b c d e f g h i j k l m n o p r ", 1);
 XZout(0, 25, "s t u v w x y z { | } ~", 1);
 XZout(15, 33, "I love LAVA!(By icendragon)", 1);
 XZout(0, 40, "One day, I got an apple,\nBut I did'nt eat it.", 1);
 XZout(0, 50, "Because I love Lava!\nI will send it to Lava tomorrow!", 1);
 XZout(0, 60, "Tomorrow is tomorrow is ...\nSo, I eat it at once,", 1);
 XZout(0, 70, "and i was full.\nHIA HIA HIA HIA,it's great!", 1);
 Refresh();
 getchar();
} �!A  �    @@ @�   `痧``繾缾 @恅酄� @   @@ @  @P P   p    @  �   @   @�pPPp ` pp`pp0p `p p@0pp@ppp  pPpppPp @ @@ @�  @  p p   `  噜愢`愷愢饜鄍��p鄲愢饊囵饊鄝鄝梆悙饜p  pp 燻悹腊@@@p 鸢皭邪恅悙`饜饊`悹p饜馉p�p囵```悙恅悙``愋� 恅悙PP  � @餪@@`�@  `  ` P     p@   `惏P@`P` 0@00P0`饊p p ppp@`PP       `@P`P@@P  `饜 `PP  P `P`@0P0 P`@0@0` p 0 PP0 PP  愷` P PP0  p p 0`0     `0` P�     �> 㩳               XZout               �  �  �  5558 � 8 �  �58  489�   �   !65L
 89b   �  E 58 � 8 N  O '89�     "G !	  G !  F  G    !� � 8;,  ?