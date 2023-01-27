// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

 import "hardhat/console.sol";

contract Transactions {
    
    uint256 transactionCount;


    event Transfer(address from, address payable receiver, uint amount, bool theWinStatus, string betChoice, uint256 timestamp);
    event Log (string func, address sender, uint value, bytes data);
    struct TransferStruct 
    {
        address sender;
        address receiver;
        uint amount;
        bool theWinStatus;
        string betChoice;
        uint256 timestamp;
        
    }

    TransferStruct[] transactions;
    
    function addToBlockchain(address payable receiver, uint amount, bool theWinStatus, string memory betChoice) public 
    {
        transactionCount += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, theWinStatus, betChoice, block.timestamp));

        emit Transfer(msg.sender, receiver, amount, theWinStatus, betChoice, block.timestamp);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) 
    {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) 
    
    {
        return transactionCount;
    }

}