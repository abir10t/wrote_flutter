##### image picker:


    import 'package:flutter/material.dart';
    import 'package:image_picker/image_picker.dart';
    
    
    Uint8List? _image; /// make a Uint8List type variable

    pickImage(ImageSource source) async{
    
      final ImagePicker _imagepicker = ImagePicker();
      
      XFile? _file = await _imagepicker.pickImage(source: source);

      if(_file != null){return await _file.readAsBytes();}
      
      print('no image selected');
    }
    
    
    void selectImage() async {
          
        Uint8List im = await pickImage(ImageSource.gallery);
        
        setState(() {
          _image = im;
        });
      
      }
      
      
      
   onPressed : selectImage(),
   
   
  - show in view
  
    CircleAvatar( backgroundImage: MemoryImage(_image!),)
      
      
      


        
