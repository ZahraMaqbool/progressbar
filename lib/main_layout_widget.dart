import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<StatefulWidget> createState() => _MainLayoutState();
  
}

class _MainLayoutState extends State<MainLayout>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this,duration: const Duration(seconds: 2))..addListener(() {setState(() {
      
    });});
    _animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(height:200 ,width: 10,child: Stack(children: [AnimatedBuilder(animation: _animation, builder: ((context, child) {
      return FractionallySizedBox(widthFactor: _animation.value,heightFactor: _animation.value,alignment: Alignment.centerLeft,child: Container(height: 10,decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(10)),),);
    }))],),);
  }
}
