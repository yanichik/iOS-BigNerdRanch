//
//  ItemStore.swift
//  LootLogger
//
//  Created by YB on 2/12/24.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    var itemsOverFifty = [Item]()
    var itemsFiftyAndUnder = [Item]()
//    var numberOfSections = 2
    
    @discardableResult func createItem() -> Item{
        let randomItem = Item(random: true)
        allItems.append(randomItem)
        updateItemsLists()
        return randomItem
    }
    
    func removeItem(_ item: Item){
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
        updateItemsLists()
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
        updateItemsLists()
    }
    
    func updateNumberSections(){
        let hasOverFifty = allItems.contains {$0.valueInDollars > 50}
        if hasOverFifty {
//            numberOfSections = 2
            updateItemsLists()
        } else {
//            numberOfSections = 1
            updateItemsLists()
        }
    }
    
    func updateItemsLists(){
        itemsOverFifty = allItems.filter {$0.valueInDollars > 50}
        itemsFiftyAndUnder = allItems.filter {$0.valueInDollars <= 50}
    }
}
