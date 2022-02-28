

- for creating user with email and pass ->    UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);


- find specific user 
    DocumentSnapshot snap =  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
    username = (snap.data() as Map<String,dynamic>)['username'];
