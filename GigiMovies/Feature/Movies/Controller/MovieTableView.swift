//
//  MovieTableView.swift
//  Marvel
//
//  Created by Anna on 30/05/2021.
//

import UIKit

class MovieTableView: UIView {
    @IBOutlet weak var moviesTableView: UITableView!
    
    private let nibNameCell = "MovieTableViewCell"
    private let nibNameLoadCell = "LoadTableViewCell"
    
    private var isLoading = false
    
    var moviesVC = ViewController() {
        didSet {
            uploadData()
        }
    }
    var movieList = [MovieViewModel]()
    var total = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        setDelegates()
    }
    
    private func uploadData() {
        movieList = moviesVC.moviesVM.movieListVM
        total = moviesVC.moviesVM.totalResults
    }
    
    private func registerNib() {
        let nibNames = [nibNameCell, nibNameLoadCell]
        nibNames.forEach { (name) in
            let nib = UINib(nibName: name, bundle: Bundle.main)
            moviesTableView.register(nib, forCellReuseIdentifier: name)
        }
    }
    
    private func setDelegates() {
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
            isLoading = true
            getMoreMovies()
        }
    }
    
    private func getMoreMovies() {
        let page = moviesVC.moviesVM.page+1
        if Utils.isConnectedToNetwork() {
            moviesVC.moviesVM.getData(page: page) {
                self.uploadData()
                DispatchQueue.main.async {
                    self.moviesTableView.reloadData()
                    self.isLoading = false
                }
            } loadError: {
                Utils.showAlert(self.moviesVC, description: "Ha ocurrido algún error al cargar más películas")
                self.isLoading = false
            }
        } else {
            Utils.showAlert(moviesVC, description: "No tienes conexión a internet")
            isLoading = false
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension MovieTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total > movieList.count ? movieList.count+1 : movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        if index == movieList.count,
           let cell = tableView.dequeueReusableCell(withIdentifier: nibNameLoadCell, for: indexPath) as? LoadTableViewCell {
            return cell
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: nibNameCell, for: indexPath) as? MovieTableViewCell {
            let movie = movieList[index]
            cell.movieImageView.loadImage(stringURL: movie.imageURLString)
            cell.titleLabel.text = movie.title
            cell.descriptionLabel.text = movie.description
            cell.averageLabel.text = movie.voteAverage
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(226)
    }
}
