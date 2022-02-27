##### image picker:


    import 'package:flutter/material.dart';
    import 'package:image_picker/image_picker.dart';

    pickImage(ImageSource source) async
    {
      final ImagePicker _imagepicker = ImagePicker();

      XFile? _file = await _imagepicker.pickImage(source: source);

      if(_file != null){return await _file.readAsBytes();}
      print('no image selected');
    }
    
    
    
    
    
    
    
    Uint8List? _image;
    
          void selectImage() async
       {

        Uint8List im = await pickImage(ImageSource.gallery);
        setState(() {
          _image = im;
        });
      }
      
      
      
      
      
      
      
      onPressed : selectImage(),
      
      
      
      
      
      
       CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.white,
                  )
      
      
      


        
