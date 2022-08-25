//
//  ShoppingRealmDataViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/08/23.
//

import UIKit
import RealmSwift

class ShoppingRealmDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var rightBarButton: UIBarButtonItem = {
       let button = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
       return button
    }()
    
    let localRealm = try! Realm()
    
    var tasks: Results<ShoppingList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.rightBarButtonItem = self.rightBarButton
        
        let myNib = UINib(nibName: "ShoppingRealmDataTableViewCell", bundle: nil)
        tableView.register(myNib, forCellReuseIdentifier: "ShoppingRealmDataTableViewCell")
        
        
        tasks = localRealm.objects(ShoppingList.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    @objc func sortButtonClicked() {
        let alert = UIAlertController()
        
        let comp = UIAlertAction(title: "할 일 순", style: .default) { _ in
            self.tasks = self.localRealm.objects(ShoppingList.self).sorted(byKeyPath: "compStatus", ascending: false)
            self.tableView.reloadData()
        }
        let bookmark = UIAlertAction(title: "즐겨찾기 순", style: .default) { _ in
            self.tasks = self.localRealm.objects(ShoppingList.self).sorted(byKeyPath: "bookMark", ascending: false)
            self.tableView.reloadData()
        }
        let title = UIAlertAction(title: "제목 순", style: .default) { _ in
            self.tasks = self.localRealm.objects(ShoppingList.self).sorted(byKeyPath: "Todo", ascending: false)
            self.tableView.reloadData()
        }
        
        alert.addAction(comp)
        alert.addAction(bookmark)
        alert.addAction(title)
        
        present(alert, animated: true)
        
    }
    
}


extension ShoppingRealmDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingRealmDataTableViewCell", for: indexPath) as? ShoppingRealmDataTableViewCell else { return UITableViewCell() }
        
        let row = tasks[indexPath.row]
        
        cell.TodoLabel.font = UIFont.systemFont(ofSize: 16)
        cell.TodoLabel.text = row.Todo
        cell.bookmarkStatusLabel.font = UIFont.systemFont(ofSize: 14)
        cell.bookmarkStatusLabel.text = (row.bookMark) ? "즐겨찾기 O" : "즐겨찾기 X"
        cell.TodoStatusLabel.font = UIFont.systemFont(ofSize: 14)
        cell.TodoStatusLabel.text = (row.compStatus) ? "완료" : "미완료"
        
        return cell
    }
    
    
}
