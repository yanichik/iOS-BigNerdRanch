//
//  ItemStore.swift
//  LootLogger
//
//  Created by YB on 2/12/24.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item{
        let randomItem = Item(random: true)
        allItems.append(randomItem)
        return randomItem
    }
    
//    init() {
//        // This is why you annotated createItem() with @discardableResult. If you had not, then the call to
//        // that function would have needed to look like where you call the function, but ignore the result:
//            // let _ = createItem()
//        for _ in 0..<5{
//            createItem()
//        }
//    }
}
