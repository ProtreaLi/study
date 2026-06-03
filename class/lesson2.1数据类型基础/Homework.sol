// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";

//作业：
//1.简单的Solidity合约，包含至少一种值类型和一种引用类型，并实现它们之间的基本操作和一次类型转换。
//2.尝试使用不同大小的uint类型存储相同的数据，并观察其Gas消耗差异。
//3.编写代码测试Solidity0.8版本前后整数溢出的行为
contract Task {
   using Strings for uint256;
   uint256 public a = 666;
   string public b = "888";

    //uint256 转 string
    function a2b() public {
        b = a.toString(); 
    }

    //string 转 uint256
    function b2a() public {
        a = stringToUint(b);
    }

    // 辅助函数：string 转 uint256
    function stringToUint(string memory s)   internal  pure returns (uint256) {
        bytes memory b = bytes(s);
        uint256 result = 0;
        for(uint i = 0; i < b.length; i++) {
            uint8 char = uint8(b[i]);
            require(char >= 48 && char <= 57, "Invalid character");
            result = result * 10 + (char - 48);
        }
        return result;
    }

}