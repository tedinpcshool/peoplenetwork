//
//  TEDHTMLParserVC.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/30.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import SwiftSoup
import SwiftyJSON

class TEDHTMLParserVC: UIViewController,UIWebViewDelegate {
    var html : String!
    var qIndex=1
    var myTimer:Timer!
    
    var qTitleJSON:JSON!
    
    var strQ:String="["
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTimer=Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(loadHTML), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }

    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("@@- webViewDidStartLoad")
        var tmpStr=""
        let htmlStr = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")!
        var json:JSON!
        do{
            let doc: Document = try! SwiftSoup.parse(htmlStr)
            let qTitle = try doc.select("div.ng-scope header").first()

            
            if qTitle != nil{
//                try qTitle?.append(qTitle!.html())
                
                try tmpStr=qTitle!.html()
                
                json=JSON(["qTitle":tmpStr])
                let ans = try doc.select("md-radio-group md-radio-button")
                var tmpIndex=1
                var ans1Str=""
                var ans2Str=""
                var ans3Str=""
                var ans4Str=""
                
                for ans1 in ans.array(){
                    switch tmpIndex {
                    case 1:
                        ans1Str=try ans1.attr("aria-label")
                    case 2:
                        ans2Str=try ans1.attr("aria-label")
                    case 3:
                        ans3Str=try ans1.attr("aria-label")
                    case 4:
                        ans4Str=try ans1.attr("aria-label")
                    default:
                        break
                    }
//                    let tmpXX="ans"+String(tmpIndex)
//                    let tmpStr=try ans1.attr("aria-label")
//                    print("tmpStr=\(tmpStr)")
//                    json[tmpXX].string = tmpStr
                    tmpIndex+=1
//                    try tmpStr=tmpStr+"$"+ans1.attr("aria-label")
                }
                
                strQ = strQ + "{\"答案\":\""+"\",\"題目\":\" "+qIndex+")"+tmpStr+"\\n(A)"+ans1Str+"\\n(B)"+ans2Str+"\\n(C)"+ans3Str+"\\n(D)"+ans4Str+"\"},"
                
                
                print("strQ = \(strQ)")

                
//                json=JSON(["qTitle":tmpStr,"ans1":ans1Str,"ans2":ans2Str,"ans3":ans3Str,"ans4":ans4Str])
//                print("json = \(json)")
                
//                qTitleJSON[qIndex]=JSON(json)
                
            }else{
//                print("element is nil,html is \(htmlStr)")
            }
            
            
            
        }catch Exception.Error(let type, let message){
            print(message)
        }catch{
            print("error")
        }

        
        
        
        
        print("00- webViewDidStartLoad")
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("@@- webViewDidFinishLoad")
        
        var htmlStr = webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")!
        do{
            let doc: Document = try! SwiftSoup.parse(htmlStr)
            var qTitle = try doc.select("div.ng-scope header").first()
            
//            for element in elements.array() {
            
            if qTitle != nil{
                try print("str = \(qTitle?.html())")
                try qTitle?.append(qTitle!.html())
            }else{
//                print("element is nil,html is ")
            }
            
            
            
//            }
            
            qIndex+=1
            

        }catch Exception.Error(let type, let message){
            print(message)
        }catch{
            print("error")
        }
        print("00- webViewDidFinishLoad")
        
        if qIndex==50{
            myTimer.invalidate()
//            self.convertJSONtoString()
        }
        
    }

    func convertJSONtoString(){
        if let string = qTitleJSON[0].rawString() {
            //Do something you want
            print(string)
        }
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
