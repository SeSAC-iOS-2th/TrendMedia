//
//  SettingCaseTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/18.
//

import UIKit


//CaseIterable: 프로토콜, 배열처럼 열거형을 활용할 수 있는 특성
enum SettingOptions: Int, CaseIterable {
    case total, personal, others //섹션
    
    var sectionTitle: String {
        
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitle: [String] {
        
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class SettingCaseTableViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    let section0_array = ["공지사항", "실험실", "버전 정보"]
    let section1_array = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let section2_array = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabelDesign(label: titleLabel)
        
        print(SettingOptions.allCases.count) //3
        print(SettingOptions.allCases[0]) //total
        print(SettingOptions.allCases[1].sectionTitle) //personal > "개인 설정"
        print(SettingOptions.allCases[2].rowTitle) //others > "고객센터/도움말"
    }
    
    //제목 설정: "설정"
    func titleLabelDesign(label: UILabel) {
        label.text = "설정"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    //섹션 갯수 설정: 3 (옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return 3
        return SettingOptions.allCases.count
    }
    
    //각 세션의 header 설정 (옵션)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let header: String?
//
//        if section == 0 {
//            header = "전체 설정"
//        } else if section == 1 {
//            header = "개인 설정"
//        } else if section == 2 {
//            header = "기타"
//        } else {
//            header = "없음"
//        }
//
//        return header
        
        return SettingOptions.allCases[section].sectionTitle
    }
    
    //각 세션의 셀 갯수 설정 (필수!)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0: return 3
//        case 1: return 4
//        case 2: return 1
//        default: return 0
//        }
        
        return SettingOptions.allCases[section].rowTitle.count
    }
    
    //세션의 셀 마다 텍스트 설정 (필수!)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableCell")!

//        if indexPath.section == 0 {
//            cell.textLabel?.text = section0_array[indexPath.row]
//        } else if indexPath.section == 1 {
//            cell.textLabel?.text = section1_array[indexPath.row]
//        } else if indexPath.section == 2 {
//            cell.textLabel?.text = section2_array[indexPath.row]
//        }
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]

        
        return cell
        
    }
        
}
