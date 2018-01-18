//
//  DetiailViewController.swift
//  indofood
//
//  Created by Abi Sayuti on 1/18/18.
//  Copyright © 2018 Abi Sayuti. All rights reserved.
//

import UIKit

class DetiailViewController: UIViewController {

    @IBOutlet weak var Namamakanan: UILabel!
    @IBOutlet weak var hargaMakanan: UILabel!
    
    var passNama:String?
    var passharga:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Namamakanan.text =   passNama!
        hargaMakanan.text = "harganya: " + passharga!
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
