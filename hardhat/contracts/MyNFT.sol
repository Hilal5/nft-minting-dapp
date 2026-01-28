// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 private _tokenIds;
    uint256 public constant MINT_PRICE = 0.001 ether;
    
    constructor() ERC721("MyAwesomeNFT", "MNFT") {}
    
    function mint() public payable returns (uint256) {
        require(msg.value >= MINT_PRICE, "Kirim minimal 0.001 ETH");
        
        _tokenIds++;
        uint256 newTokenId = _tokenIds;
        
        _mint(msg.sender, newTokenId);
        
        return newTokenId;
    }
    
    function getTotalMinted() public view returns (uint256) {
        return _tokenIds;
    }
}