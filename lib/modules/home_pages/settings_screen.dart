

import 'package:flutter/material.dart';

import '../login_screen/login_screen.dart';
import 'edit_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0,),
            const CircleAvatar(
              radius: 72,
              backgroundColor: Colors.deepOrange,
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage(
                  'assets/images/default_profile_image.jpg',
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            const Text(
              'Mo\'men Harabawy',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40.0,),
            Column(
              children: [
                Row(
                  children:const [
                    Icon(Icons.email_outlined,color: Colors.grey,),
                    SizedBox(width: 16.0),
                    Text(
                      'mo2men12315@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18.0,),
                Row(
                  children: const[
                     Icon(Icons.phone,color: Colors.grey,),
                    SizedBox(width: 16.0),
                    Text(
                      '012525462552',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                color: Colors.deepOrange,
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>EditScreen(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.edit,color: Colors.white,size: 20.0),
                    Expanded(
                      child: Text(
                        'Edit Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                color: Colors.deepOrange,
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=> LoginScreen()),
                          (route) => false
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.logout,color: Colors.white,size: 20.0),
                    Expanded(
                      child: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
