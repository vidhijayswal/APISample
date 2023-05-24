//
//  ViewController.swift
//  APISample
//
//  Created by vidhi jayswal on 11/02/19.
//  Copyright © 2019 vidhi jayswal. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    @IBOutlet weak var myTableview: UITableView!
    
    
    
    var demoArr = NSMutableArray()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        makeRequest()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return demoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTableview.dequeueReusableCell(withIdentifier: "tblCellSongList") as! tblCellSongList
        
        let dic = demoArr[indexPath.row] as! NSDictionary
        
        let url = URL(string: (dic["song_image"] as! String) )
        cell.lblSongName.text = (dic["song_name"] as! String)
        cell.lblartistname.text = (dic["artist_name"] as! String)
        cell.myImageview.af_setImage(withURL: url!)
        return cell
    }
    
    func makeRequest()
    {
        Alamofire.request("http://18.235.131.215/api/allsongs", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result
            {
                
            case .success:
                let result = response.result.value as! NSDictionary
                print(result)
                self.demoArr = (result["data"] as! NSArray).mutableCopy() as! NSMutableArray
                self.myTableview.reloadData()
            default:
                "Error"
            }
        }
        
    }
}


//"artist_name" = Frequency;
//count = 9;
//"created_at" = "2018-11-15 09:39:33";
//"genre_id" = "[\"32\"]";
//"mood_id" = "[\"9\"]";
//"song_duration" = "00:03:51";
//"song_file" = "https://positive-playlist.s3.amazonaws.com/2018/Nov/15/songs/20Frequency1_1542274772.mp3";
//"song_id" = 20;
//"song_image" = "https://positive-playlist.s3.amazonaws.com/2018/Nov/15/images/loveromance_1542274772.jpg";
//"song_name" = Frequency;
//status = 1;
//"updated_at" = "2019-02-02 16:48:59";



//    class TableViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate
//    {
//
//        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//        {
//            return movies.count
//        }
//
//        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//        {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = movies[indexPath.row]
//            if indexPath.row%2 == 0
//            {
//                cell.backgroundColor = UIColor.lightGray
//                return cell
//            }
//            else
//            {
//                cell.backgroundColor = UIColor.white
//                return cell
//            }

