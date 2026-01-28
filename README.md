# 🎨 NFT Minting DApp

A decentralized application (DApp) for minting NFTs on the Ethereum blockchain. Built with modern Web3 technologies including Hardhat, Solidity, Next.js, and Wagmi.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Solidity](https://img.shields.io/badge/Solidity-0.8.20-orange.svg)
![Next.js](https://img.shields.io/badge/Next.js-15-black.svg)

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Usage](#usage)
- [Smart Contract](#smart-contract)
- [Project Structure](#project-structure)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- 🎯 Mint NFTs directly from the browser
- 💰 Fixed mint price (0.001 ETH)
- 🔗 Wallet connection via RainbowKit (supports MetaMask, WalletConnect, and more)
- 📊 Real-time tracking of total minted NFTs
- 🌐 Deployed on Ethereum Sepolia testnet
- 🎨 Modern UI with Tailwind CSS
- ⚡ Fast and responsive Next.js frontend
- 🔒 Secure smart contract using OpenZeppelin standards

## 🛠 Tech Stack

### Smart Contract
- **Hardhat** - Ethereum development environment
- **Solidity** - Smart contract language (v0.8.20)
- **OpenZeppelin** - Secure smart contract library (ERC-721 standard)
- **Ethers.js** - Ethereum library

### Frontend
- **Next.js 15** - React framework with App Router
- **TypeScript** - Type-safe JavaScript
- **Wagmi** - React Hooks for Ethereum
- **Viem** - TypeScript Ethereum library
- **RainbowKit** - Wallet connection UI
- **TanStack Query** - Data fetching and caching
- **Tailwind CSS** - Utility-first CSS framework

### Infrastructure
- **Alchemy** - Ethereum node provider
- **Sepolia Testnet** - Ethereum test network

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18 or higher)
- **npm** or **yarn**
- **Git**
- **MetaMask** browser extension

You'll also need:
- An Alchemy account ([Sign up here](https://www.alchemy.com))
- A WalletConnect Project ID ([Get one here](https://cloud.walletconnect.com))
- Sepolia testnet ETH ([Get from faucet](https://sepoliafaucet.com))

## 🚀 Installation

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/nft-minting-dapp.git
cd nft-minting-dapp
```

### 2. Install Smart Contract Dependencies
```bash
cd hardhat
npm install
```

### 3. Install Frontend Dependencies
```bash
cd ../frontend
npm install
```

## ⚙️ Configuration

### 1. Smart Contract Configuration

Create a `.env` file in the `hardhat/` directory:
```bash
cd hardhat
cp .env.example .env
```

Edit `.env` and add your credentials:
```env
ALCHEMY_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
PRIVATE_KEY=YOUR_METAMASK_PRIVATE_KEY
```

**How to get credentials:**

- **Alchemy URL**: 
  1. Go to [Alchemy Dashboard](https://dashboard.alchemy.com)
  2. Create a new app
  3. Select "Ethereum" → "Sepolia"
  4. Copy the HTTPS URL

- **Private Key**:
  1. Open MetaMask
  2. Click the three dots (⋮) → Account Details
  3. Click "Show Private Key"
  4. Enter your password
  5. Copy the private key

⚠️ **Security Warning**: Never share your private key or commit `.env` files to version control!

### 2. Frontend Configuration

Create a `.env.local` file in the `frontend/` directory:
```bash
cd frontend
cp .env.example .env.local
```

Edit `.env.local`:
```env
NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID=YOUR_PROJECT_ID
```

Get your Project ID from [WalletConnect Cloud](https://cloud.walletconnect.com).

## 📤 Deployment

### 1. Compile Smart Contract
```bash
cd hardhat
npx hardhat compile
```

### 2. Deploy to Sepolia Testnet
```bash
npx hardhat run scripts/deploy.js --network sepolia
```

**Save the contract address** that appears in the output!

Example output:
```
✅ Contract deployed to: 0x1cE739883798739BD3676aA3A91A558829e3AC8F
```

### 3. Update Frontend Configuration

Open `frontend/app/page.tsx` and update the `CONTRACT_ADDRESS`:
```typescript
const CONTRACT_ADDRESS = '0xYOUR_DEPLOYED_CONTRACT_ADDRESS' as `0x${string}`;
```

### 4. Run Frontend
```bash
cd frontend
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🎮 Usage

### For Users

1. **Connect Wallet**
   - Click "Connect Wallet" button
   - Select MetaMask or your preferred wallet
   - Approve the connection

2. **Switch to Sepolia Network**
   - MetaMask will prompt you to switch networks
   - Confirm the network switch

3. **Mint NFT**
   - Click "Mint NFT (0.001 ETH)"
   - Confirm the transaction in MetaMask
   - Wait 10-30 seconds for confirmation
   - Success message will appear when complete

4. **View Your NFT**
   - Check the "Total NFT Minted" counter
   - View your NFTs in MetaMask or on [Sepolia Etherscan](https://sepolia.etherscan.io)

### For Developers

**Test Smart Contract:**
```bash
cd hardhat
npx hardhat test
```

**Run Local Hardhat Node:**
```bash
npx hardhat node
```

**Deploy to Local Node:**
```bash
npx hardhat run scripts/deploy.js --network localhost
```

## 📝 Smart Contract

### Contract Details

- **Name**: MyAwesomeNFT
- **Symbol**: MNFT
- **Standard**: ERC-721
- **Network**: Ethereum Sepolia Testnet
- **Contract Address**: `0x1cE739883798739BD3676aA3A91A558829e3AC8F`

### Key Functions
```solidity
// Mint a new NFT (payable function)
function mint() public payable returns (uint256)

// Get total number of minted NFTs
function getTotalMinted() public view returns (uint256)

// ERC-721 standard functions
function balanceOf(address owner) public view returns (uint256)
function ownerOf(uint256 tokenId) public view returns (address)
function transferFrom(address from, address to, uint256 tokenId) public
```

### View on Etherscan

[View Contract on Sepolia Etherscan](https://sepolia.etherscan.io/address/0x1cE739883798739BD3676aA3A91A558829e3AC8F)

## 📁 Project Structure
```
nft-minting-dapp/
├── hardhat/                    # Smart contract project
│   ├── contracts/
│   │   └── MyNFT.sol          # NFT smart contract
│   ├── scripts/
│   │   └── deploy.js          # Deployment script
│   ├── test/
│   │   └── Lock.js            # Smart contract tests
│   ├── .env.example           # Environment variables template
│   ├── .gitignore
│   ├── hardhat.config.js      # Hardhat configuration
│   └── package.json
│
├── frontend/                   # Next.js frontend
│   ├── app/
│   │   ├── layout.tsx         # Root layout
│   │   ├── page.tsx           # Main minting page
│   │   ├── providers.tsx      # Web3 providers setup
│   │   └── globals.css        # Global styles
│   ├── public/
│   ├── .env.example           # Environment variables template
│   ├── .gitignore
│   ├── next.config.js
│   ├── tailwind.config.js
│   └── package.json
│
└── README.md                   # This file
```

## 🔒 Security

### Best Practices Implemented

- ✅ OpenZeppelin's audited ERC-721 implementation
- ✅ No upgradeable contracts (immutable code)
- ✅ Simple, auditable smart contract logic
- ✅ Environment variables for sensitive data
- ✅ `.gitignore` configured to exclude private keys
- ✅ HTTPS RPC connections
- ✅ Client-side transaction signing

### Security Checklist

- [ ] Never commit `.env` files
- [ ] Never share your private key
- [ ] Always verify contract addresses
- [ ] Test on testnet before mainnet deployment
- [ ] Audit smart contracts before production
- [ ] Use hardware wallets for large amounts
- [ ] Keep dependencies updated

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Hardhat](https://hardhat.org/) - Ethereum development environment
- [OpenZeppelin](https://openzeppelin.com/) - Secure smart contract library
- [Wagmi](https://wagmi.sh/) - React Hooks for Ethereum
- [RainbowKit](https://www.rainbowkit.com/) - Wallet connection library
- [Alchemy](https://www.alchemy.com/) - Blockchain infrastructure

## 📞 Contact

- GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)
- Twitter: [@YOUR_TWITTER](https://twitter.com/YOUR_TWITTER)

## 🔗 Links

- [Live Demo](http://localhost:3000) (Run locally)
- [Smart Contract on Etherscan](https://sepolia.etherscan.io/address/0x1cE739883798739BD3676aA3A91A558829e3AC8F)
- [Documentation](https://github.com/YOUR_USERNAME/nft-minting-dapp/wiki)

---

⭐ Star this repo if you found it helpful!

Made with ❤️ by claude and me
