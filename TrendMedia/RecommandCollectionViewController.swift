//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView > CollectionView
 Row > Item
 heightForRowAt > ??? (여기선 셀의 너비, 높이가 필요하다) => FlowLayout (heightForItemAt이 없는 이유)
 
 TableView와 CollectionView는 구조가 유사하다!
 */


class RecommandCollectionViewController: UICollectionViewController {

    var imageURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220708_123%2F1657272256389R34Q0_JPEG%2Fmovie_image.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        //컬렉션 뷰의 셜 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        collectionView.collectionViewLayout = layout

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as! RecommandCollectionViewCell
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
                
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.", duration: 1, position: .center)
        
    }

}
