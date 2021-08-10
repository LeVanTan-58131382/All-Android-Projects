import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class FlutterSpinKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SpinKitCubeGrid(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                    duration: Duration(milliseconds: 500),
                  ),
                ),

                SpinKitRotatingCircle(color: Colors.white),
                SpinKitRotatingPlain(color: Colors.white),
                SpinKitChasingDots(color: Colors.white),
                SpinKitPumpingHeart(color: Colors.white),
                SpinKitPulse(color: Colors.white),
                SpinKitDoubleBounce(color: Colors.white),
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
                SpinKitThreeBounce(color: Colors.white),

                SpinKitWanderingCubes(color: Colors.green),

                SpinKitWanderingCubes(color: Colors.red, shape: BoxShape.circle),

                SpinKitWanderingCubes(color: Colors.green),

                SpinKitCircle(color: Colors.white),
                SpinKitFadingFour(color: Colors.white),
                SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
                SpinKitFadingCube(color: Colors.white),
                SpinKitCubeGrid(size: 51.0, color: Colors.white),
                SpinKitFoldingCube(color: Colors.white),
                SpinKitRing(color: Colors.white),
                SpinKitDualRing(color: Colors.white),
                SpinKitRipple(color: Colors.white),
                SpinKitFadingGrid(color: Colors.white),
                SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.white),
                SpinKitSpinningCircle(color: Colors.white),
                SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.white),
                SpinKitPouringHourglass(color: Colors.white),
              ],
            ),
          ]
          ),
        ),
      ),
    );
  }
}