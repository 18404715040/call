//
//  ViewController.swift
//  call
//
//  Created by 20141105074 on 16/7/4.
//  Copyright © 2016年 20141105074. All rights reserved.
//

import UIKit

class chazhao: UIViewController {
     var db:SQLiteDB!
    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        //initUser()
    }

    @IBAction func chazhaosuoyou(sender: AnyObject) {
         selete()
    }
    func selete() {
       text.text=""
        let data = db.query("select * from user")
        
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            text.text! += "姓名:" + String(user["uname"]!) + "\n" + "电话: " + String(user["mobile"]!) +  "\n" + "地址:" + String(user["address"]!) + "\n" + "电子邮件: " + String(user["email"]!) 
        }
    }
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}