//
//  SettingCaseTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/18.
//

import UIKit

class SettingCaseTableViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    let section0_array = ["공지사항", "실험실", "버전 정보"]
    let section1_array = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let section2_array = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabelDesign(label: titleLabel)
    }
    
    //제목 설정: "설정"
    func titleLabelDesign(label: UILabel) {
        label.text = "설정"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    //섹션 갯수 설정: 3 (옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //각 세션의 header 설정 (옵션)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header: String?
        
        if section == 0 {
            header = "전체 설정"
        } else if section == 1 {
            header = "개인 설정"
        } else if section == 2 {
            header = "기타"
        } else {
            header = "없음"
        }
        
        return header
    }
    
    //각 세션의 셀 갯수 설정 (필수!)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 4
        case 2: return 1
        default: return 0
        }
    }
    
    //세션의 셀 마다 텍스트 설정 (필수!)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = section0_array[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = section1_array[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = section2_array[indexPath.row]
        }
        
        return cell
    }
        
}
