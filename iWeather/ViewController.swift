//
//  ViewController.swift
//  iWeather
//
//  Created by Hoàng Minh Thành on 8/20/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var lb_danhngon: UILabel!
    @IBOutlet weak var btn_nhietdo: UIButton!
    @IBOutlet weak var donvi: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    var thanhngu = ["Có công mài sắt có ngày nên kim","Không thầy đố mày làm nên","Một nắng hai sương","Nhà sạch thì mát, bát sạch ngon cơm","Ở hiền gặp lành","Phòng bệnh hơn chữa bệnh","Ruộng sâu trâu nái không bằng con gái đầu lòng","Sinh cơ lập nghiệp","Thương cho roi cho vọt, ghét cho ngọt cho bùi"]
    
    var thanhpho = ["Hà Nội","Hồ Chí Minh","Đà Nẵng","Nha Trang","Cần Thơ","Nam Định","Nghệ An","Thanh Hoá","Cà Mau","Bắc Ninh","Hưng Yên"]
    
    var hinhnen = ["blood","sun","moon","weather","rain","cloudy"]
    
    
    func rdnhietdo() -> Double {
        return Double(arc4random_uniform(18)+14) + Double(arc4random()) / Double (INT32_MAX)
    }

    var c : Double = 0.0
    var f : Double = 0.0
    var nhiet : Double = 0
    func getnhietdo(){
        nhiet = rdnhietdo()
        f = (nhiet * 1.8) + 32
        c = (f - 32)/1.8
        btn_nhietdo.setTitle(String(format: "%2.1f",nhiet), forState: .Normal)
    }
    @IBAction func action_refresh(sender: UIButton) {
        if sender.tag == 0
        {
            let cityindex = Int(arc4random_uniform(UInt32(thanhpho.count)))
            city.text = thanhpho[cityindex]
            
            let thanhnguindex = Int(arc4random_uniform(UInt32(thanhngu.count)))
            lb_danhngon.text = thanhngu[thanhnguindex]
            
            let imageindex = Int(arc4random_uniform(UInt32(hinhnen.count)))
            background.image = UIImage.init(named:hinhnen[imageindex])
            
            getnhietdo()
        }

    }

    @IBAction func action_nhietdo(sender: UIButton) {
        if donvi.text == "C"
        {
            btn_nhietdo.setTitle(String(format:"%2.1f",f), forState: .Normal)
            donvi.text = "F"
        }
        else
        {
            if donvi.text == "F"
            {
                btn_nhietdo.setTitle(String(format:"%2.1f",c), forState: .Normal)
                donvi.text = "C"
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getnhietdo()
    }


}

