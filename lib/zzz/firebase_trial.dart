import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:shoe_kart/zzz/firebase_trail_function.dart';
import 'package:image_picker/image_picker.dart';
import 'firebase_trial_model.dart';
import 'dart:io';

class FirebaseTrail extends StatefulWidget {
  FirebaseTrail({super.key});
  @override
  State<FirebaseTrail> createState() => _FirebaseTrailState();
}

class _FirebaseTrailState extends State<FirebaseTrail> {
  late String imageUrl='';
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  final firebaseClass = FirebaseClass(); // Assuming your other function
 final firebaseInstance= FirebaseFirestore.instance;
  CollectionReference adsRef = FirebaseFirestore.instance.collection('todo');
  CollectionReference logoRef = FirebaseFirestore.instance.collection('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Enter your title',
            ),
          ),
          TextField(
            controller: subtitleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Enter your title',
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    String title= titleController.text;
                    String subTitle=subtitleController.text;
                    await firebaseClass.createTodo(
                        title: title,
                        subtitle: subTitle,
                        imageUrl: imageUrl);
                    setState(() {

                    });
                  },
                  child: Text('add')),
              ElevatedButton(
                onPressed: () async {
                 await pickImageFromGallery();
                },
                child: const Text('Pick Image fom gallary'),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: adsRef.snapshots(),
              builder: (context, snapshot) {
                print(adsRef);
                print(adsRef.snapshots());
                print('inside steam builder');
                  return  ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      print('inside listbiew');
                      final DocumentSnapshot todoSnap =
                      snapshot.data!.docs[index];
                      final String documentId = todoSnap.id;
                      final todo = TodoModelClass.fromFirebase(
                          todoSnap.data() as Map<String, dynamic>);
                      return Card(
                          child: Container(
                            height: 330,
                            width: double.infinity,

                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 300,
                                      width: 210,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(todo.imageUrl),
                                          fit: BoxFit.cover,
                                        ),),

                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          todo.title,
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        Text(todo.subtitle,
                                            style: TextStyle(fontSize: 30)),
                                        OutlinedButton(onPressed: ()async{
                                          final  titleController =TextEditingController();
                                          final subtitleController = TextEditingController();
                                          final urlController = TextEditingController();

                                          showDialog(context: (context), builder: (builder){
                                            titleController.text=todo.title;
                                            subtitleController.text=todo.subtitle;
                                            urlController.text=todo.imageUrl;
                                            return   AlertDialog(
                                              title: Text('Edit Todo'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: titleController,
                                                    decoration: InputDecoration(hintText: 'Enter Title'),
                                                  ),
                                                  SizedBox(height: 10),
                                                  TextField(
                                                    controller: subtitleController,
                                                    decoration: InputDecoration(hintText: 'Enter Subtitle'),
                                                  ),
                                                  ElevatedButton(onPressed: () async {
                                                    await pickImageFromGallery();
                                                    urlController.text=imageUrl;
                                                    setState(() {

                                                    });

                                                  }, child: Text('Browse')),
                                                  Text(urlController.text),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    String updteTitle =titleController.text;
                                                    String updateSubtitle = subtitleController.text;
                                                    String updateUrl =imageUrl;
                                                    setState(() {

                                                    });
                                                    await firebaseClass.updateTodo(documentId, updteTitle, updateSubtitle, updateUrl);

                                                  },
                                                  child: Text('Submit'),
                                                ),
                                              ],
                                            );;
                                          });
                                          //


                                        }, child: Text('Edit')),
                                        OutlinedButton(onPressed: ()async{
                                          try {
                                            await adsRef.doc(documentId).delete();
                                            setState(() {});
                                            print('Document deleted successfully!');
                                           await FirebaseStorage.instance.ref('image').child('1709297519204687').delete();

                                          } catch (error) {
                                            print('Error deleting document: $error');
                                          }


                                        }, child: Text('Delete')),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                      );
                    },
                  );

              },
            ),
          )
        ],
      ),
    );
  }
   deleteFireStoreData(String filePath) async {
    Reference storageRef = FirebaseStorage.instance.ref(filePath);
    await storageRef.delete();
  }




  Future pickImageFromGallery() async {
    String uniqueId = DateTime.now().microsecondsSinceEpoch.toString();
    XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(selectedImage?.path);
    //upload to firebase storage
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('Image');
    //create a reference to store image
    Reference referenceToUploadImage = referenceDirImage.child(uniqueId);
    //store the selectedImage
    await referenceToUploadImage.putFile(File(selectedImage!.path));
    imageUrl = await referenceToUploadImage.getDownloadURL();
    setState(() {

    });

    //=========================



    }
}
