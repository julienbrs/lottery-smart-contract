const { deployments, network } = require("hardhat")

module.exports = async function ({ getNamedAccounts, deployment }) {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()

    const lottery = await deploy("Lottery", {
        from: deployer,
        args: [],
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })
}
