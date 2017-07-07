//
//  TEDBluetoothMainVC.swift
//  peoplenetwork
//
//  Created by ios on 2017/7/7.
//  Copyright © 2017年 pcschool. All rights reserved.
//




import UIKit
import CoreBluetooth

class TEDBluetoothMainVC: UIViewController,CBCentralManagerDelegate,
CBPeripheralDelegate {
    var manager:CBCentralManager!
//    var manager:CBManagerState!
    var peripheral:CBPeripheral!
    
    
    let BEAN_NAME = "Robu"
    let BEAN_SCRATCH_UUID =
        CBUUID(string: "a495ff21-c5b1-4b44-b512-1370f02d74de")
    let BEAN_SERVICE_UUID =
        CBUUID(string: "a495ff20-c5b1-4b44-b512-1370f02d74de")
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
        } else {
            print("Bluetooth not available.")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        manager=CBManagerState(rawValue: <#T##Int#>)
        
        manager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
        
        
//        #if __IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_9_3
//            #define CBManagerState CBCentralManagerState
//            #define CBManagerStateUnknown CBCentralManagerStateUnknown
//            #define CBManagerStateResetting CBCentralManagerStateResetting
//            #define CBManagerStateUnsupported CBCentralManagerStateUnsupported
//            #define CBManagerStateUnauthorized CBCentralManagerStateUnauthorized
//            #define CBManagerStatePoweredOff CBCentralManagerStatePoweredOff
//            #define CBManagerStatePoweredOn CBCentralManagerStatePoweredOn
//        #endif
        
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

extension CBCentralManager {
    internal var centralManagerState: CBCentralManagerState  {
        get {
            return CBCentralManagerState(rawValue: state.rawValue) ?? .unknown
        }
    }
}
