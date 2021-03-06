^  W原型:int InitQueue(int s, int len, int es, long fullErrAdd, long nullErrAdd);
功能:初始化队列并设置相关队列环境。
说明:在内存地址为s，长度位len的空间里建立一个队列，成功则返回队列最大深度，否则返回-1。队列元素大小为es，fullErrAdd为队列溢出处理函数地址，其原型为:void fullErr();，nullErrAdd为队列空处理函数地址，其原型为:void nullErr();
注意:该函数可以对不同的地址建立队列，该函数隐含调用了SwitchQueue函数。

原型:int SwitchQueue(int s);
功能:切换当前队列环境。
说明:使得以下函数的操作都针对队列s。可以在内存中建立多个队列，通过该函数切换队列。

原型:int QueueFull();
功能:判断当前队列是否满。
说明:满则返回非0，否则返回0。

原型:int QueueEmpty();
功能:判断当前队列是否空。
说明:空则返回非0，否则返回0。

原型:int QueueDepth();
功能:获取当前队列深度。
说明:也就是当前队列里已有的元素个数。

原型:void GetHead(int e);
功能:获取当前队列队头的元素。
说明:e为要保存队头元素的地址，如果队列空则会调用nullErrAdd所指的函数。

原型:void EnQueue(int e);
功能:往当前队列队尾添加元素。
说明:e为元素地址，如果队列满则会调用fullErrAdd所指的函数。

原型:void DeQueue(int e);
功能:从当前队列弹出队头元素。
说明:e为保存元素的地址，如果队列空则会调用nullErrAdd所指的函数。

举例:
/* 银行业务模拟，统计指定一段时间内客户平均等待时间等 */
#include <adt/queue.y>

#define SIM_TIME  100    //simulation time
#define ARRIVAL_P  3277  //arrival probability 0.1 = 3277 / 32767
#define MIN_SERVICE_T 5  //min service time
#define MAX_SERVICE_T 15 //max service time

struct CUSTOMER
{
 int customerNum;
 int arrivalTime;
 int serviceTime;
};

struct CUSTOMER cur;

struct SIMDATA
{
 int queue;//队列指针
 struct CUSTOMER &activeCustomer;//指针
 int time;
 int numCustomers;
 int numServed;
 long totalWaitTime;
 long totalLineLength;
};

char traceFlag = 1;//是否跟踪？

/* 初始化 */
void InitSim(struct SIMDATA &simData, int queuebuf)
{
 simData.queue = queuebuf;
 &simData.activeCustomer = simData.numServed = simData.totalLineLength = 0;
}

/* 有顾客到达并排队 */
void EnQueueCustomer(struct SIMDATA &simData)
{
 struct CUSTOMER c;

 c.customerNum = ++simData.numCustomers;
 c.arrivalTime = simData.time;
 c.serviceTime = rand() % (MAX_SERVICE_T - MIN_SERVICE_T + 1) + MIN_SERVICE_T;
 EnQueue(&c);
 if (traceFlag)
 {
  printf("%d 分,顾客%d到达并排队\n", simData.time, c.customerNum);
  getchar();
 }
}

/* 有顾客到前台接受服务 */
void ServeCustomer(struct SIMDATA &simData)
{
 DeQueue(cur);
 &simData.activeCustomer = cur;
 simData.numServed++;
 simData.totalWaitTime = simData.totalWaitTime + simData.time - cur.arrivalTime;
 if (traceFlag)
 {
  printf("%d 分,顾客%d到前台服务\n", simData.time, cur.customerNum);
  getchar();
 }
}

/* 顾客服务结束离开 */
void DismissCustomer(struct SIMDATA &simData)
{
 if (traceFlag)
 {
  printf("%d 分,顾客%d完成并离开\n", simData.time, simData.activeCustomer.customerNum);
  getchar();
 }
 &simData.activeCustomer = 0;
}

/* 事件运行 */
void ProcessQueue(struct SIMDATA &simData)
{
 if (!(&simData.activeCustomer))
 {
  if (!QueueEmpty()) ServeCustomer(simData);
 }
 else if (!simData.activeCustomer.serviceTime)
 {
  DismissCustomer(simData);
 }
 else
 {
  simData.activeCustomer.serviceTime--;
 }
 simData.totalLineLength = simData.totalLineLength + QueueDepth();
}

void PrintResults(struct SIMDATA &simData)
{
 printf("结果:\n");
 printf("总共服务时间: %d 分\n", SIM_TIME);
 printf("顾客到达几率: 0.%d\n", 10 * ARRIVAL_P / 32767);
 printf("最短服务时间: %d 分\n", MIN_SERVICE_T);
 printf("最长服务时间: %d 分\n", MAX_SERVICE_T);
 getchar();
 SetScreen(1);
 printf("结果:\n");
 printf("总共服务顾客: %d 人\n", simData.numServed);
 if(!simData.numServed) simData.numServed = 1;
 printf("顾客平均等待: %d 分\n", simData.totalWaitTime / simData.numServed);
 printf("平均队伍长度: %d 人\n", simData.totalLineLength / SIM_TIME);
 getchar();
}

void fullErr()
{
 printf("队列溢出！\n");
 getchar();
 exit(0);
}

void nullErr()
{
 printf("队列空！\n");
 getchar();
 exit(0);
}

void main()
{
 struct SIMDATA simData;
 char buf[10000];

 SetScreen(1);
 InitQueue(buf, sizeof(buf), sizeof(struct CUSTOMER), fullErr, nullErr);//初始化队列
 InitSim(simData, buf);//初始化
 for (simData.time = 0; simData.time < SIM_TIME; simData.time++)
 {
  if (rand() < ARRIVAL_P) EnQueueCustomer(simData);//有顾客排队
  ProcessQueue(simData);
 }
 PrintResults(simData);
}  �>	 � �  85   �   �  5 ?�> 㩳              SwitchQueue        	 �  58 �  58 �  58 �  58 � 
 58 �  58  F 	 � )89�  ?	  �	  E 4	  3(  E 4(  3(  E 1( Q  ( )( )(89�  ?    E 58  	 58   58   58   58
   58   58 ?�> 㩳              InitQueue                  E 5558   	 ! "58   58
   58   58 =(  89| ��?	 F  +? ?�>  㩳               QueueFull           �   !58  389�  �   58  /? ?�>  㩳               QueueEmpty           /? ?�>  㩳               QueueDepth          )89�  ?  " + �    " +5! ,? ?�>	 㩳               GetHead              /89  =     �?�> 㩳               EnQueue            	 �   !58	  389P 	 �   58	  /89c 
 =     �  	 58?�>	 㩳               DeQueue              /89�  =     �    !58  389�     58?