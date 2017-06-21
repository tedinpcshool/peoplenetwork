//
//  TEDPerson.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/21.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TEDPerson: NSObject {
    var firstName:String?
    var lastName:String?
    
    init(myFirstName:String,myLastName:String){
        firstName=myFirstName
        lastName=myLastName
    }
    
}
