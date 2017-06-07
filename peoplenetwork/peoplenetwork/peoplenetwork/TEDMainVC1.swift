//
//  TEDMainVC1.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/2.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TEDMainVC1: UIViewController {

    @IBAction func pushBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
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

    
    func addThreeNum(){
        
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
