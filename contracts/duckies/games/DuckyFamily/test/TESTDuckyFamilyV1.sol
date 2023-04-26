// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.18;

import '../DuckyFamilyV1.sol';

contract TESTDuckyFamilyV1 is DuckyFamilyV1 {
	event GenomeReturned(uint256 genome);
	event GeneReturned(uint8 gene);
	event BoolReturned(bool returnedBool);
	event Uint8Returned(uint8 returnedUint8);

	constructor(
		address duckiesAddress,
		address ducklingsAddress,
		address treasureVaultAddress
	) DuckyFamilyV1(duckiesAddress, ducklingsAddress, treasureVaultAddress) {}

	// allow setting config for better testing
	function setRarityChances(uint32[] calldata chances) external {
		rarityChances = chances;
	}

	function setCollectionMutationChances(uint32[] calldata chances) external {
		collectionMutationChances = chances;
	}

	function setGeneMutationChance(uint32 chance) external {
		geneMutationChance = [1000 - chance, chance];
	}

	function setGeneInheritanceChances(uint32[] calldata chances) external {
		geneInheritanceChances = chances;
	}

	// ===============

	function generateGenome(uint8 collectionId) external {
		emit GenomeReturned(_generateGenome(collectionId));
	}

	function generateAndSetGenes(uint256 genome, uint8 collectionId, bytes3 seed) external {
		emit GenomeReturned(_generateAndSetGenes(genome, collectionId, seed));
	}

	function generateAndSetGene(
		uint256 genome,
		uint8 geneIdx,
		uint8 geneValuesNum,
		GeneDistributionTypes distrType,
		bytes3 seed
	) external {
		emit GenomeReturned(_generateAndSetGene(genome, geneIdx, geneValuesNum, distrType, seed));
	}

	function generateMythicGenome(uint256[] calldata genomes, bytes3 seed) external {
		emit GenomeReturned(_generateMythicGenome(genomes, seed));
	}

	function requireGenomesSatisfyMelding(uint256[] calldata genomes) external pure {
		_requireGenomesSatisfyMelding(genomes);
	}

	function meldGenomes(uint256[] calldata genomes) external {
		emit GenomeReturned(_meldGenomes(genomes));
	}

	function isCollectionMutating(Rarities rarity, bytes3 seed) external {
		emit BoolReturned(_isCollectionMutating(rarity, seed));
	}

	function meldGenes(
		uint256[] calldata genomes,
		uint8 gene,
		uint8 maxGeneValue,
		GeneDistributionTypes geneDistrType,
		bytes3 seed
	) external {
		emit GeneReturned(_meldGenes(genomes, gene, maxGeneValue, geneDistrType, seed));
	}

	function getDistributionType(
		uint32 distributionTypes,
		uint8 idx
	) external pure returns (GeneDistributionTypes) {
		return _getDistributionType(distributionTypes, idx);
	}

	function generateUnevenGeneValue(uint8 valuesNum, bytes3 seed) external pure returns (uint8) {
		return _generateUnevenGeneValue(valuesNum, seed);
	}

	function calcMaxPeculiarity() external view returns (uint16) {
		return _calcMaxPeculiarity();
	}

	function calcPeculiarity(uint256 genome) external view returns (uint16) {
		return _calcPeculiarity(genome);
	}

	function calcUniqIdGenerationParams(
		uint16 pivotalUniqId,
		uint16 maxUniqId
	) external pure returns (uint16 leftEndUniqId, uint16 uniqIdSegmentLength) {
		return _calcUniqIdGenerationParams(pivotalUniqId, maxUniqId);
	}
}