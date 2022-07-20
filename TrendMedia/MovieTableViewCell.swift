//
//  MovieTableViewCell.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moviePlotLabel: UILabel!
    
    //SearchTableViewController에서 너무 길어지는 코드들은 이 곳에서 함수를 만들어 사용 가능!!
    //바로 가져오지 못하는 요소들은 매개변수로 가져오면 됨
    func configureCell(data: Movie) {
        
        movieTitleLabel.font = .boldSystemFont(ofSize: 15)
        movieTitleLabel.text = data.title
        releaseDateLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        moviePlotLabel.text = data.overview
        moviePlotLabel.numberOfLines = 0
    }
}
