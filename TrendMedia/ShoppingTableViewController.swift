//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var list: [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.placeholder = "무엇을 구매하실 건가요?"
        
        designButton(button: addButton, text: "추가")
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
        
        cell.checkboxImageView.image = UIImage(systemName: "checkmark.square.fill")
        cell.contentsLabel.text = list[indexPath.row]
        cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        
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
