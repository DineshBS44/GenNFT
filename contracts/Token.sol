// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Token is ERC721 {
  address public contractOwner; // Owner of this contract

  constructor(string memory parent1, string memory parent2) public ERC721("TurtleCharacter", "TRTL") {
    contractOwner = msg.sender;

    uint256 tokenId = totalSupply();
    _safeMint(msg.sender, tokenId);
    uint256 lastTokenId = totalSupply() - 1;
    _setTokenURI(lastTokenId, parent1);

    tokenId = totalSupply();
    _safeMint(msg.sender, tokenId);
    lastTokenId = totalSupply() - 1;
    _setTokenURI(lastTokenId, parent2);
  }

  // Modifer that checks to see if msg.sender == contractOwner
  modifier onlyContractOwner() {
    require(
      msg.sender == contractOwner,
      "The caller is not the contract owner"
    );
    _;
  }

  function breedNFT(uint tokenId1, uint tokenId2, string memory _tokenURI) public onlyContractOwner {
    _burn(tokenId1);
    _burn(tokenId2);
    uint256 tokenId = totalSupply();
    _safeMint(msg.sender, tokenId);
    uint256 lastTokenId = totalSupply() - 1;
    _setTokenURI(lastTokenId, _tokenURI);
  }

  function mintNewNFT(string memory _tokenURI) public onlyContractOwner {
    uint256 tokenId = totalSupply();
    _safeMint(msg.sender, tokenId);
    uint256 lastTokenId = totalSupply() - 1;
    _setTokenURI(lastTokenId, _tokenURI);
  }

  // Function 'updateTokenURI' updates the Token URI for a specific Token
  function updateTokenURI(uint256 _tokenId, string memory _tokenURI)
    public
    onlyContractOwner
  {
    _setTokenURI(_tokenId, _tokenURI);
  }
}
