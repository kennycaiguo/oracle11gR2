吞吐量和相应时间是Oracle业务系统的基本指标
吞吐量：单位时间内完成的操作单元数量
响应时间：操作单元从开始到结束所消耗的时间。
Oracle数据库有整体的吞吐量：Listener,SGA,lgwr,进程，CPU,I/O系统，内存和网络有各自的吞吐量。

--------------------------------------
优化思路：
对于交互式在线交易系统；在可接受的响应时间基础上提供尽可能高的吞吐量，换言之就是一笔交易在可接受的响应时间之内应尽可能的将低资源消耗。
	降低单位资源消耗，快速通过并发共享区域。
对于批处理和DSS系统：在有限的资源内尽可能缩短响应时间，换言之一笔业务应该尽可能的利用资源加速业务处理。
	充分利用资源，独占式处理加快响应。如多线程
---------------------------------------
tpcc测试工具hammerora得到数据库的吞吐量和响应时间曲线图

oracled orion工具对磁盘进行测试
---------------------------------------
系统优化的时间点
1、在系统上线之前就得优化的，这里是解决各个开发人员的不合理之处
2、在系统上线一段时间后优化：
	数据量增大，而业务系统和数据量具有较强的线性关系
	业务量的增大，访问量增大，并发性不足
	




