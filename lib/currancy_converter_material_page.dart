import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurreencyConverterMaterialPage extends StatefulWidget {
  const CurreencyConverterMaterialPage({super.key});

  @override
  State<CurreencyConverterMaterialPage> createState() =>
      _CurreencyConverterMaterialPageState();
}

class _CurreencyConverterMaterialPageState
    extends State<CurreencyConverterMaterialPage> {
  late double result;
  final TextEditingController inrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    result = 0;
  }

  // define a method to convert the amount from inr to usd
  void convertToUSD() {
    setState(() {
      result = (double.parse(inrController.text) / 82);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   margin: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.black87,
            //       borderRadius: BorderRadius.circular(20),
            //       border: Border.all(
            //         color: Colors.white,
            //         width: 2,
            //       )),
            //   child: const Text("Currency Converter",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 36,
            //           fontWeight: FontWeight.bold)),
            // ),
            Padding(
              // padding: EdgeInsets.all(10),
              // there are 2 types of padding
              // 1. EdgeInsets.all(10)
              // 2. EdgeInsets.symmetric(horizontal: 10, vertical: 10)
              // 3. EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10)
              // 4. EdgeInsets.fromLTRB(left, top, right, bottom)
              // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              // padding: EdgeInsets.symmetric(horizontal: , vertical: 10),
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: TextField(
                controller: inrController,
                decoration: const InputDecoration(
                    hintText: "Please Enter The Amount in INR ",
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    labelText: "Please Enter The Amount in INR ",
                    labelStyle: TextStyle(color: Colors.white),
                    helperText: "Please Enter The Amount in INR ",
                    helperStyle: TextStyle(color: Colors.white),
                    // prefixText: 'Hello It is in INR '
                    // prefixIcon: Icon(Icons.monetization_on_outlined),
                    // prefixIconColor: Colors.white,
                    suffix: Text("INR"),
                    suffixStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.currency_rupee),
                    suffixIconColor: Colors.white,
                    filled: true,
                    fillColor: Colors.black87,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                      width: 3,
                      style: BorderStyle.solid,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 3,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
                style: const TextStyle(color: Colors.white, fontSize: 20),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: convertToUSD,
                  icon: const Icon(
                    Icons.monetization_on_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Convert To USD",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                      padding:
                          WidgetStateProperty.all(const EdgeInsets.all(10)),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepPurple),
                      shadowColor: WidgetStateProperty.all(Colors.grey),
                      elevation: WidgetStateProperty.all(20)),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text("The amount in USD is",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(" ${result.toStringAsFixed(2)} USD",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
