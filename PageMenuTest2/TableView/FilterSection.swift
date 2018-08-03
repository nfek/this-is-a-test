//
//  FilterSection.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 31/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import Foundation
struct FilterSection{
    var genre : String!
    var movies : [String]!
    var expanded : Bool!
    var subtitle : String!
    
    init(genre : String, movies : [String], expanded : Bool, subtitle : String){
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
        self.subtitle = subtitle
    }
    
}
