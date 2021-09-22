const Token = artifacts.require("Token");

const tokenURI1 = "ipfs://bafyreifa7ir4jbhrpqvg5phbwpihjsn2fo7ll4k6qe5yltd5us7ggfjfq4/metadata.json";
const tokenURI2 = "ipfs://bafyreihrdgtbdtetmmrh6c6q5ubvvywp5wvphvgwzz6zq7bgb3ju2aajde/metadata.json";

module.exports = async (deployer) => {
  await deployer.deploy(Token, tokenURI1, tokenURI2);
  let nft = await Token.deployed();
};
