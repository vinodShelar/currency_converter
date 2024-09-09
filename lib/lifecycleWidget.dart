import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({super.key});

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint("LifecycleWidget initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("LifecycleWidget didChangeDependencies");
    // this method is generally called when the widget is added to the widget tree
    // or when the dependencies of the widget change
    // it is called after initState and before build
  }

  @override
  void didUpdateWidget(covariant LifecycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("LifecycleWidget didUpdateWidget");
    // this method is called when the widget is updated
    // it is called after didChangeDependencies
    // it is called before build
    // generally used to update the state of the widget with the new widget
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("LifecycleWidget dispose");
    // this method is called when the widget is removed from the widget tree
    // it is called after dispose
    // it is called before build
    // generally used to dispose of the widget
    // dispose is a place where we generally do clean up
    // for example, if we have a subscription, we should dispose of it here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Lifecycle Widget",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
            color: Theme.of(context).primaryColor,
          )),
    ));
  }
}
