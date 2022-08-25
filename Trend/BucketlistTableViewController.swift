//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit
import MapKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketlistTableViewController: UITableViewController {
    
    //타입 프로퍼티 활용
    static let identifier = "BucketlistTableViewController"
        
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("텍스트필드 DidSet")
        }
    }

    //list 프로퍼티가 추가, 삭제 등 변경되고 나서 테이블뷰를 항상 갱신!
    var list = [Todo(title: "부산행", done: true), Todo(title: "반도", done: false)] {
        didSet {
            tableView.reloadData()
            print("list가 변경됨! \(list), \(oldValue)")
        }
    }
    
    //1. 값 전달
    var textfieldPlaceholder = ""
    //옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    //placeholder 자체가 옵셔널이라면?
    //하지만 String Interpolation이라면?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. 값을 뷰 화면에 띄우기
        userTextField.placeholder = textfieldPlaceholder

        tableView.rowHeight = 80
        
        list.append(Todo(title: "창궐", done: false))
        list.append(Todo(title: "지금 우리 학교는", done: true))
        
        navigationItem.title = "버킷리스트"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }

    @IBAction func userTextFieldEntered(_ sender: UITextField) {
        
//        //옵셔널 바인딩
//        //case 2. if let
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
//            list.append(value)
//            tableView.reloadData()
//        } else {
//            //토스트 메시지 띄우기
//        }
//
//        //case 3. guard 구문으로 활용
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
//            //Alert, Toast Message를 통해서 빈칸을 입력했다, 글자 수가 많다 등 출력
//            return
//        }
        
//        list.append(userTextField.text!)
        tableView.reloadData() //???? 얘를 왜 써야 할까요???

        
            
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
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 14)
        
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkBoxButtonClicked(sender:)), for: .touchUpInside)
        
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
    }
    
    @objc func checkBoxButtonClicked(sender: UIButton) {
        print("\(sender.tag)번째 버튼 클릭!")
        
        //배열 인덱스를 찾아서 done을 바꿔야 된다! 그리고 테이블 뷰 갱신 해야 한다!
        //???
        list[sender.tag].done = !list[sender.tag].done
        
        //tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        //재사용 셀 오류 확인용 코드
        //sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
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
