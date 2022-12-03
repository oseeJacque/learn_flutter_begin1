import 'package:flutter/material.dart';
import 'package:grid_ui/core/constants/colors.dart';
import 'package:grid_ui/core/widgets/app_text.dart';

import '../../constants/strings.dart';

class AppWidget{


  static SnackBar showSnackBar({required String text}){

    return SnackBar(content:AppText(text,color: AppColors.getWhiteColor,),backgroundColor: AppColors.getblueColor,) ;
  }
  static Widget drawerLeft({required String nom}){
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.getblueColor
          ),
          child: AppText(nom,color: AppColors.getWhiteColor,size: 20.0,)), 

          const ListTile(
            leading: Icon(Icons.call),
            title: AppText(StringData.appeler,color: AppColors.getblueColor,weight: FontWeight.bold,),
          ), 
          const ListTile(
            leading: Icon(Icons.person,),
            title: AppText(StringData.profil,color: AppColors.getblueColor,weight: FontWeight.bold,),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: AppText(StringData.message,color: AppColors.getblueColor,weight: FontWeight.bold,),
          ),
      ]),
    );
  }
}