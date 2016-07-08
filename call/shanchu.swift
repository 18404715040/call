//
//  shanchu.swift
//  call
//
//  Created by 20141105074 on 16/7/8.
//  Copyright © 2016年 20141105074. All rights reserved.
//

import UIKit
class shanchu: UIViewController {
    var db:SQLiteDB!
    
    @IBAction func del(sender: AnyObject) {
        delete()
    }
  @IBOutlet weak var text1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    func delete() {
        let a = text1.text!
        let sql = "delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
    }

  
        }