//
//  Constants.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/16/22.
//

import Firebase

///Access firestore collection "users"
let COLLECTION_USERS = Firestore.firestore().collection("users")
///Access firestore collection "followers"
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
///Access firestore collection "following"
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
///Access firestore collection "posts"
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
///Access firestore collection "notifications"
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
