//
//  TableViewController.swift
//  Movies
//
//  Created by Elizaveta Prokudina on 10/08/2019.
//  Copyright © 2019 Elizaveta Prokudina. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadMovies {
            DispatchQueue.main.async {
                   self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let movie = movies[indexPath.row]
        let poster_URL = "https://image.tmdb.org/t/p/w500\(movie.poster_path)"

        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.release_date
        
        if let url = URL (string: poster_URL) {
            if let data = try? Data(contentsOf: url) {
                 cell.imageView?.image = UIImage(data: data)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneMovie", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneMovie" {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as? MovieViewController)?.movie = movies[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
  
