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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
    }
    
    @objc func resetButtonClicked() {
        
        //iOS13+ SceneDelegate 쓸 때 동작하는 코드
        //기존에 있던 데이터는 날라가고 초기 화면으로 돌아감
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AnyViewController") as! AnyViewController

        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        
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
        
        //print("didSelectRowAt") //동작하지 않는다면? 1. TableView가 noSelection 2. 셀 위에 전체 버튼
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewCell") as! RecommandCollectionViewController
        
        //2. 값 전달 - vc가 가지고 있는 프로퍼티에 넣기
        vc.movieData = movieList.movie[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
