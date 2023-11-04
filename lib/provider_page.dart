import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_major/state_update_provier.dart';

class ProviderPage extends StatefulWidget {
  Widget child;
  ProviderPage({super.key, required this.child});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  late StateUpdateProvider _provider;
  @override
  Widget build(BuildContext context) {
    print("PAGE UPDATED");
    _provider = context.watch<StateUpdateProvider>();
    return widget.child;
  }
}
