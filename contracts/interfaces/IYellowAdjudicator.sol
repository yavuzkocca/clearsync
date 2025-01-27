// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import '@statechannels/nitro-protocol/contracts/interfaces/INitroAdjudicator.sol';

interface IYellowAdjudicator is INitroAdjudicator {
	function unpackStatus(
		bytes32 channelId
	) external view returns (uint48 turnNumRecord, uint48 finalizesAt, uint160 fingerprint);
}
