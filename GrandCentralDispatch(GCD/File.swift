//
//  File.swift
//  GrandCentralDispatch(GCD
//
//  Created by Yusuf DEMİRKOPARAN on 25.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class file : UITableViewController {
    
    let dataArray = ["https://via.placeholder.com/600/92c952",
    "https://via.placeholder.com/600/24f355",
    "https://via.placeholder.com/600/d32776",
    "https://via.placeholder.com/600/d32776",
    "https://via.placeholder.com/600/56a8c2",
    "https://via.placeholder.com/600/b0f7cc",
    "https://via.placeholder.com/600/51aa97",
    "https://via.placeholder.com/600/810b14",
    "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-767749.png"]
    let cellID = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cells.self, forCellReuseIdentifier: cellID)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! cells
        let url = URL(string: dataArray[indexPath.row])
        DispatchQueue.global().async {
             var data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.Image.image = UIImage(data: data!)
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class cells : UITableViewCell {
    
    lazy var Image : UIImageView = {
       var img = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(Image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
