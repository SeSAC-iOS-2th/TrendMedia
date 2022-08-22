//
//  RealmModel.swift
//  TrendMedia
//
//  Created by 이중원 on 2022/08/23.
//

import Foundation
import RealmSwift

class ShoppingList: Object {
    @Persisted var Todo: String //할 일
    @Persisted var bookMark: Bool //즐겨찾기 여부
    @Persisted var compStatus: Bool //완료 여부
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(Todo: String, bookMark: Bool, compStatus: Bool) {
        self.init()
        self.Todo = Todo
        self.bookMark = bookMark
        self.compStatus = compStatus
    }
}
