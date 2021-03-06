import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenableProviderPage extends StatefulWidget {
  const ListenableProviderPage();

  @override
  _ListenableProviderState createState() => _ListenableProviderState();
}

class _ListenableProviderState extends State<ListenableProviderPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AnimationController>(
      create: (_) => AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this,
      )..repeat(),
      dispose: (_, controller) => controller.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListenableProvider()'),
        ),
        body: const Center(
          child: _Spinner(),
        ),
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) {
    final value =
        context.select((AnimationController controller) => controller.value);

    return Transform.rotate(
      angle: value * 2.0 * math.pi,
      child: const SizedBox(
        width: 200.0,
        height: 200.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ),
      ),
    );
  }
}
