//
//  ViewController.swift
//  PakuPakuTodo
//
//  Created by 桜井広大 on 2018/07/03.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //表示時にデータ格納
        let userDefaults = UserDefaults.standard
        let data = MyData()
        data.valueString = "test"
        
        //シリアライズ
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(archiveData, forKey: "data")
        userDefaults.synchronize()
        
        //デシリアライズ
        if let storedData = userDefaults.object(forKey: "data") as? Data {
            if let unarchivedData =
                NSKeyedUnarchiver.unarchiveObject(with:storedData) as? MyData {
                if let valueString = unarchivedData.valueString {
                    print("デシリアライズデータ:" + valueString)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

