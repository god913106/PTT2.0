//
//  HotTextTableViewController.swift
//  PTT2.0
//
//  Created by 洋蔥胖 on 2018/6/29.
//  Copyright © 2018年 ChrisYoung. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD
import Alamofire
import AlamofireImage

class HotTextTableViewController: UITableViewController {
    
    var hotTextArray:[HotText] = []
    var hotText = HotText()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        loadData()
        
        
        
    }
    
    func loadData(){
        let urlString = "https://disp.cc/api/hot_text.json"
        Alamofire.request(urlString).responseJSON(completionHandler: { response in
            if response.result.isSuccess {
                print("Success!")
                
                let json: JSON = JSON(response.result.value as Any)
                //print("\(json)")
                
                if let result = json["list"].array{
                    
                    for data in result {
                        self.hotText.title = data["title"].stringValue //拿到url上json字串中的title
                        self.hotText.desc = data["desc"].stringValue
                        self.hotText.thumbImage = data["img_list"][0].stringValue
                        //self.hotText.url = data["url"].stringValue
                        self.hotText.bi = data["bi"].stringValue
                        self.hotText.ti = data["ti"].stringValue
//                        print(" \(data["bi"].stringValue)")
//                        print(" \(data["ti"].stringValue)")
                        
                        let newValue = HotText()
                        newValue.title = self.hotText.title
                        newValue.desc = self.hotText.desc
                        newValue.thumbImage = self.hotText.thumbImage
                        //newValue.url = self.hotText.url
                        newValue.bi = self.hotText.bi
                        newValue.ti = self.hotText.ti
//                        print("看這裡 \(newValue.bi)")
//                        print("看這裡 \(newValue.ti)")
                        
                        self.hotTextArray.append(newValue)
                        self.tableView.reloadData()
                        SVProgressHUD.dismiss()
                    }
                    
                }else{
                    print("Error \(String(describing: response.result.error))")
                }
                
                
            }
        })
    }
    
    //MARK: - tableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotTextArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HotTextTableViewCell
        
        cell.titleLabel.text = hotTextArray[indexPath.row].title
        cell.descLabel.text = hotTextArray[indexPath.row].desc
       
        
        let urlImage = hotTextArray[indexPath.row].thumbImage
        //        print("\(urlImage)")
        let placeholderImage = UIImage(named: "ptt")
        let url = URL(string: (urlImage))
        
        if url != nil {
            cell.thumbImageView?.af_setImage(withURL: (url)!)
        }else{
            cell.thumbImageView?.image = placeholderImage
        }
        
        return cell
    }
    
    //MARK: - tableView Data Delegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? HotTextDetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           // destinationVC?.urlString = hotTextArray[indexPath.row].url
           // print("看這裡：\(String(describing: destinationVC?.urlString))")
            destinationVC?.bi = hotTextArray[indexPath.row].bi
//            print("看這裡：\(String(describing: destinationVC?.bi))")
            destinationVC?.ti = hotTextArray[indexPath.row].ti
//            print("看這裡：\(String(describing: destinationVC?.ti))")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
}
