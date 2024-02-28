//
//  EditDateViewController.swift
//  LootLogger
//
//  Created by YB on 2/27/24.
//

import UIKit

class EditDateViewController: UIViewController {
    
    var datePicker: UIDatePicker!
    var item: Item!
    
    init(datePicker: UIDatePicker!, item: Item) {
        super.init(nibName: nil, bundle: nil)
        self.datePicker = datePicker
        self.item = item
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        datePicker.date = item.dateCreated
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("entered change date VC")
        print(datePicker.date)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        item.dateCreated = datePicker.date
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
