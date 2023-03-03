import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

String userId = FirebaseAuth.instance.currentUser!.uid;
