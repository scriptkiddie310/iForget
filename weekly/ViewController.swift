//
//  ViewController.swift
//  weekly
//
//  Created by Felix on 10/23/15.
//  Copyright © 2015 Felix. All rights reserved.
//

import UIKit

var events = Array(count:7, repeatedValue:[String]())
var times = Array(count:7, repeatedValue:[String]())
var count = [Int](count: 7, repeatedValue: 0)

class ViewController: UIViewController {

    //var events = [[String]]()
    //var events: [String] = ["Meet Sally", "Car Wash"]
    //var times = [[String]]()
    //var times: [String] = ["7 PM", "11 AM"]
    var week_index: Int = 7
    var days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    @IBOutlet var day: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var day_table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        day.text = self.days[week_index]
        self.date.setValue(UIColor.whiteColor(), forKey: "textColor")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count[week_index]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entry", forIndexPath: indexPath) as! daily_cell
        
        // Configure the cell...
        cell.entry.text = events[week_index][indexPath.row]
        cell.time.text = times[week_index][indexPath.row]
        cell.rank = indexPath.row
        cell.del.table_index = indexPath.row

        return cell
    }
    
    @IBAction func add(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let strTime = dateFormatter.stringFromDate(date.date)
        times[week_index].append(strTime)
        events[week_index].append(textfield.text!)
        count[week_index]++
        self.day_table.reloadData()
    }
    
    @IBAction func rem(sender: AnyObject) {
        let pressed = sender as! delete_button
        let plandex = pressed.table_index
        events[week_index].removeAtIndex(plandex)
        times[week_index].removeAtIndex(plandex)
        count[week_index]--
        self.day_table.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let next_view = segue.destinationViewController as! TableViewController
        next_view.rxcount = count[week_index]
        next_view.rxday = week_index
    }


}