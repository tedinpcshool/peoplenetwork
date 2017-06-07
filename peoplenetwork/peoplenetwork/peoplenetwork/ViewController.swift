//
//  ViewController.swift
//  peoplenetwork
//
//  Created by ios on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userInfo:TEDUserInfo?
    
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBAction func pushBtn(_ sender: UIButton) {
        switch seg.selectedSegmentIndex {
        case 0:
            
            let vc1=storyboard?.instantiateViewController(withIdentifier: "TEDMainVC1")
            // UIViewController            
            self.navigationController?.pushViewController(vc1!, animated: true)
            
        case 1:
            let vc2=storyboard?.instantiateViewController(withIdentifier: "TEDMainVC2") as! TEDMainVC2
            
            vc2.name = "TED"
            
            self.navigationController?.pushViewController(vc2, animated: true)
        default:
            print("no action")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(TEDBlackDog.getSpice())
        
        let smallDog=TEDBlackDog()
        let bigDog=TEDBlackDog()
        
        print(smallDog.getNumOfears())
        bigDog.numOfEars=1
        print(bigDog.getNumOfears())
        
        
        
//        self.writeFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        if userInfo == nil{
            let delegate=UIApplication.shared.delegate as! AppDelegate
            userInfo=delegate.userInfo
        }

        lblName.text=userInfo?.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    

    func writeFile(){
        
        let file = "file.txt" //this is the file. we will write to and read from it
        let text = "some text" //just a text
//        FileManager.default.urls(for: <#T##FileManager.SearchPathDirectory#>, in: <#T##FileManager.SearchPathDomainMask#>)
        // optional binding
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            print("dir=\(dir)")
            let path = dir.appendingPathComponent(file)
            //writing
            do {
                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
                print("path=\(path)")
                //reading
                do {
                    let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
                    print("text2 = \(text2)")
                }
                catch {
                    /* error handling here */
            
            }
        }
    }
    
}

