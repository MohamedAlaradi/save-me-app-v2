//
//  Category.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/22/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import Foundation
struct ServiceCategory {
    var catgeory_id : Int
    var category : String
    var services = [Service?]()
    var isExpanded : Bool
}
