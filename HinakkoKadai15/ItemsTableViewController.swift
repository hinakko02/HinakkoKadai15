//
//  ViewController.swift
//  HinakkoKadai15
//
//  Created by Hina on 2023/07/23.
//

import UIKit

class ItemsTableViewController: UITableViewController {

//クラス内部のみで使用されるプロパティ
        private let keyName = "Name"
        private let keyCheck = "Check"

        private var items: [Dictionary<String,Any>] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

            self.items = [
                [keyName:"りんご", keyCheck:false],
                [keyName:"みかん", keyCheck:true],
                [keyName:"バナナ", keyCheck:false],
                [keyName:"パイナップル", keyCheck:true]
            ]
        }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ItemTableViewCell

        let item = items[indexPath.row]

        if item[keyCheck] as? Bool == true {
            cell.checkImg.image = UIImage(named: "checkMark")
        } else {
            cell.checkImg.image = nil
        }

        cell.label.text = (item[keyName] as? String) ?? ""

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let check = self.items[indexPath.row][keyCheck] as? Bool {
            self.items[indexPath.row][keyCheck] = !check
            self.tableView.reloadRows(at: [indexPath], with: .automatic)

        }
    }



    @IBAction func exitFromAddByCancel(segue:UIStoryboardSegue) {

    }

    @IBAction func exitFromAddBySave(segue:UIStoryboardSegue) {
        if let add = segue.source as? AddItemViewController {
            let item:Dictionary<String,Any> = [keyName:add.nameTextField.text as Any, keyCheck:false]
            self.items.append(item)
            self.tableView.reloadData()
        }
    }
}
