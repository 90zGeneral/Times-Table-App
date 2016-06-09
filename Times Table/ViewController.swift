//
//  ViewController.swift
//  Times Table
//
//  Created by Roydon Jeffrey on 6/6/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

//UITableViewDelegate allows the UIViewController to be responsible for the table view that was added to it in Main.storyboard
class ViewController: UIViewController, UITableViewDelegate {
    
    //how many rows should the table view have?
    var numberOfRowsInTableView = 20
    
    //this variable holds the values displayed in the table view
    @IBOutlet var table: UITableView!
    
    //this variable stores the current value of the slider
    @IBOutlet var sliderValue: UISlider!
    
    //this function will run everytime the slider moves
    @IBAction func sliderMoved(sender: AnyObject) {
        
        //this will update the table view everytime the sliderValue changes and display the current times table figures
        table.reloadData()
        
    }
    
    //this function determines how many rows the table view will have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfRowsInTableView
        
    }
    
    //this function will define the content of each individual cell based on the amount of rows in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       //set the identifier exactly the same as in the prototype cell on Main.storyboard. Each cell will look identical to each other
       let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //to get the current times table number, multiply the current slider value by 20 since the maximum value of the slider is 1, so all the floating values btw 0 and 1 should be converted to an integer value from 1 to 20.
        let timesTable = Int(sliderValue.value * 20)
        
        //present the content of the cells after multiplying the timesTable value by the specific row index. Plus 1 to replace the 0 to 19 index range with 1 to 20
        cell.textLabel?.text = String(timesTable * (indexPath.row + 1))
        
        //to determine which cells should be red as oppose to blue
        if indexPath.row % 2 == 0 {
            cell.textLabel?.textColor = UIColor.redColor()
        }else {
            cell.textLabel?.textColor = UIColor.blueColor()
        }
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
