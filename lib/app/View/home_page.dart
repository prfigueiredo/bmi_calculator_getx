import 'package:bmi_calculator_getx/app/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  //Instancing controller to the AppBar
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Mass Index (BMI)'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
                onPressed: () {
                  controller.resetButton();
                },
                icon: const Icon(Icons.refresh)),
            const SizedBox(width: 10),
          ],
        ),
        body: GetBuilder<Controller>(
            init: Controller(),
            builder: (controller) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(),
                    SvgPicture.asset(
                      'assets/body.svg',
                      height: 255,
                    ),
                    const Divider(),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'WEIGHT(kg)',
                        labelStyle: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                      controller: controller.weightController,
                    ),
                    const Divider(),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'HEIGHT(m)',
                        labelStyle: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                      controller: controller.heightController,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.calculate();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        child: Text(
                          'CALCULATE',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Divider(),
                    Text(
                      controller.information.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.teal, fontSize: 25),
                    ),
                  ],
                ),
              );
            })
    );
  }
}