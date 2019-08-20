//
//  Model.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 04/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import Foundation

var movies: [MovieList] = []
var userRequest: String = " "
var  downloadTask: URLSessionDownloadTask?

var urlToData: URL {
    let tempPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    let path = "\(tempPath)/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadMovies (completionHandler: (()->Void)?) {
    downloadTask?.cancel()
     movies.removeAll()
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=69c974d356faeb073d5dab463e8a63e5&query=\( movieToSearch)")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {

            try? FileManager.default.removeItem(at: urlToData)
            try?  FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
           
            parseMovies()
            completionHandler?()
            print(movies)
//            print(movieToSearch)
        }
    }
    downloadTask.resume()
    }

func parseMovies() {
    
   
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String,Any>
    if rootDictionary == nil {
        return
    }
    
    if let array = rootDictionary!["results"] as? [Dictionary<String, Any>] {
        var returnArray: [MovieList] = []
        
        for dict in array {
            let newMovie = MovieList(dictionary: dict)
            returnArray.append(newMovie)
    }
        movies = returnArray
   
    }
    
    
}

