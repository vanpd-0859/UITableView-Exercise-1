//
//  ViewController.swift
//  UITableView-01
//
//  Created by Phan Dinh Van on 3/12/19.
//  Copyright © 2019 Phan Dinh Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var tblContact: UITableView!
    var contacts = [Contact]()
    var arrChars = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts.append(Contact(name: "Alex", phone: "+123", avatar: nil))
        contacts.append(Contact(name: "Anna", phone: "+123", avatar: nil))
        contacts.append(Contact(name: "Alexander", phone: "+123", avatar: nil))
        contacts.append(Contact(name: "John", phone: "+234", avatar: nil))
        contacts.append(Contact(name: "Kenvin", phone: "+345", avatar: nil))
        contacts.append(Contact(name: "Ken", phone: "+345", avatar: nil))
        contacts.append(Contact(name: "Mark", phone: "+456", avatar: nil))
        contacts.append(Contact(name: "Hera", phone: "+567", avatar: nil))
        contacts.append(Contact(name: "Henry", phone: "+567", avatar: nil))
        contacts.append(Contact(name: "Hong Phan", phone: "+567", avatar: nil))
        tblContact.delegate = self
        tblContact.dataSource = self
        tblContact.estimatedRowHeight = 80
        tblContact.rowHeight = 80 //UITableView.automaticDimension
        tblContact.tableFooterView = UIView()
        arrChars = getListSections(contacts)
        let btnAdd = UIButton(type: .custom)
        btnAdd.frame = CGRect(x: view.frame.width-80, y: view.frame.height-80, width: 60, height: 60)
        let myString = "+"
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Arial", size: 40.0)! ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        btnAdd.setAttributedTitle(myAttrString, for: .normal)
        btnAdd.layer.cornerRadius = btnAdd.frame.size.width / 2
        btnAdd.clipsToBounds = true
        btnAdd.backgroundColor = UIColor.orange
        view.addSubview(btnAdd)
    }
    
    func getListSections(_ contacts: [Contact]) -> [Character] {
        var arrChars = [Character]()
        for i in 0..<contacts.count {
            if !arrChars.contains(contacts[i].name.first!) {
                arrChars.append(contacts[i].name.first!)
            }
        }
        return arrChars.sorted()
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrChars.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(arrChars[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filter = contacts.filter{ c in
            c.name.first == arrChars[section]
        }
        return filter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell", for: indexPath) as! ContactCell
        let filter = contacts.filter{ c in
            c.name.first == arrChars[indexPath.section]
        }
        cell.imgAvatar.image = filter[indexPath.row].avatar == nil ? cell.imgAvatar.image : filter[indexPath.row].avatar
        cell.lblName.text = filter[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrChars.compactMap{ "\($0)" }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
}

