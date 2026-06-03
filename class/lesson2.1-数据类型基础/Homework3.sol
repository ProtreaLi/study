// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

//作业：
//3.编写代码测试Solidity0.8版本前后整数溢出的行为
contract Task1 {
 
    uint8 public a = 255;
    
    // ^0.8.1 执行报错：
    // 0.7.0  执行结果：0
    function testOverflow_0_8plus() public view returns (uint8) {
        return a + 1;  
    }
}