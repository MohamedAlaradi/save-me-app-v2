//
//  Constants.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/11/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase


struct Constants {
    struct StoryBoard {
        static let homeViewController = "HomeVC"
    }
    
    struct FireStore {
        static let db = Firestore.firestore()
        static var users : [Structures.user] = []
        
        static func updateUsers() {
           

        }
        
        
    }
}
