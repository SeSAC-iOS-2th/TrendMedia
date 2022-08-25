//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit
import RealmSwift
import SwiftUI

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var list: [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    let localRealm = try! Realm()
    
    var tmp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.placeholder = "무엇을 구매하실 건가요?"
        
        designButton(button: addButton, text: "추가")
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }
    
    @objc func addButtonClicked() {

        if userTextField.text == "" {
            let alert = UIAlertController(title: "주의", message: "살 것을 입력하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "예", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
            return
        }
        list.append(userTextField.text!)
        tableView.reloadData()
        
        userTextField.text = nil
    }
    
    @objc func changeCheckBoxButtonClicked(button: UIButton) {
        if button.image(for: .normal) == UIImage(systemName: "checkmark.square.fill") {
            button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }
    
    @objc func changeBookMarkButtonClicked(button: UIButton) {
        if button.image(for: .normal) == UIImage(systemName: "star.fill") {
            button.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }

    
    
    func designButton(button: UIButton, text: String) {
        button.setTitle(text, for: .normal)
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.systemGray5
        button.layer.cornerRadius = 8
    }
        
    //Enter시, 셀 추가
    @IBAction func userTextFieldEnter(_ sender: UITextField) {
        list.append(sender.text!)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell") as! ShoppingTableViewCell
        
        if tmp == 0 {
            cell.checkBoxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
        cell.checkBoxButton.addTarget(self, action: #selector(changeCheckBoxButtonClicked(button:)), for: .touchUpInside)
        cell.checkBoxButton.tintColor = .black
        cell.contentsLabel.text = list[indexPath.row]
        cell.bookmarkButton.addTarget(self, action: #selector(changeBookMarkButtonClicked(button:)), for: .touchUpInside)
        
        let checkBoxStatus = (cell.checkBoxButton.image(for: .normal) == UIImage(systemName: "checkmark.square.fill")) ? true : false
        
        let bookMarkStatus = (cell.bookmarkButton.image(for: .normal) == UIImage(systemName: "star.fill")) ? true : false
        
        let task = ShoppingList(Todo: list[indexPath.row], bookMark: bookMarkStatus, compStatus: checkBoxStatus)
        
        try! localRealm.write {
            localRealm.add(task)
        }
        
        tmp += 1
        
        return cell
    }
    
    //스와이프 시 삭제 버튼, 클릭 시 셀 삭제
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
