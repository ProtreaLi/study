// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//作业：优化该合约，减少gas费用
contract Task {
    uint[] public data; // 状态变量，默认存储在 storage 中

    // 这个函数有很多优化空间
    function processData(uint[] memory input) public {
        delete data;  // 清空数组
        for(uint i = 0; i < input.length; i++) {
            data.push(input[i] * 2);
        }
    }

    // 这个函数也可以优化
    function getSum() public view returns (uint) {
        uint sum = 0;
        for(uint i = 0; i < data.length; i++) {
            sum += data[i];
        }
        return sum;
    }

    //优化后的func1
    //calldata可读减少消耗
    //temp临时数组批量操作data 减少读写
    function processData_new(uint[] calldata input) public {
        delete data;  // 清空数组
        uint[] memory temp = new uint[](input.length);
        for(uint i = 0; i < input.length; i++) {
            temp[i] = input[i] * 2;
        }
        data = temp;
    }

    //优化后的func2
    //
    function getSum_new() public view returns (uint) {
        uint sum = 0;
        uint[] storage dataRef = data;      
        uint len = dataRef.length; 
        
        for(uint i = 0; i < len; i++) {
            sum += dataRef[i];
        }
        return sum;
    }
}