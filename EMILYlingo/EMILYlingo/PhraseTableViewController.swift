//
//  PhraseTableViewController.swift
//  EMILYlingo
//
//  Created by ali.anish91 on 4/4/16.
//  Copyright © 2016 EMILYlingo. All rights reserved.
//

import UIKit

class PhraseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var phrases = [Phrase]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func loadPhrases(){
        let genderPhoto = UIImage(named: "male")
        let usflag = UIImage(named: "usflag")
        let phrase1 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag, gender: genderPhoto)!
        
        let genderPhoto2 = UIImage(named: "female")
        let usflag2 = UIImage(named: "usflag")
        let phrase2 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag2, gender: genderPhoto2)!

        let phrase3 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag, gender: genderPhoto)!

        let phrase8 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag2, gender: genderPhoto2)!

        let phrase4 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag, gender: genderPhoto)!

        let phrase5 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag2, gender: genderPhoto2)!
        
        let phrase6 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag, gender: genderPhoto)!
        
        let phrase7 = Phrase(phraseName: "Sit Down", language: "Arabic", time: "5", flag: usflag2, gender: genderPhoto2)!
        
        phrases = phrases + [phrase1, phrase2, phrase3, phrase4, phrase5, phrase6, phrase7, phrase8]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.blackColor()
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120
        loadPhrases()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "PhraseTableViewCell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhraseTableViewCell
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return phrases.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "PhraseTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhraseTableViewCell
        
        let phrase = phrases[indexPath.row]
        
        cell.phraseNameLabel.text = phrase.phraseName
        cell.languageLabel.text = phrase.language
        cell.flagImage.image = phrase.flag
        cell.genderImage.image = phrase.gender
        cell.timeLabel.text = phrase.time

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
