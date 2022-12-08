pragma solidity 0.8.7;

import "./Lottery.sol";
import "@chainlink/contracts/src/v0.8/interfaces/Keeper.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

// Replace these values with the necessary information for your setup:

// Address of the VRF coordinator contract
address vrfCoordinatorV2 = 0x0000000000000000000000000000000000000000;
// Entrance fee for the lottery
uint256 entranceFee = 0;
// Key hash for the VRF subscription
bytes32 keyHash = 0x0000000000000000000000000000000000000000000000000000000000000000;
// Subscription ID for the VRF subscription
uint64 subscriptionId = 6870;
// Callback gas limit for the VRF requests
uint32 callbackGasLimit = 0;
// Interval for the lottery
uint256 interval = 0;

// Deploy the VRF coordinator contract (if necessary)
VRFCoordinatorV2Interface vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
if (vrfCoordinator == address(0)) {
    vrfCoordinator = new VRFCoordinatorV2();
}

// Fund the VRF subscription with $LINK
vrfCoordinator.fund(subscriptionId, { value: ... });

// Deploy the Keeper node (if necessary)
Keeper keeper = Keeper(keeperContract);
if (keeper == address(0)) {
    keeper = new Keeper();
}

// Set the VRF coordinator and subscription ID on the Keeper node
keeper.setCoordinator(vrfCoordinatorV2);
keeper.setSubscriptionID(subscriptionId);

// Deploy the lottery contract
Lottery lottery = new Lottery(
    vrfCoordinatorV2,
    entranceFee,
    keyHash,
    subscriptionId,
    callbackGasLimit,
    interval
);

// Set the Keeper node on the lottery contract
lottery.setKeeper(keeper);