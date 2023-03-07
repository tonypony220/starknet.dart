import 'package:flutter/material.dart';
import 'package:starknet_flutter/starknet_flutter.dart';
import 'package:starknet_flutter_example/ui/screens/wallet/tabs/account_balance/account_balance.dart';
import 'package:starknet_flutter_example/ui/screens/wallet/tabs/collectibles.dart';
import 'package:starknet_flutter_example/ui/screens/wallet/tabs/dapps.dart';
import 'package:starknet_flutter_example/ui/screens/wallet/tabs/swap.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';
  final PasswordPrompt passwordPrompt;
  final PasswordPrompt createPassword;

  const WalletScreen({
    super.key,
    required this.passwordPrompt,
    required this.createPassword,
  });

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialogWalletMissing(context);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkPasswordConfiguration();
  }

  /// If biometrics is not set and we don't have a password saved yet, create it
  Future<void> _checkPasswordConfiguration() async {
    final passwordStore = PasswordStore();
    final hasBiometrics = await SecureStore.hasBiometricStore();
    if (!hasBiometrics) {
      final hasPassword = await passwordStore.hasPassword();
      if (!hasPassword) {
        _createPasswordDialog(passwordStore);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return AccountBalance(
                  passwordPrompt: widget.passwordPrompt,
                  createPassword: widget.createPassword,
                );
              case 1:
                return const Swap();
              case 2:
                return const Collectibles();
              default:
                return const DApps();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Swap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'NFTs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'dApps',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }

  Future<void> _showDialogWalletMissing(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("It seems you don't have a wallet yet"),
        content: const Text("Do you want to create/import one?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ignore"),
          ),
          TextButton(
            onPressed: () {
              StarknetWallet.showInitializationModal(
                context,
                passwordPrompt: widget.passwordPrompt,
              );
            },
            child: const Text("Let's go!"),
          ),
        ],
      ),
    );
  }

  void _createPasswordDialog(PasswordStore passwordStore) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Set a password to protect your wallets"),
        actions: [
          TextButton(
            onPressed: () async {
              final password = await widget.createPassword(context);
              if (password != null) {
                await passwordStore.initiatePassword(password);
                if (mounted) Navigator.pop(context);
              }
            },
            child: const Text("Continue"),
          )
        ],
      ),
    );
  }
}