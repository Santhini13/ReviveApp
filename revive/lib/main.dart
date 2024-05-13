import 'package:flutter/material.dart';
import 'package:revive/Models/appointment.dart';
import 'package:revive/Models/awareness.dart';
import 'package:revive/Models/chatlist.dart';
import 'package:revive/Models/communitychat.dart';
import 'package:revive/Screens/Admin/adonboard.dart';
import 'package:revive/Screens/Admin/adhome.dart';
import 'package:revive/Screens/Admin/confirmtherapist.dart';
import 'package:revive/Screens/Admin/viewarticle.dart';
import 'package:revive/Screens/Admin/viewfeedback.dart';
import 'package:revive/Screens/Admin/viewtherapist.dart';
import 'package:revive/Screens/Therapist/tharticles.dart';
import 'package:revive/Screens/Therapist/thdash.dart';
import 'package:revive/Screens/Therapist/thedit.dart';
import 'package:revive/Screens/Therapist/thhome.dart';
import 'package:revive/Screens/Therapist/thprofile.dart';
import 'package:revive/Screens/User/assesmentreport.dart';
import 'package:revive/Screens/User/editprofile.dart';
import 'package:revive/Screens/User/exercise1.dart';
import 'package:revive/Screens/User/explore.dart';
import 'package:revive/Screens/User/favourite.dart';
import 'package:revive/Screens/User/history.dart';
import 'package:revive/Screens/User/userdashboard.dart';
import 'package:revive/login.dart';
import 'package:revive/Screens/User/21-day.dart';
import 'package:revive/Screens/User/mycare.dart';
import 'package:revive/Screens/User/mytest.dart';
import 'package:revive/privacy.dart';
import 'package:revive/Screens/User/profile.dart';
import 'package:revive/register.dart';
import 'package:revive/terms.dart';
import 'package:revive/Screens/User/test/anxiety.dart';
import 'package:revive/Screens/User/test/depression.dart';
import 'package:revive/Screens/User/test/relationship.dart';
import 'package:revive/Screens/User/test/stress.dart';
import 'package:revive/Screens/User/test/sud.dart';
import 'package:revive/Screens/User/viewjournal.dart';
import 'package:revive/Splash2.dart';
import 'package:revive/Screens/User/diet.dart';
import 'package:revive/home.dart';
import 'package:revive/Screens/User/viewTherapist.dart';


void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revive',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff881736)),
      //   useMaterial3: true,
      // ),
      // ignore: prefer_const_constructors
      home:Splash2(),
      routes: {
        '/Splash2':(context) => Splash2(),
        //'/login':(context) => Login(),
        //'/register':(context) => Register(),
        '/home':(context) => Home(),
        '/mycare':(context) => myCare(),  
        '/mytest':(context) => MyTest(),
        '/myjournal':(context) => DiaryEntriesScreen(),
        //'/viewjournal':(context) => viewJournal(),
        '/register':(context)=>UserRegister(),
        '/login':(context) => UserLogin(),
        '/uprofile':(context) => userProfile(),
        '/anxiety':(context) => AnxietyTest(),
        '/stress':(context) => stressTest(),
        '/depression':(context) => depressionTest(),
        '/relations':(context) => relatioTest(),
        '/SUD':(context) => SudTest(),
        '/aware':(context)=>AwarenessScreen(),
        '/challenge':(context) => ChallengeScreen(),
        '/schedules':(context)=>DoctorAppointmentsPage(),
        '/explore':(context) => ExplorePage(),
        '/therapist':(context) => TherapistListScreen(),
        '/diet':(context) => DietingScreen(),
        '/exercise':(context)=>ExerciseListScreen(),
        '/thhome':(context)=>TherapistHome(),
        '/thprofile':(context)=>ThProfile(),
        '/userdash':(context)=>UserDashboard(),
        '/thdash':(context)=>ThDashboard(),
        '/communitychat':(context)=>CommunityChatScreen(),
        '/chat':(context) => ChatRoomScreen(),
        //userProfile
        '/edituser':(context)=>EditProfileScreen(),
        '/userhistory':(context)=>UserHistory(),
        '/reportcard':(context)=>AssessmentReportScreen(),
        '/favorite':(context)=>MyFavoritesScreen(),
        //general
        '/privacy':(context) => PrivacyPolicyScreen(),
        '/terms':(context) => TermsAndConditionsScreen(),
        '/adhome':(context)=>AdHome(),
        '/adboard':(context)=>AdminOnboard(),
        '/adtherapist':(context)=>ViewTherapistScreen(),
        '/adconfirm':(context)=>ConfirmRequestScreen(),
        '/adarticle':(context) => ViewArticleScreen(),
        '/adfeedback':(context)=>ViewFeedbackScreen(),
        //therapist
        '/thedit':(context)=>ThEditProfile(),
        '/tharticle':(context) => AddArticleScreen()
       },
       
    ); 
  }
}