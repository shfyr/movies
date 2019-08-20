//
//  Movie.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 04/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import Foundation

struct MovieList {
    var poster_path: String
    var title: String
    var release_date: String
    var overview: String
    var id: Int
    var original_language: String
    init(dictionary: Dictionary<String, Any>) {
        poster_path = dictionary["poster_path"] as? String ?? " "
        title = dictionary["title"] as? String ?? " "
        release_date = dictionary["release_date"] as? String ?? " "
        overview = dictionary["overview"] as? String ?? " "
        id = dictionary["id"] as? Int ?? 0
        original_language = dictionary["original_language"] as? String ?? " "
    }
}



