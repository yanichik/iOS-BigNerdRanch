//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by YB on 2/12/24.
//

import UIKit

class ItemsViewController: UITableViewController {
    // add ItemStore property to have access to store that holds all items
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton){
        let newItem = itemStore.createItem()
        if newItem.valueInDollars > 50 {
            if let index = itemStore.itemsOverFifty.firstIndex(of: newItem){
                let indexPath = IndexPath(row: index, section: 1)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        } else {
            if let index = itemStore.itemsFiftyAndUnder.firstIndex(of: newItem){
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        if isEditing{
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "50 AND UNDER"
        } else {
            return "OVER 50"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return itemStore.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemStore.numberOfSections == 1 {
            return itemStore.allItems.count
        } else {
            if section == 0 {
                return itemStore.itemsFiftyAndUnder.count
            } else {
                return itemStore.itemsOverFifty.count
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = indexPath.section == 0 ? itemStore.itemsFiftyAndUnder[indexPath.row] : itemStore.itemsOverFifty[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = indexPath.section == 0 ? itemStore.itemsFiftyAndUnder[indexPath.row] : itemStore.itemsOverFifty[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        itemStore.moveItem(from: fromIndexPath.row, to: toIndexPath.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
