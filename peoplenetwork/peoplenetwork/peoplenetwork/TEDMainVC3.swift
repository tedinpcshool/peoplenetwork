//
//  TEDMainVC3.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/19.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase

class TEDMainVC3: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var orders:Array<[String:Any]>!=[]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("orders.count=\(orders.count)")
        return orders!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if let order = orders[indexPath.row]["RoomNum"]{
            let str = "房號 " + String(describing: order) + "之訂單"
            cell.textLabel?.text = str
        }

        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        var JSON = ref.child("RoomOrder").observe(.value, with: { (snap) in
            
            let value = snap.value as? NSArray
            
            self.orders = value as! Array<[String : Any]>
            
            self.tableView.reloadData()
            
        }){(error) in
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeFile(){
    
        // requirement  String -> JSON
        
        let jsonStr = "{ \"people\": [{ \"firstName\": \"Paul\", \"lastName\": \"Hudson\", \"isAlive\": true }, { \"firstName\": \"Angela\", \"lastName\": \"Merkel\", \"isAlive\": true }, { \"firstName\": \"George\", \"lastName\": \"Washington\", \"isAlive\": false } ] }"
        
        
        let tmpStr = "abcde"
        
        //        tmpStr.data(using: <#T##String.Encoding#>)  //String -> Data
        
        
        
        
        
        if let data = jsonStr.data(using: String.Encoding.utf8) {
            let json = JSON(data: data)  // Data -> JSON
            
            for item in json["people"].arrayValue {
                print(item["firstName"].stringValue)
            }
        }
        
        let file = "file.txt" //this is the file. we will write to and read from it
        
        let text = jsonStr //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            print("path = \(path)")
            
            //            text.write(to: <#T##URL#>, atomically: <#T##Bool#>, encoding: <#T##String.Encoding#>)
            
            //writing
            do {
                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {
                /* error handling here */
            }
            
            //reading
            do {
                let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
                
                
            }
            catch {/* error handling here */}
        }
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
