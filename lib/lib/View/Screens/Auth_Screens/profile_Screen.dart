
import 'package:cryptocurrency3/lib/View%20Model/Provider/auth_provider.dart';
import 'package:cryptocurrency3/lib/View%20Model/Provider/photo_provider.dart';
import 'package:cryptocurrency3/lib/View%20Model/Provider/thems_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider =Provider.of<Auth_Provider>(context);
    var profileimage = Provider.of<PhotoProvider>(context).imagefile;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius:20,
              backgroundImage:userprovider.user.image==null?FileImage(profileimage!)as ImageProvider:NetworkImage(userprovider.user.image),
            ),
          ),
          SizedBox(height: 20),
          Text("mazinsallam4@gmail.com"),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.dark);
            },
            child: Text("Dark"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.light);
            },
            child: Text("Light"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.system);
            },
            child: Text("System"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<PhotoProvider>(context,listen: false).getimage(ImageSource.camera);
            },
            child: Text("add cam",)

          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<PhotoProvider>(context,listen: false).getimage(ImageSource.gallery);
            },
            child: Text(" from glalery"),
          ),
        ],
      ),
    );
  }
}