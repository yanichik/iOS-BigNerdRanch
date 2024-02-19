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
    
    func removeItem(_ item: Item){
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
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
