// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*作业：
    创建一个完整的用户管理系统，实现以下功能：
    用户注册（包含name、email）
    更新个人资料
    存款功能（payable）
    查询用户信息
    获取所有用户列表
    分批查询用户
    限制最多1000个用户
*/
contract Task1 {

    // TODO: 定义User结构体
    struct User {
        string name;
        string email;
        uint balance;
        uint registeredAt;
        bool exists;
        // name, email, balance, registeredAt, exists
    }
    
    // TODO: 定义数据存储
    mapping(address => User) public users;
    address[] public userAddresses;
    uint256 public userCount;
    uint256 public constant MAX_USERS = 1000;
    
    //实现注册功能
    function register(string memory name, string memory email) public {
        // 检查是否已注册
        require(!users[msg.sender].exists,"user already exists");
        // 检查是否达到上限
        require(userAddresses.length < MAX_USERS,"registered users have reached the maximum limit");
        // 创建用户
        User memory newUser = User({
            name: name,
            email: email,
            balance: 0,
            registeredAt: block.timestamp,
            exists: true
        });
        // 更新用户数据
        users[msg.sender] = newUser;
        // 添加到列表
        userAddresses.push(msg.sender);
        // 更新计数
        userCount++;
    }
    
    // 更新个人资料
    function updatePersonInfo(string memory name, string memory email) public {
        
        require(users[msg.sender].exists, "Not registered");
        
        users[msg.sender].name = name;
        users[msg.sender].email = email;
    }

    //存款功能
    function deposit() payable public {
        require(users[msg.sender].exists, "Not registered");
        require(msg.value > 0, "Must send ETH");
        
        users[msg.sender].balance += msg.value;
    }

    //查询用户信息
    function selectUserInfo(address user) public view returns (User memory) {
        require(users[user].exists,"user is not exists");
        return users[user];
    } 

    //获取所有用户列表
    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }

    //分批查询用户
    function getUsers(uint start, uint end) public view returns (User[] memory) {
        require(start <= end, "Invalid range");
        require(end < userAddresses.length, "End index out of bounds");
        
        User[] memory result = new User[](end - start +1);
        for (uint i = start; i <= end; i++) {
            result[i - start] = users[userAddresses[i]];
        }
        return result;
    }
}