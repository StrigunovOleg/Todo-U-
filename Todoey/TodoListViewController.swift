//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Start code", "Dont write bugs", "Build project"]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - TableView data sourse methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    }
    
    //MARK: - TableView delegat methods
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        // выключили выдиление при нажатие на строку, теперь оно просто задерживаеться на какое то время и исчезает
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
 
    }
    
    //MARK: - add new items
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new itme", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "save", style: .default) { [self] (action) in
            // when user pressed add
           
            self.itemArray.append(textField.text! )
            
            // можно и так self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField{
            (alertTextField) in
            alertTextField.placeholder = "type somesing.."
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        
        // ЕСЛИ ЭТО НЕ ДОБАВИТЬ НЕ БУДЕТ АЛЕРТА))
        present(alert, animated: true, completion: nil)
    }
    

}



