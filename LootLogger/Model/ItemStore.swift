//
//  ItemStore.swift
//  LootLogger
//
//  Created by YB on 2/12/24.
//

import UIKit
import Foundation

class ItemStore {
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
    init() {
        loadSavedList()
        let notificationCenter = NotificationCenter.default
        let notificationsToObserve: [NSNotification.Name] = [UIScene.didEnterBackgroundNotification, UIScene.willDeactivateNotification]
        for notification in notificationsToObserve {
            notificationCenter.addObserver(self, selector: #selector(saveChanges), name: notification, object: nil)
        }
        
        
    }
    
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
    
    @objc func saveChanges() throws {
        print("Saving allItems to: \(itemArchiveURL)")
        do {
            let encoder = PropertyListEncoder()
            let allItemsData = try encoder.encode(allItems)
            try allItemsData.write(to: itemArchiveURL, options: .atomic)
            print("Saved allItems to data file")
        } catch let encodingError{
            print("Error encoding allItems: \(encodingError)")
            throw encodingError
        }
    }
    
    func loadSavedList() {
        print("Loading saved allItems from: \(itemArchiveURL)")
        do {
            let decoder = PropertyListDecoder()
            let allItemsData = try Data(contentsOf: itemArchiveURL)
            let items = try decoder.decode([Item].self, from: allItemsData)
            allItems = items
        } catch let loadingError {
            print("Error loading from saved plist: \(loadingError)")
        }
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
