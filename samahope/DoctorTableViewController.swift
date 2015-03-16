//
//  DoctorTableViewController.swift
//  samahope
//
//  Created by Isaac Ho on 3/14/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class DoctorTableViewController: UITableViewController {
    var doctors: [Doctor]?
    var names = ["Dr. Robert Smigel", "Captain Comeback", "Prof. Longhair", "Jimmy the Greek", "Fred Flinstone" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doctors = [Doctor]()
        for ( var i = 0; i < names.count; i++ ) {
            var doctor = Doctor()
            doctor.name = names[i]
            doctors!.append( doctor )
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println( "tableView.cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.doctortableviewcell", forIndexPath: indexPath) as DoctorTableViewCell

        // Configure the cell...
        cell.setDoctor( doctors![ indexPath.row ] )
        cell.setNeedsDisplay()
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
