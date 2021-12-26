//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Konstantin Zaytcev on 18.12.2021.
//

import UIKit

private let reuseIdentifier = "userCell"

class FriendsTableVC: UITableViewController {
    
    var users = [UserModel]()

    public func setData()
    {
        users.append(UserModel(
            id: 1,
            name: "Константин Зайцев",
            image: UIImage(named: "monkey01.png")
        ))
        
        users.append(UserModel(
            id: 2,
            name: "Антон Зиновьев",
            image: UIImage(named: "monkey02.png")
        ))
        
        users.append(UserModel(
            id: 3,
            name: "Павел Николаев",
            image: UIImage(named: "monkey03.png")
        ))
        
        users.append(UserModel(
            id: 4,
            name: "Никита Чиров",
            image: UIImage(named: "monkey04.png")
        ))
        
        users.append(UserModel(
            id: 5,
            name: "Николай Кузнецов",
            image: UIImage(named: "monkey05.png")
        ))
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "UserCell", bundle: nil),
            forCellReuseIdentifier: reuseIdentifier
        )
        
        setData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UserCell
        else {
            return UITableViewCell()
        }

        let currentItem = users[indexPath.row]
        
        cell.configure(
            name: currentItem.name,
            image: currentItem.image
        )

        return cell
    }
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any? ) {
        
        guard
            segue.identifier == "showPhoto",
            let indexPath = tableView.indexPathForSelectedRow
        else {
            return
        }
        
        guard
            let destination = segue.destination as? FriendsCollectionVC
        else {
            return
        }
        
        destination.userModel = users[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        performSegue(withIdentifier: "showPhoto", sender: nil)
    }
}