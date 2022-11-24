//
//  Constants.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/16/22.
//

import Firebase

///Access firestore collection "users"
let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
