//
//  BucketlistTableViewCell.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit

class BucketlistTableViewCell: UITableViewCell {
    
    //타입 프로퍼티 활용
    static let identifier = "BucketlistTableViewCell"

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var bucketlistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
}
