import 'package:coazykos/pages/home_pages.dart';
import 'package:coazykos/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/error.png',
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'where are you going?',
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were\n requested is already gone',
              style: grayTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 210,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(purplecolor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                child: Text(
                  'Back To Home',
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
