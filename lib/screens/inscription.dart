import 'package:flutter/material.dart';
import 'package:grid_ui/core/constants/assets.dart';
import 'package:grid_ui/core/constants/colors.dart';
import 'package:grid_ui/core/constants/strings.dart';
import 'package:grid_ui/core/widgets/app_input.dart';
import 'package:grid_ui/core/widgets/app_text.dart';
import 'package:grid_ui/core/widgets/utils/widgets_all.dart';

class UserInscription extends StatefulWidget {
  const UserInscription({super.key});

  @override
  State<UserInscription> createState() => _UserInscriptionState();
}

class _UserInscriptionState extends State<UserInscription> {
  int _selectedIndex = 0; //New
  late TextEditingController nameController;
  late TextEditingController passwordController;
  String? _sexe;
  bool? _football = false; //Checkbox
  bool? _music = false; //Checkbox music
  bool? _mangas = false; //checkBox manga
  final formKey = GlobalKey<FormState>();
  bool _loading = false; //Cle du formulaire
  bool _displayInfo = false; //controle du loader
  String _nom = StringData.nomExample;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          StringData.userInformation,
          color: AppColors.getWhiteColor,
          size: 20.0,
          weight: FontWeight.bold,
        ),
        centerTitle: true,

        //leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: AppColors.getWhiteColor,)),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    AppWidget.showSnackBar(text: StringData.mesNotification));
              },
              tooltip: StringData.mesNotification,
              icon: const Icon(
                Icons.notification_add_sharp,
                color: AppColors.getWhiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.getWhiteColor,
              ))
        ],
      ),
      drawer: AppWidget.drawerLeft(nom: _nom),
      backgroundColor: AppColors.getWhiteColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: StringData.inscription),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_rounded,
                ),
                label: StringData.information),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: StringData.parametre)
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              AppWidget.showSnackBar(text: StringData.floatingClique));
        },
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .02,
              ),
              const Center(
                  child: AppText(
                StringData.informationUtilisateur,
                color: AppColors.getblueColor,
                size: 25.0,
                weight: FontWeight.bold,
              )),
              SizedBox(
                height: height * .03,
              ),
              Image.asset(
                AssetData.logo,
                scale: 5,
              ),
              SizedBox(
                height: height * .03,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //Nom
                      AppInput(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                                color: AppColors.getGreyColor,
                              )),
                          label: StringData.nomPrenom,
                          hasSuffix: true,
                          controller: nameController,
                          validator: (value) {
                           if(value !=null && value.isNotEmpty){
                              return null;
                            }else{
                              return StringData.eerorMessage;
                            }
                          }),
                      SizedBox(
                        height: height * .02,
                      ),

                      //Password
                      AppInput(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.lock,
                                color: AppColors.getGreyColor,
                              )),
                          label: StringData.motDePasse,
                          hasSuffix: true,
                          controller: passwordController,
                          validator: (value) {
                             if(value !=null && value.isNotEmpty){
                              return null;
                            }else{
                              return "Ce champ est obligatoire";
                            }
                          }),
                      dropDown(),
                    ],
                  )),
              SizedBox(
                height: height * .03,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppText(
                      StringData.passTemp,
                      color: AppColors.bgColor,
                    ),

                    //Footbal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _football,
                            onChanged: (bool? b) {
                              setState(() {
                                _football = b;
                              });
                            }),
                        const AppText(
                          StringData.football,
                          color: AppColors.bgColor,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _music,
                            onChanged: (bool? b) {
                              setState(() {
                                _music = b;
                              });
                            }),
                        const AppText(
                          StringData.musique,
                          color: AppColors.bgColor,
                        )
                      ],
                    ),

                    //Manga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _mangas,
                            onChanged: (bool? b) {
                              setState(() {
                                _mangas = b;
                              });
                            }),
                        const AppText(
                          StringData.manga,
                          color: AppColors.bgColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              _loading
                  ? const CircularProgressIndicator(
                      color: AppColors.getblueColor,
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              _loading = false;
                              _showDialogue();
                            });
                          }
                        });
                      },
                      child: const AppText(
                        StringData.valider,
                        color: AppColors.getWhiteColor,
                      )),
              const SizedBox(
                height: 20.0,
              ),
              _displayInfo
                  ? _myCard()
                  : const SizedBox(
                      height: 30.0,
                    ),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return DropdownButtonFormField(
        style: const TextStyle(color: AppColors.getblueColor),
        decoration: const InputDecoration(
          icon: Icon(Icons.transgender),
          hintText: StringData.votreSexe,
          label: AppText(StringData.sexe),
        ),
        items: ["Masculin", "Feminin", "Autre"]
            .map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
              value: value,
              child: AppText(
                value,
                color: AppColors.getblueColor,
              ));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _sexe = value;
          });
        });
  }

  void _showDialogue() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const AppText(StringData.alert, color: AppColors.bgColor),
            content: const AppText(StringData.mot, color: AppColors.bgColor),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const AppText(StringData.cancel,
                      color: AppColors.bgColor)),
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    setState(() {
                      _loading = true;
                    });
                    Future.delayed(const Duration(seconds: 5), (() {
                      setState(() {
                        _loading = false;
                        _nom = nameController.text;
                        _displayInfo = true;
                      });
                    }));
                  }),
                  child: const AppText(
                    StringData.valider,
                    color: AppColors.bgColor,
                  ))
            ],
          );
        });
  }

  Widget _myCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: RichText(
                text: TextSpan(children: [
              const TextSpan(
                text: StringData.appelle,
                style: TextStyle(color: AppColors.bgColor),
              ),
              TextSpan(
                  text: _nom,
                  style: const TextStyle(
                      color: AppColors.bgColor, fontWeight: FontWeight.bold))
            ])),
            subtitle: const AppText(StringData.passions),
          ),
          Column(
            children: [
              (_mangas != null && _mangas == true)
                  ? const AppText(StringData.manga)
                  : const SizedBox(),
              (_football != null && _football == true)
                  ? const AppText(StringData.football)
                  : const SizedBox(),
              (_music != null && _music == true)
                  ? const AppText(StringData.musique)
                  : const SizedBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {}, child: const AppText(StringData.ajouter,size: 20.0,weight: FontWeight.bold,)),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _displayInfo=false;
                    });
                  }, child: const AppText(StringData.delete,color: AppColors.getRedColor,weight: FontWeight.bold,size: 20.0,))
            ],
          )
        ],
      ),
    );
  }
}
