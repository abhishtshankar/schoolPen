import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/http_service.dart';

class VerifyEmail extends StatefulWidget {
  late String email;

  VerifyEmail({super.key, required email});

  static const String routeName = '/verify-email';

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late int verificationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/img.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Why Verification?",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                shadows: <Shadow>[
                                  const Shadow(
                                    offset: Offset(1.0, 2.0),
                                    blurRadius: 2.0,
                                    color: Colors.white,
                                  ),
                                ]),
                          ).text.bold.size(32).make(),
                          Text(
                            "It ensures security and access\n             to your account.",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ).text.bold.size(16).make(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      shape: BoxShape.rectangle),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Verify your email",
                            style: GoogleFonts.lato(color: Color(0xff9163D7)),
                          ).text.size(24).bold.make().p(20),
                          Text(
                            "We have sent you a code by email",
                            style: GoogleFonts.lato(color: Colors.grey),
                          ).text.size(19).make().p(20),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.symmetric(horizontal: 50),
                            child: VxTextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  verificationCode = value as int;
                                });
                              },
                            ).p(20),
                          ),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width - 20,
                                    49)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff9163D7))),
                            child: Text(
                              "Login",
                              style: GoogleFonts.lato(color: Colors.white),
                            ).text.make(),
                            onPressed: () async {
                              //passing the textfield values to verify email api
                              await HttpService.verifyCode(
                                  widget.email, context);

//navigating next page for verification of email
                              Navigator.pushNamed(
                                  context, VerifyEmail.routeName);
                            },
                          ).p12(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didnt you receive any code? ",
                                style: GoogleFonts.lato(),
                              ).text.gray500.make(),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Resend Code",
                                    style: TextStyle(color: Color(0xff9163D7)),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
