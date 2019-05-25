//
//  ViewController.swift
//  GrandCentralDispatch(GCD
//
//  Created by Yusuf DEMİRKOPARAN on 25.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var GroubA = ["user1","user2"]
    var GroupB  = ["user3","user4"]
    var GroupC = ["user5","user6"]
    var lig = [String]()
    var dispathGroup = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        start()
    }
    func g1(){
        dispathGroup.enter()
        run(with: 2) {
            self.lig.append(contentsOf: self.GroubA)
            print("print 1 \(self.lig.description)")
            self.dispathGroup.leave()
        }
      
    }
    func g2(){
        dispathGroup.enter()
        run(with: 4) {
            self.lig.append(contentsOf: self.GroupB)
            print("print2 \(self.lig.description)")
            self.dispathGroup.leave()
        }
    }
    func start() {
            print(self.lig.description)
        dispathGroup.notify(queue: .main) {
            //Bütün verileri çekip aynı zamanda gösteriyor
            self.g1()
            self.g2()
        }
    }
    func run(with Seconds: Int, compleiton: @escaping ()->Void){
        let deadline = DispatchTime.now() + .seconds(Seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            compleiton()
        }
    }
    

}

