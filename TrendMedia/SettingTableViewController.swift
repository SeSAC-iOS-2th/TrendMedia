//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    
    var birthdayFriends = ["뽀로로", "신데렐라", "올라프", "스노기", "모구리", "고래밥"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    
    //섹션의 갯수(옵션)
    //셀의 갯수를 지정해주는 함수(1번)가 없으면, 섹션의 갯수가 몇 개든 셀의 갯수는 0
    //함수가 없어도 섹션의 값은 1(default 값)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    //헤더는 필수가 아니기 때문에, String?(옵셔널)로 선언
    //titleForHeaderSection: section을 구분짓기 위해
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 140명"
        } else {
            return "섹션"
        }
        
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    
    //1. 셀의 갯수(필수): numberOfRowsInSection => 섹션에 따라 셀의 갯수 지정 가능
    //ex. 카톡 100명-> 셀 100개, 3000명-> 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
        
    }
    
    //2. 셀의 디자인과 데이터(필수): cellForRowAt
    //ex. 카톡 이중원, 프로필 사진, 상태 메시지 등
    //IndexPath: 섹션(IndexPath.section)과 셀(IndexPath.row)의 index 정보
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //withIdentifier에 대한 오류: 잘못 입력했을 때
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        
        //모든 경우의 수가 대응이 될 필요가 없는 이유: cell을 return하는 코드가 if문 밖에 있기 때문
        if indexPath.section == 0 {
            
            //셀의 index에 따라 textLabel 이름 짓기
            cell.textLabel?.text = birthdayFriends[indexPath.row]
            cell.textLabel?.textColor = .systemMint
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)

        } else if indexPath.section == 1 {
            cell.textLabel?.text = "1번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemPink
            cell.textLabel?.font = .italicSystemFont(ofSize: 25)

        } else if indexPath.section == 2 {
            cell.textLabel?.text = "2번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemPurple
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)

        }
        
        
        return cell
    }
    
    
}
