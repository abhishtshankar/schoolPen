import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../service/http_service.dart';
import 'login_page.dart';

class SignUpStep2Screen extends StatefulWidget {
  const SignUpStep2Screen({super.key});

  @override
  State<SignUpStep2Screen> createState() => _SignUpStep2ScreenState();
}

class _SignUpStep2ScreenState extends State<SignUpStep2Screen> {
  late String email;
  late String instituteName;
  late String address;
  late String udiseCode;
  late String document;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration:const BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/images/img.png",)
                      ,fit: BoxFit.fill,),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Almost Done!",style: GoogleFonts.poppins(color: Colors.white,shadows:  <Shadow>[
                          const Shadow(
                          offset: Offset(1.0, 2.0),
                            blurRadius: 2.0,
                            color: Colors.white,
                          ),
                    ] ),).text.bold.size(32).make(),
                              Text("Only the last step of the process \n                     remains.",style: GoogleFonts.poppins(color: Colors.white),).text.bold.size(16).make(),

                            ],
                          ),
                        ),
                      ],
                  ),
                ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height /1.65,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          shape: BoxShape.rectangle
                      )     ,
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Enter your school info",style: GoogleFonts.lato(color: Color(0xff9163D7)),).text.size(24).bold.make().p(20),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                              //   child: VxTextField(
                              //     hint: "Email",
                              //     onChanged: (value){
                              //     setState(() {
                              //       email=value;
                              //     });
                              //
                              //     },
                              //
                              //   ).p(20),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    hintText: '   School Name',
                                    fillColor: Color(0xFFE7D8F8),
                                    filled: true,
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  onChanged: (value) {
                                       setState(() {
                                         email=value;
                                       });                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                              //   child: VxTextField(
                              //     hint: "Institute Name",
                              //     onChanged: (value){
                              //     setState(() {
                              //       instituteName=value;
                              //     });
                              //
                              //     },
                              //
                              //   ).p(20),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    hintText: '   Address',
                                    fillColor: Color(0xFFE7D8F8),
                                    filled: true,
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      instituteName=value;
                                    });                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                              //   child: VxTextField(
                              //     hint: "UDISE code",
                              //     onChanged: (value){
                              //     setState(() {
                              //       udiseCode=value;
                              //     });
                              //
                              //     },
                              //
                              //   ).p(20),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    hintText: '   DIOS Code',
                                    fillColor: Color(0xFFE7D8F8),
                                    filled: true,
                                    suffixIcon: SvgPicture.asset(
                                      'assets/images/group3883.svg',
                                      width: 0.01,
                                      height: 0.01,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      udiseCode=value;
                                    });                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                              //   child: VxTextField(
                              //     hint: "Upload Document",
                              //     onChanged: (value){
                              //     setState(() {
                              //       document=value;
                              //     });
                              //     },
                              //   ).p(20),
                              // ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    hintText: '   Upload Document',
                                    fillColor: Color(0xFFE7D8F8),
                                    filled: true,
                                    suffixIcon: SvgPicture.asset(
                                      'assets/images/document upload.svg',
                                      width: 0.01,
                                      height: 0.01,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      document=value;
                                    });                                },
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.0),

                                        )
                                    ),
                                minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width - 20, 49)),
                                  backgroundColor: MaterialStateProperty.all(Color(0xff9163D7))
                                ),
                                child: Text("Login",style: GoogleFonts.lato(color:Colors.white),).text.make(),
                                onPressed: ()async {
                                  //passing the textfield values to signupStep1 api
                  await HttpService.signupStep2(email,instituteName, address,udiseCode,document, context);
 },
                              ).p12(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account ? ",style: GoogleFonts.lato(),).text.gray500.make(),
                                  TextButton(onPressed: (){
                                    setState(() {
                                      // _auth = Auth.sigin;
                                    });

                                  }, child: const Text("LogIn",style: TextStyle(
                                    color: Color(0xff9163D7)
                                  ),))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
    ]


    )
      )
    );
  }
}