//
//  UITextField+Extension.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/07/19.
//

import UIKit

extension UITextField {
    
    //메모리에 저장이 되는 프로퍼티는 extension에 사용할 수 없다.
    //let placeholder = "이메일을 입력해주세요"
    
    func borderColor() {
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
        //self.placeholder = placeholder
    }

    
}
