# DollarMintNFT 💵🔗

This is a simple ERC-721 NFT smart contract built using Solidity and OpenZeppelin. Each NFT is minted for **$0.01 USD worth of ETH**, calculated in real-time using the **Chainlink ETH/USD price feed**.

---

## 🧠 Features

- Mint NFTs based on dynamic ETH/USD conversion
- Auto-refund excess ETH sent during minting
- View ETH price via Chainlink Oracle
- List all NFT Token IDs owned by a user
- Withdraw ETH balance by contract owner

---

## 🔗 Technologies Used

- [Solidity](https://docs.soliditylang.org/) `^0.8.20`
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Chainlink Price Feeds](https://docs.chain.link/)
- Remix IDE or Hardhat (recommended for deployment/test)

---

## 🏗️ Contract Overview

- Contract Name: `DollarMintNFT`
- Token Name: `Dollar NFT`
- Token Symbol: `DNFT`
- Price: `$0.01 USD` worth of ETH
- Chainlink ETH/USD Price Feed (Sepolia): `0x694AA1769357215DE4FAC081bf1f309aDC325306`

---

## 🚀 Deploying the Contract

### Prerequisites

- MetaMask or Web3 wallet connected to **Sepolia testnet**
- Remix IDE or local Hardhat setup

### Remix Steps

1. Open [Remix](https://remix.ethereum.org)
2. Paste the contract code into a new `.sol` file
3. Compile using Solidity `0.8.20`
4. Go to **Deploy & Run** tab:
   - Select `DollarMintNFT`
   - Use constructor argument: `0x694AA1769357215DE4FAC081bf1f309aDC325306`
5. Deploy the contract

---

## 💸 Minting NFTs

```solidity
mintNFT()


### Contract Deployed at   0x8EcbAA8d8f64C24AB0f5Bc0F0791430eF82c2173
