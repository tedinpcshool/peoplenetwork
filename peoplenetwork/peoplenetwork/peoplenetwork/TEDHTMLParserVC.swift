//
//  TEDHTMLParserVC.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/30.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import SwiftSoup

class TEDHTMLParserVC: UIViewController,UIWebViewDelegate {
 var html : String!
    var qIndex=1
    
    var myTimer:Timer!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTimer=Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(loadHTML), userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("@@- webViewDidFinishLoad")
        
        var htmlStr = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")!
        do{
            let doc: Document = try! SwiftSoup.parse(htmlStr)
            var element = try doc.select("div.ng-scope header").first()
            
//            for element in elements.array() {
            
            if element != nil{
                try print("str = \(element?.html())")
            }else{
                print("element is nil,html is \(htmlStr)")
            }
            
            
            
//            }
            qIndex+=1
            

        }catch Exception.Error(let type, let message){
            print(message)
        }catch{
            print("error")
        }
        print("00- webViewDidFinishLoad")
        
    }

    
    
    func loadHTML() -> Bool {
//        https://exam.dentaltw.com/#/a/exam/105-1-6-79
        // Do any additional setup after loading the view, typically from a nib.
        
        let myURLString = "https://exam.dentaltw.com/#/a/exam/105-1-6-"+String(qIndex)
        let myURL2 = URL(string: myURLString)
        var response = webView.loadRequest(URLRequest(url: myURL2!))
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
