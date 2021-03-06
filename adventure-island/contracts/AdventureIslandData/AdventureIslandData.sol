pragma solidity ^0.5.6;

import "../interface/IAdventureIsland.sol";
import "../../../contract-libs/seal-sc/Constants.sol";
import "../../../erc20-token-supplier/contracts/interface/IERC20TokenSupplier.sol";
import "../../../uniswap-connector/contracts/interface/IUniswapConnector.sol";

contract AdventureIslandData is IAdventureIsland, Constants {
    PoolInfo[] public pools;
    mapping (uint256=>mapping(address=>UserInfo)) public users;

    address public mainRewardToken;
    IERC20TokenSupplier public rewardSupplier;
    IUniswapConnector public uniConnector;

    mapping(address=>bool) public ethPayer;

    uint256 public rewardPerBlock;
    uint256 public minRewardPerBlock;

    uint256 public rewardCap;
    uint256 public collectedReward;

    address public team;
    uint256 public teamRewardBP = 1000; // 10% | extra reward mint to team when user collect;
    bool public teamRewardPermanentlyDisabled = false;

    bool public globalOpen = true;
    uint256 public globalStartBlock  = ~uint256(0);

    mapping(address=>uint256) public platformFeeCollected;
    uint256 public platformFeeBP = 100; // 1% | flash staking fee
    uint256 public flashStakingRewardBP = 100; // 1% | flash staking reward basis point
}
