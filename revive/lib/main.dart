
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Screens/Admin/advideo.dart';
import 'package:revive/Screens/Therapist/uploadvideo.dart';
import 'package:revive/Screens/Therapist/view.dart';
import 'package:revive/Screens/Therapist/yourActivity.dart';
import 'package:revive/Screens/User/21-day.dart';
import 'package:revive/Screens/features/notifications.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/screens/general/awareness.dart';

import 'package:revive/Screens/Admin/adonboard.dart';
import 'package:revive/Screens/Admin/adhome.dart';
import 'package:revive/Screens/Admin/confirmtherapist.dart';
import 'package:revive/Screens/Admin/viewarticle.dart';
import 'package:revive/Screens/Admin/viewfeedback.dart';
import 'package:revive/Screens/Admin/viewpayment.dart';
import 'package:revive/Screens/Admin/viewtherapist.dart';
import 'package:revive/Screens/Admin/viewuser.dart';
import 'package:revive/Screens/Admin/addadmin.dart';
import 'package:revive/Screens/Therapist/tharticles.dart';
import 'package:revive/Screens/Therapist/thdash.dart';
import 'package:revive/Screens/Therapist/thedit.dart';
import 'package:revive/Screens/Therapist/thhome.dart';
import 'package:revive/Screens/Therapist/thonboard.dart';
import 'package:revive/Screens/Therapist/thprofile.dart';
import 'package:revive/Screens/User/21first.dart';
import 'package:revive/Screens/User/Useronboard.dart';
import 'package:revive/Screens/User/assesmentreport.dart';
import 'package:revive/Screens/User/editprofile.dart';
import 'package:revive/Screens/User/exercise1.dart';
import 'package:revive/Screens/User/explore.dart';
import 'package:revive/Screens/User/history.dart';
import 'package:revive/Screens/User/userdashboard.dart';
import 'package:revive/login.dart';
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
import 'package:revive/Home.dart';
import 'package:revive/Screens/User/viewTherapist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revive/firebase_options.dart';


Future<void> main() async {

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>AuthProvider(),
      child: MaterialApp(
        title: 'Revive',
        debugShowCheckedModeBanner: false,
        
        home:
        
        
        AuthWrapper(),
        routes: {
          '/Splash2':(context) => Splash2(),
          '/home':(context) {
            final authProvider = Provider.of<AuthProvider>(context, listen: false);
            return Home(user: authProvider.user!);
          },
          '/mycare':(context) => myCare(),  
          '/mytest':(context) => MyTest(),
          '/myjournal':(context) => DiaryEntriesScreen(), 
          '/register':(context)=>UserRegister(),
          '/login':(context) => UserLogin(),
          '/uprofile':(context) {
            final authProvider = Provider.of<AuthProvider>(context, listen: false);
            return userProfile(user: authProvider.user!);
          },
         '/uonboard': (context) => UserOnboard(user: Provider.of<AuthProvider>(context, listen: false).user!),
          '/anxiety':(context) => AnxietyTest(),
          '/stress':(context) => stressTest(),
          '/depression':(context) => depressionTest(),
          '/relations':(context) => relatioTest(),
          '/SUD':(context) => SudTest(),
          '/aware':(context)=>AwarenessScreen(),
          '/challenge':(context) =>ChallengeFirstScreen(),
          '/21day':(context)=>ChallengeScreen(),
          '/explore':(context) => VideoListPage(),
          '/therapist':(context) => TherapistListScreen(),
          '/diet':(context) => DietingScreen(),
          '/exercise':(context)=>ExerciseListScreen(),
          '/thhome':(context)=>TherapistHome(),
          '/thprofile':(context)=>ThProfile(),
          '/userdash':(context)=>UserDashboard(),
          '/thdash': (context) => ThDashboard(), 
          //userProfile
          '/edituser':(context)=>EditProfileScreen(),
          '/userhistory':(context)=>UserHistory(),
          '/reportcard':(context)=>AssessmentReportScreen(),
          // '/favorite':(context)=>MyFavoritesScreen(), 
          //general 
          '/privacy':(context) => PrivacyPolicyScreen(),
          '/terms':(context) => TermsAndConditionsScreen(),
          '/adhome':(context)=>AdHome(),
          '/adboard':(context)=>AdminOnboard(user: Provider.of<AuthProvider>(context, listen: false).user!),
          '/adtherapist':(context)=>ViewTherapistScreen(),
          '/adconfirm':(context)=>ConfirmRequestScreen(),
          '/adarticle':(context) => ViewArticleScreen(),
          '/adfeedback':(context)=>ViewFeedbackScreen(),
          '/viewuser':(context)=>ViewUserScreen(),
          '/viewPayment':(context) => ViewPayment(),
          //therapist
          '/thedit':(context)=>ThEditProfile(),
          '/tharticle':(context) => AddArticleScreen(),
         '/thonboard': (context) => TherapistOnboardingScreen(user: Provider.of<AuthProvider>(context, listen: false).user!),
          '/notification':(context)=>NotificationScreen(),
          '/yourActivity':(context)=>YourActivity(),
          '/uploadVideo':(context)=>UploadVideoPage(),
          '/therapistProfile': (context) => TherapistProfileScreen(),
          '/addAdmin':(context)=>AddRegister(),
          '/advideo':(context) => AdVideoListPage()
          
         }, 
         
      ),
    ); 
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.user == null) {
      return Splash2();
    } else if (authProvider.user!.role == 'User') {
      return UserOnboard(user:authProvider.user!);
    } else if (authProvider.user!.role == 'Therapist') {
      return TherapistOnboardingScreen(user:authProvider.user!);
    } else if (authProvider.user!.role == 'Admin') {
      return AdminOnboard(user:authProvider.user!);
    } else {
      return Home(user:authProvider.user!);
    }
  }
}


