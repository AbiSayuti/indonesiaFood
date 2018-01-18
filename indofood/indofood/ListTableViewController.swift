//
//  ListTableViewController.swift
//  indofood
//
//  Created by Abi Sayuti on 1/18/18.
//  Copyright © 2018 Abi Sayuti. All rights reserved.
//

import UIKit

import UIKit
import Alamofire
import SwiftyJSON

class ListTableViewController: UITableViewController {

    var arrMakanan = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://localhost/Indonesiafood/index.php/api/getMakanan").responseJSON { (response) in
            
            //check response
            if response.result.isSuccess {
                //kalau respon sukses kita ambil json
                let json = JSON(response.result.value as Any)
                //get jsonArray dari json Diatas
                self.arrMakanan = json["data"].arrayObject as! [[String : String]]
                //check di log
                //print(self.arrayBerita)
                
                //check jumlah array
                if(self.arrMakanan.count > 0){
                    //refresh table view
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrMakanan.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellListmkn", for: indexPath) as! ListTableViewCell
        
        var serverid = arrMakanan[indexPath.row]
        
        var id = serverid["food_id"]
        let makanan = serverid["name"]
        
        //pindahkan ke masing masing label
       cell.labelmkn.text = makanan
        return cell
    }

    
    //pindah ke layout selanjutnya
    //dan melempar ke id kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //deklarasi idStoryBoard untuk pindah halaman
        let idStoryBoard = storyboard?.instantiateViewController(withIdentifier: "listmkn") as! DetiailViewController
        let id_kelas = arrKelas[indexPath.row]["food_id"]
        
       
        
        show(idStoryBoard, sender: self)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
