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
    
//    func titleLabelDesign(label: UILabel, title: String) {
//        label.text = title
//        label.font = .boldSystemFont(ofSize: 17)
//    }
//    func dateLabelDesign(label: UILabel, date: String) {
//        label.text = date
//        label.font = .boldSystemFont(ofSize: 15)
//    }
//    func plotLabelDesign(label: UILabel, plot: String) {
//        label.text = plot
//        //numberOfLines가 0이면, 줄이 무한대로 늘어날 수 있다.
//        label.numberOfLines = 0
//        label.font = .boldSystemFont(ofSize: 15)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)

//        switch indexPath.section {
//        case 0:
//            titleLabelDesign(label: cell.movieTitleLabel, title: "해리 포터 20주년: 리턴 투 호그와트")
//            dateLabelDesign(label: cell.releaseDateLabel, date: "2022. 01. 01 | EN")
//            plotLabelDesign(label: cell.moviePlotLabel, plot: "'해리포터와 마법사의 돌' 20주년 기념 스페셜. 다니엘 래드클리프, 루퍼트 그린트, 엠마 왓슨을 포함한 캐스트, 감독들이 재결합해 해리포터 프랜차이즈의 첫 영화를 회고하고, 축하하는 시간")
//        case 1:
//            titleLabelDesign(label: cell.movieTitleLabel, title: "해리 포터와 잉크 마법사의 여행")
//            dateLabelDesign(label: cell.releaseDateLabel, date: "2020. 12. 01 | EN")
//            plotLabelDesign(label: cell.moviePlotLabel, plot: "해리 포터를 테마로 한 최초의 타투 컨벤션 '리터러리 잉크' 테네시 주에서 개최된 이 컨벤션에 참가하기 위해 전 세계 70여 명 이상의 타투이스트들이 모였다. 해리 포터라는 공통된 관심사로 뭉친 이")
//        case 2:
//            titleLabelDesign(label: cell.movieTitleLabel, title: "해리 포터와 죽음의 성물 1")
//            dateLabelDesign(label: cell.releaseDateLabel, date: "2010. 10. 17 | EN")
//            plotLabelDesign(label: cell.moviePlotLabel, plot: "덤블도어 교장의 죽음 이후, 마법부는 죽음을 먹는 자들에게 점령당하고 호그와트는 위기에 빠진다. 성년이 되며 해리를 지켜주던 수호 마법은 사라지고 해리와 론, 헤르미온느는 볼드모트 영혼의")
//        case 3:
//            titleLabelDesign(label: cell.movieTitleLabel, title: "해리 포터와 죽음의 성물 2")
//            dateLabelDesign(label: cell.releaseDateLabel, date: "2011. 07. 07 | EN")
//            plotLabelDesign(label: cell.moviePlotLabel, plot: "덤블도어 교장이 남긴 죽음의 성물의 단서를 쫓던 해리 포터는 볼드모트가 그토록 찾아 다닌 절대적인 힘을 가진 지팡이의 비밀을 통해 드디어 마지막 퍼즐을 완성한다. 볼드모트의 영혼이 담긴")
//
//        case 4:
//            titleLabelDesign(label: cell.movieTitleLabel, title: "해리 포터와 불의 잔")
//            dateLabelDesign(label: cell.releaseDateLabel, date: "2005. 11. 16 | EN")
//            plotLabelDesign(label: cell.moviePlotLabel, plot: "요즘 들어 매일 꾸는 악몽 때문에 이마의 상처에 더욱 통증을 느끼는 해리는 친구 론과 헤르미온느와 함께 퀴디치 월드컵에 참가해 악몽에서 벗어날 수 있게 돼 마냥 기쁘다. 그러나 퀴디치 캠프장")
//        default:
//            break
//        }
        
        return cell
    }
        
}
