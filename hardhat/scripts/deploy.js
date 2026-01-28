async function main() {
  console.log("Deploying contract...");

  const MyNFT = await ethers.getContractFactory("MyNFT");
  const nft = await MyNFT.deploy();

  await nft.waitForDeployment();

  const address = await nft.getAddress();
  console.log("✅ Contract deployed to:", address);
  console.log("SIMPAN ADDRESS INI!");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
