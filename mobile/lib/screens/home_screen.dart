import 'package:flutter/material.dart';
import 'package:flutter_mindmed_project/screens/lina/lina_screen.dart';
import 'package:flutter_mindmed_project/screens/services/blog/blog_service.dart';
import 'package:flutter_mindmed_project/screens/services/fqas/fqas_service.dart';
import 'package:flutter_mindmed_project/screens/services/test_services/test_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/animation_gif.dart';
import '../widgets/colors.dart';
import '../widgets/const_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void toggleDrawer() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget cardChatBot(onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(right: 20, bottom: 15, top: 10).w,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50).r),
        elevation: 10,
        color: secoundryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ChatBot Service',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: textMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Click to Treat',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: textSecoundColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'yourself',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: textSecoundColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            Image.asset(
              AnimationGif.chatBot,
              height: 120.h,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget linaChatBot(onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(right: 20, bottom: 15, top: 10).w,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50).r),
        elevation: 10,
        color: secoundryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LineaBot Service',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: textMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Click to Treat',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: textSecoundColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'yourself',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: textSecoundColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: const Radius.circular(50).r,
                topRight: const Radius.circular(50).r,
              ),
              child: Image.asset(
                AnimationGif.linachatBot,
                height: 115.h,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compunetService(String text, String videoAnimation,
      {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(right: 10, bottom: 10, top: 8).w,
        elevation: 10,
        color: secoundryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              text,
              style: TextStyle(
                color: textMainColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              videoAnimation,
              width: 140.w,
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _allCompunetService(BuildContext constext) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _compunetService('Test', AnimationGif.test,
                onTap: () => Navigator.of(constext).pushNamed(TestService.id)),
            SizedBox(width: 15.w),
            _compunetService(
              'Blog',
              AnimationGif.blog,
              onTap: () => Navigator.of(constext).pushNamed(BlogService.id),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _compunetService(
              'FQAs',
              AnimationGif.fqas,
              onTap: () => Navigator.of(constext).pushNamed(FqasService.id),
            ),
            SizedBox(width: 15.w),
            _compunetService(
              'Ask Doctor',
              AnimationGif.askDoctor,
            ),
          ],
        ),
      ],
    );
  }

  Widget doctorsSpecialists(String titel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 8,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25).r,
                topRight: const Radius.circular(25).r,
              ),
            ),
            height: 80.h,
            width: 100.w,
            child: Image.asset(
              titel,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Sport \n Psychology',
            style: TextStyle(
              color: textMainColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            '30 doctors',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget getHelp(IconData getIcon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0).w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 8,
        child: SizedBox(
          height: 60.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Row(
              children: [
                Icon(
                  getIcon,
                  color: primaryColor,
                  size: 35.sp,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: textMainColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 25.sp,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 13).w,
              width: double.infinity,
              decoration: BoxDecoration(
                color: thirdColor,
                borderRadius:
                    BorderRadius.only(topRight: const Radius.circular(150).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Service',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  cardChatBot(

                      //!done but scaffold to solu →
                      //*here problem
                      //import
                      //Navigator.of(context).pushNamed(Chatbot.id)
                      () {}),
                  linaChatBot(

                      //!done but scaffold to solu →
                      //*here problem
                      //import

                      () {
                    Navigator.of(context).pushNamed(LinaScreen.id);
                  }),
                  _allCompunetService(context),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Doctors Specialists',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 170.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesOfDoctorsSpecialists.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4).w,
                        child: doctorsSpecialists(
                            imagesOfDoctorsSpecialists[index]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Get Help',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      getHelp(
                        Icons.support_agent_sharp,
                        'Talk to Support',
                      ),
                      getHelp(
                        Icons.help_outline_rounded,
                        'Get Matched to a Terapist',
                      ),
                      getHelp(
                        Icons.wechat_sharp,
                        'Talk to a matching advisor',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
