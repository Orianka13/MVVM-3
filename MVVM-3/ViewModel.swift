//
//  ViewModel.swift
//  MVVM-3
//
//  Created by Олеся Егорова on 22.06.2021.
//

import Foundation

class ViewModel: NSObject {
    
    @IBOutlet weak var networkManager: NetworkManager!
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping() -> ()){
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            completion()
        }
    }
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
    }
}
