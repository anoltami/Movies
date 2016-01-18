//
//  MoviesViewController.swift
//  Movies
//
//  Created by Julien on 18/01/2016.
//  Copyright © 2016 EPSI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct OMDBFilms {
    var title:String;
    var imgUrl:String;
}

class MoviesViewController: UITableViewController {
    
    var films:Array<OMDBFilms> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "http://www.omdbapi.com/?s=Batman")
            .responseData { response in
                let responseData = JSON(data: response.data!)
                let filmsData = responseData["Search"]
                
                for (_, filmData) in filmsData {
                    let title = filmData["Title"].string!
                    let imgUrl = filmData["Poster"].string!
                    let film = OMDBFilms(title: title, imgUrl: imgUrl)
                    
                    self.films.append(film)
                }
                
                self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.films.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilmCell", forIndexPath: indexPath) as! MovieViewCell
        
        cell.Title.text = self.films[indexPath.row].title
        if let url = NSURL(string: self.films[indexPath.row].imgUrl) {
            if let data = NSData(contentsOfURL: url) {
                cell.Poster.image = UIImage(data: data)
            }        
        }

        // Configure the cell...

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
