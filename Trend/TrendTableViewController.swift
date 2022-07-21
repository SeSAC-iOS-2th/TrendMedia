//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        //화면 전환: 1.스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면 전환
        //영화 버튼 클릭 > BucketListTableViewController Present 방식
        //1.
        //BucketListTableViewControll가 'Trend' 스토리보드 상에 있음
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //3.
        self.present(vc, animated: true)
        
    }
    
    @IBAction func dramaButtonClicked(_ sender: Any) {
        
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //2.5.
        vc.modalPresentationStyle = .fullScreen
        
        //3.
        self.present(vc, animated: true)

    }
    
    @IBAction func bookButtonClicked(_ sender: Any) {
        
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //2.5.
        let nav = UINavigationController(rootViewController: vc)
        
        //2.5.
        nav.modalPresentationStyle = .fullScreen
        
        //3.
        self.present(nav, animated: true)

        
    }
}
