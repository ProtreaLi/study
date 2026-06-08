// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    作业：创建一个提案投票系统：

    定义Proposal结构体（包含voters的mapping）
    支持创建提案
    支持投票（每人只能投一次）
    查询提案信息
    获取获胜提案
*/
contract task2 {
    // 定义提案结构体
    struct Proposal {
        uint id;
        string name;
        uint voteCount;
        mapping(address => bool) voters; // 记录谁投过票
    }

    Proposal[] public proposals; //记录所有提案

    //创建提案
    function createProposal(string memory _name) public returns (uint){
        proposals.push();
        Proposal storage newProposal = proposals[proposals.length - 1];
        // 设置值
        newProposal.id = proposals.length;  // ID 等于数组长度
        newProposal.name = _name;
        newProposal.voteCount = 0;
        return newProposal.id;
    }

    //查询提案信息
    function selectProposal(uint _id) public view returns(uint, string memory, uint){
        require(_id > 0 && _id <= proposals.length, "Proposal not found");
         // ID 从 1 开始，数组从 0 开始
        Proposal storage p = proposals[_id - 1]; 
        return (p.id, p.name, p.voteCount);
    }

    //投票
    function vote(uint _proposalId) public {
        require(_proposalId > 0 && _proposalId <= proposals.length, "Invalid proposal");
        Proposal storage proposal = proposals[_proposalId - 1];
        
        require(!proposal.voters[msg.sender], "Already voted");
        
        proposal.voters[msg.sender] = true;
        proposal.voteCount++;
    }
    
    //获取获胜提案
    function getWinner() public view returns (uint, string memory, uint) {
        require(proposals.length > 0, "No proposals");
        
        uint winningId = 1;
        uint maxVotes = proposals[0].voteCount;
        
        for (uint i = 1; i < proposals.length; i++) {
            if (proposals[i].voteCount > maxVotes) {
                maxVotes = proposals[i].voteCount;
                winningId = i + 1;
            }
        }
        
        Proposal storage winner = proposals[winningId - 1];
        return (winner.id, winner.name, winner.voteCount);
    }


}