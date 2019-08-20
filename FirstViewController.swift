//
//  FirstViewController.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 14/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import UIKit

var movieToSearch = ""

class FirstViewController: UIViewController {

    @IBOutlet weak var searchMovie: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    @IBAction func searchButton(_ sender: Any) {
        movieToSearch = searchMovie.text!
         performSegue(withIdentifier: "goToFoundMovies", sender: self)
       movieToSearch = searchMovie.text!
    }
    
   
}
