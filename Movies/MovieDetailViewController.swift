//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Julien on 18/01/2016.
//  Copyright © 2016 EPSI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieDetailViewController: UIViewController {
    
    var filmTitleText:String?
    var filmIDText:String?

    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var poster: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = filmTitleText
        
        Alamofire.request(.GET, "http://www.omdbapi.com/?i="+filmIDText!+"&plot=short&r=json")
            .responseData { response in
                let responseData = JSON(data: response.data!)
                self.filmTitle.text = responseData["Title"].string!
                self.director.text = responseData["Director"].string!
                self.year.text = responseData["Year"].string!
                
                if let url = NSURL(string: responseData["Poster"].string!) {
                    if let data = NSData(contentsOfURL: url) {
                        self.poster.image = UIImage(data: data)
                    }
                }
                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
