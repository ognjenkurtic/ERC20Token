var HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider("<MNEMONIC>", "https://ropsten.infura.io/v3/<INFURA_API_KEY>")
      },
      network_id: 3,
      gas: 4000000
    }
  }
};
