//
//  FirstViewController.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 14/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import UIKit


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
 
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

var searchMovie = " "

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    @IBOutlet weak var movieToSearch: UITextField!
    
    @IBAction func movieToSerchButton(_ sender: Any) {
        searchMovie  = String(movieToSearch.text!)
        searchMovie  = searchMovie.replacingOccurrences(of: " ", with: "+")
        performSegue(withIdentifier: "goToFoundMovies", sender: self)
    }

}
