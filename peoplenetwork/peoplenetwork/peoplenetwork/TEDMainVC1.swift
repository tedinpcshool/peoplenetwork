//
//  TEDMainVC1.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/2.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import Firebase

class OrderInfo:Any{
    var RoomNum:Int?
    var foods:Array<Any>?
    var status:String?
    
}


class TEDMainVC1: UIViewController {
    
  var orders:Array<[String:Any]>!=[]
    @IBOutlet weak var lbl1: UILabel!
    
    var ref: DatabaseReference!
    @IBAction func pushBtn(_ sender: UIButton) {
//        ref = Database.database().reference()
        ref = Database.database().reference()
//        var data={"aa":"1"}
        switch sender.tag {
        case 0:
            self.ref.setValue(["user":"TOM"])
        case 1:
            self.ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let v = snapshot.value as? NSDictionary
                self.lbl1.text=v?["user"] as? String
                })
        case 2:
            self.ref.child("RoomOrder").child("101").child("-KnsnUh_2_F_oXVDkUBX").removeValue()
            
        default:
            print("aaa")
            
        }
        
        
//        self.ref.setValue(["username": "a"])
//        self.ref.childByAutoId().updateChildValues(["unam":"b"])
//        self.ref.child("-KmaYtXI1STjgyCQfBRU").childByAutoId().updateChildValues(["unam":"b"])
        
    }
    
    
    func writeOrderToRTDB(){
        let order1=["foodName":"rice","price":100] as [String : Any]
        let order2=["foodName":"noodle","price":200]as [String : Any]
        let orders=[order1,order2]
        
        
        let orderInfo1=["RoomNum":101,"foods":orders,"status":"not ready"] as [String : Any];
        
        
        
        let orderInfo2=["RoomNum":102,"foods":orders,"status":"ready"] as [String : Any];
        
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let roomID="101"
        
        let key=ref.child("RoomOrder").child(roomID).childByAutoId().key
        ref.child("RoomOrder").child(roomID).child(key).setValue(orderInfo2)

        ref.child("RoomOrder").observe(.value, with: { (snap) in
            let value = snap.value as? NSDictionary
            
            let keys = value?.allKeys
            
            let obj = value?.object(forKey: keys?[0])
            
            obj
            
            
            print(value)
            
//            self.orders = value as! Array<[String : Any]>
            
        }){(error) in
            print(error.localizedDescription)
        }
        
//        print(self.orders)
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.writeOrderToRTDB()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=true
    }

    
    func addThreeNum()->Int{
        return 1
    }
    
    
    class func addTwoNum(a:Int,b:Int)->Int{
        return a+b
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
