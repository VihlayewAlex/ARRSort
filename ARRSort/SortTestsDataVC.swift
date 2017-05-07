//
//  SortTestsDataVC.swift
//  ARRSort
//
//  Created by Alex Vihlayew on 4/9/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import Cocoa

class SortTestsDataVC: NSViewController {

    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var dataTableView: NSTableView!
    
    lazy var managedContext: NSManagedObjectContext = {
        let appDelegate = NSApplication.shared().delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }()
    
    
    
    
    public var sortType = 0
    
    var data = [DataUnit]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch sortType {
        case 1:
            self.view.window?.title = "Merge sort data"
        case 2:
            self.view.window?.title = "Shell sort data"
        default:
            self.view.window?.title = "Heap sort data"
        }
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
        
        loadData()
    }
    
    
    func loadData() {
        
        let fetchRequest = DataUnit.fetchRequest()
        //fetchRequest.predicate = NSPredicate(format: "sortAlgorithm = @%", sortType)
        
        do {
            data = try managedContext.fetch(fetchRequest)
            dataTableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    
}

extension SortTestsDataVC: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
        cellView.textField?.stringValue = "Size: \(self.data[row].elements),  Time: \(self.data[row].seconds)"
        cellView.backgroundStyle = NSBackgroundStyle.dark
        return cellView
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        if self.dataTableView.numberOfSelectedRows > 0 {
            self.dataTableView.deselectRow(self.dataTableView.selectedRow)
        }
        
    }
    
}


