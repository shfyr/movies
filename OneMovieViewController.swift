//
//  OneMovieViewController.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 13/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import UIKit

class OneMovieViewController: UIViewController {

    
    var movie: MovieList!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text? = movie.title
        movieReleaseDate.text? = movie.release_date
        movieOverview.text? = movie.overview
        originalLanguage.text? = movie.original_language
        
        let poster_URL = "https://image.tmdb.org/t/p/w500\(movie.poster_path)"
        if let url = URL (string: poster_URL) {
            if let data = try? Data(contentsOf: url) {
                imageView?.image = UIImage(data: data)
            }
            
        }


        
    }
    

    

}
