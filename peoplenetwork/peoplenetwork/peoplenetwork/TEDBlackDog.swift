//
//  TEDBlackDog.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/5.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TEDBlackDog: NSObject {
    var numOfEars=2
    
    class func getSpice()->String{
        return "犬綱"
    }
    
    func getNumOfears()->Int{
        return self.numOfEars
    }
}
