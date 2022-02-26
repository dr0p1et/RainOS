# RainOS

<img title="" src="./RainOS.png" width="202">

一个精简的多架构64位微内核操作系统实现，支持x86、ARM、海思等架构。

完整的开发过程：RainOS Wiki。

## 来历

这是一款为了让初学者能从本质上理解并自己编写出操作系统内核的教学型OS。

自己开始学习编写操作系统时发现，市面上编写操作系统的书籍虽然讲解了操作系统各个模块的组成，但关于每个模块如何这样设计的内容还讲的不够细致，没有讲出来`到底为什么这样设计`。由于基础薄弱，自己不得不额外查询了很多资料才能消化。这也促使自己将个人的理解过程总结出来，真正搞明白为什么。

绝大多数的操作系统实践都是以Bochs虚拟机为运行环境，个人觉得这种不直观的体现很容易导致初学者丧失继续学习的动力。偶然间看到有人在51开发板上做了一个操作系统的半成品。当时就想，能否将自己开发的操作系统运行在树莓派、Rock Pi X、海思等开发板上。这种方式带来的成就感可能更能激发学习者的积极性。

RainOS本质上是一个通过参考Minix3、uCore两种不同的内核并改进现有问题的第二代微内核架构。包含引导启动、进程管理、内存管理、文件管理和系统调用等。还要包含一个最基本的图形接口。

在上述功能的基础上追求代码量的最小化。最终目标希望保证在1万行以内。

笔者准备通过一系列开发博客，由浅入深把RainOS的完整开发过程记录下来。讲清楚开发一个内核的过程中需要做什么、为什么、怎么做三个问题，让初学者在可控的学习难度上从零开始学习一个操作系统的设计与实现。

这就是RainOS诞生的过程。

## 特性

OS支持如下特性：

- 支持legacy BIOS和UEFI启动。
- 支持x86、ARM、PowerPC、MIPS多种架构。
- 可运行在树莓派、Rock Pi X、海思、STM32等开发板。
- 支持32位和64位。

## 版本

无

## 参考

个人主要参考了下面几本书和开源操作系统内核源码。

- 书籍
  - 《操作系统设计与实现》
  - 《操作系统精髓与设计原理》
  - 《一个64位操作系统的设计与实现》
  - 《操作系统真象还原》
  - 《深度探索嵌入式操作系统》
  - 《30天自制操作系统》
  - 《UEFI编程实践》
  - 《鸿蒙内核源码分析》
  - 清华大学公开课《操作系统》113讲
- 操作系统内核
  - Minix3
  - uCore
  - 鸿蒙操作系统内核
  - xBook2：基于x86处理器的32位操作系统

## 联系我

如果有任何疑问，请联系我。

邮箱：dr0p1et#163.com

---

:copyright: 2021-2022 :rocket: `DR0p1ET`.
