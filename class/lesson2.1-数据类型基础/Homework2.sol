// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//作业：
//2.尝试使用不同大小的uint类型存储相同的数据，并观察其Gas消耗差异。
contract Task1 {
 
   // 定义不同大小的 uint 类型变量
    uint8 public smallNum;    // 8位，范围：0-255，占用1字节
    uint16 public mediumNum;  // 16位，范围：0-65535，占用2字节
    uint256 public largeNum;  // 256位，超大范围，占用32字节
    
    // 23,538	2,474
    function test1() public {
        smallNum = 100;    // 存储小数字
    }
    // 23,567	2,503
    function test2() public {
        mediumNum = 100;   // 存储相同数字
    }
    // 23,399	2,335
    function test3() public {
        largeNum = 100;    // 存储相同数字
    }
    
    //结论：不同大小的uint类型存储相同的数据，gas消耗相同，evm会统一使用256位处理（默认）
}