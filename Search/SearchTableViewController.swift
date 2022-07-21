//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {

    var movieList = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRowAt") //동작하지 않는다면? 1. TableView가 noSelection 2. 셀 위에 전체 버튼
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewCell") as! RecommandCollectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
