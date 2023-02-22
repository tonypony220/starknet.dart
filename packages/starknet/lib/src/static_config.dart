import 'package:starknet/starknet.dart';

class StarknetChainId {
  static final mainnet = Felt.fromString('SN_MAIN');
  static final testNet = Felt.fromString('SN_GOERLI');
}

class TransactionHashPrefix {
  static final declare = Felt.fromString('declare');
  static final deploy = Felt.fromString('deploy');
  static final deployAccount = Felt.fromString('deploy_account');
  static final invoke = Felt.fromString('invoke');
  static final l1Handler = Felt.fromString('l1_handler');
}

final defaultMaxFee = Felt.fromDouble(0.1 * 1e18); // 0.1 ETH
final defaultNonce = Felt.fromInt(0);
final defaultVersion = Felt.fromInt(0);

final udcAddress = Felt.fromHexString(
    '0x041a78e741e5af2fec34b695679bc6891742439f7afb8484ecd7766661ad02bf');

// address is the same for mainnet & testnet
final ethAddress = Felt.fromHexString(
    "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7");

// from starknet-devnet 0.4.0
final openZeppelinAccountClassHash = Felt.fromHexString(
    "0x1fac3074c9d5282f0acc5c69a4781a1c711efea5e73c550c5d9fb253cf7fd3d");

// Devnet

final devnetUri = Uri.parse('http://localhost:5050/rpc');

final devnetAccount0Address = Felt.fromHexString(
    "0x7e00d496e324876bbc8531f2d9a82bf154d1a04a50218ee74cdd372f75a551a");
final devnetAccount0PublicKey = Felt.fromHexString(
    "0x7e52885445756b313ea16849145363ccb73fb4ab0440dbac333cf9d13de82b9");
final devnetAccount0PrivateKey =
    Felt.fromHexString("0xe3e70682c2094cac629f6fbed82c07cd");
final account0 = getAccount(
  accountAddress: devnetAccount0Address,
  privateKey: devnetAccount0PrivateKey,
);

final devnetAccount1Address = Felt.fromHexString(
    "0x69b49c2cc8b16e80e86bfc5b0614a59aa8c9b601569c7b80dde04d3f3151b79");
final devnetAccount1PublicKey = Felt.fromHexString(
    "0x175666e92f540a19eb24fa299ce04c23f3b75cb2d2332e3ff2021bf6d615fa5");
final devnetAccount1PrivateKey =
    Felt.fromHexString("0xf728b4fa42485e3a0a5d2f346baa9455");
final account1 = getAccount(
  accountAddress: devnetAccount1Address,
  privateKey: devnetAccount1PrivateKey,
);

final devnetAccount9Address = Felt.fromHexString(
    "0x7f61fa3893ad0637b2ff76fed23ebbb91835aacd4f743c2347716f856438429");
final devnetAccount9PublicKey = Felt.fromHexString(
    "0xc11e246b1d54515a26204d2d3c8586ea25ed9eecae00df173405974cb86dbc");
final devnetAccount9PrivateKey =
    Felt.fromHexString("0x259f4329e6f4590b9a164106cf6a659e");
final account9 = getAccount(
  accountAddress: devnetAccount9Address,
  privateKey: devnetAccount9PrivateKey,
);
// Testnet

final v010PathfinderGoerliTestnetUri = Uri.parse('http://35.180.61.64');

final infuraGoerliTestnetUri = Uri.parse(
    'https://starknet-goerli.infura.io/v3/f54befa531584e2d8516addbf285a560');

// Mainnet

final infuraMainnetUri = Uri.parse(
    'https://starknet-mainnet.infura.io/v3/f54befa531584e2d8516addbf285a560');
