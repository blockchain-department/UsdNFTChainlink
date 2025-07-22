// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DollarMintNFT is ERC721Enumerable, Ownable {
    AggregatorV3Interface internal priceFeed;
    uint256 public tokenIdCounter;
    uint256 public constant usdPrice = 1e18 / 100; // 0.01 USD in 18 decimals

    constructor(address _priceFeed) ERC721("Dollar NFT", "DNFT") Ownable(msg.sender) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    /// @notice Mint one NFT by sending 0.01 USD worth of ETH
    function mintNFT() external payable {
        uint256 requiredETH = getETHAmountForUSD(usdPrice);
        require(msg.value >= requiredETH, "Insufficient ETH sent");

        _safeMint(msg.sender, tokenIdCounter);
        tokenIdCounter++;

        // Refund extra ETH if overpaid
        if (msg.value > requiredETH) {
            payable(msg.sender).transfer(msg.value - requiredETH);
        }
    }

    /// @notice Convert USD to ETH using Chainlink price feed
    function getETHAmountForUSD(uint256 usdAmount) public view returns (uint256) {
        (, int256 ethPrice, , , ) = priceFeed.latestRoundData(); // ETH/USD price (8 decimals)
        require(ethPrice > 0, "Invalid ETH price");

        uint256 price = uint256(ethPrice); // e.g. $3000 * 1e8
        return (usdAmount * 1e8) / price;  // returns ETH in wei
    }

    function getLatestETHPrice() external view returns (int256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price;
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function getTokensByOwner(address ownerAddress) external view returns (uint256[] memory) {
        uint256 count = balanceOf(ownerAddress);
        uint256[] memory tokenIds = new uint256[](count);
        for (uint256 i = 0; i < count; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(ownerAddress, i);
        }
        return tokenIds;
    }

    // Optional: safety net for receiving ETH
    receive() external payable {}
}
