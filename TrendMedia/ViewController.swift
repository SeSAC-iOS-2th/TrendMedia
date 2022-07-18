//
//  ViewController.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    //언제 아울렛컬렉션을 사용하는 것이 좋을까?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    //Auto Layout도 outlet 설정이 가능하다!
    @IBOutlet weak var greenViewLeadingConstant2: NSLayoutConstraint!
    
    
    //변수의 스코프
    let format = DateFormatter()
    
    //format.dateFormat = "yyyy/MM/dd"
    //dateLabel.text = "aaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        format.dateFormat = "yyyy/MM/dd"
        
        //.init의 생략
        //let format = DateFormatter()
        //let format2 = DateFormatter.init()
        
    }
    
    func configureLabelDesign() {
        //1.OutletCollection
        //단순히 반복적인 일만 수행해야 할 때
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"
        
        //2. UILabel
        //사용자의 입력을 받거나, text를 작성할 때
        let labelArray = [dateLabel, dateLabel2]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        
        dateLabel.text = "첫번째 텍스트"
        dateLabel2.text = "두번째 텍스트"
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        //let format = DateFormatter()
        //format.dateFormat = "yyyy/MM/dd"
        
        dateLabel.text = format.string(from: sender.date)
        
        greenViewLeadingConstant2.constant = CGFloat((Int.random(in:1...10)) * 10)
        
    }
    
}

