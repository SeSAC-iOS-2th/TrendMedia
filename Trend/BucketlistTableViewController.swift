//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit
import MapKit

class BucketlistTableViewController: UITableViewController {
    
    //타입 프로퍼티 활용
    static let identifier = "BucketlistTableViewController"
    
    @IBOutlet weak var userTextField: UITextField!

    var list = ["부산행", "28주후", "킹덤", "새벽의 저주"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
        
        list.append("창궐")
        list.append("지금 우리 학교는")
        
        navigationItem.title = "버킷리스트"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }

    @IBAction func userTextFieldEntered(_ sender: UITextField) {
        
        //옵셔널 바인딩
        //case 2. if let
        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
            list.append(value)
            tableView.reloadData()
        } else {
            //토스트 메시지 띄우기
        }
        
        //case 3. guard 구문으로 활용
        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
            //Alert, Toast Message를 통해서 빈칸을 입력했다, 글자 수가 많다 등 출력
            return
        }
        
        list.append(userTextField.text!)
        tableView.reloadData()

        
            
        //case 1.
        //list.append(userTextField.text!)
        //tableView.reloadData()
        
        //tableView.reloadSections(IndexSet, with: .automatic)
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell 내 아울렛들을 쓰기 위한 코드
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewCell.identifier, for: indexPath) as! BucketlistTableViewCell //as? 타입 캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 14)
        
        return cell
    }
    
    //편집 기능을 넣어주는 것
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //배열 삭제 후 테이블 뷰 갱신
            list.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
    }
    
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
//
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            //즐겨찾기 핀 고정
//    }

}
