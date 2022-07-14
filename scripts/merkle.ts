const keccak256 = require('keccak256')
const { MerkleTree } = require('merkletreejs')

const addresses = require('./merkle.json')

const leaves = addresses.map(keccak256)
const tree = new MerkleTree(leaves, keccak256, { sort: true })
const root = tree.getHexRoot()
const leaf = keccak256(process.argv[2])
const proof = tree.getHexProof(leaf)
const isPresent = tree.verify(proof, leaf, root)

console.log({ root, leaf: '0x' + leaf.toString('hex'), proof, isPresent })
