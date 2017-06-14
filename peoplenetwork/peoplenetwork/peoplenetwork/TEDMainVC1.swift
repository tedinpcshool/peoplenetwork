//
//  TEDMainVC1.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/2.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import Firebase
class TEDMainVC1: UIViewController {
    
  
    @IBOutlet weak var lbl1: UILabel!
    
    var ref: FIRDatabaseReference!
    @IBAction func pushBtn(_ sender: UIButton) {
//        ref = Database.database().reference()
        ref = FIRDatabase.database().reference()
//        var data={"aa":"1"}
        switch sender.tag {
        case 0:
            self.ref.setValue(["user":"TOM"])
        case 1:
            self.ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let v = snapshot.value as? NSDictionary
                self.lbl1.text=v?["user"] as? String
                })
        default:
            print("aaa")
            
        }
        
        
//        self.ref.setValue(["username": "a"])
//        self.ref.childByAutoId().updateChildValues(["unam":"b"])
//        self.ref.child("-KmaYtXI1STjgyCQfBRU").childByAutoId().updateChildValues(["unam":"b"])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
