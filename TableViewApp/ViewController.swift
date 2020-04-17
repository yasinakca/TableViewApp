//
//  ViewController.swift
//  TableViewApp
//
//  Created by YASIN AKCA on 17.04.2020.
//  Copyright © 2020 YASIN AKCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var imageArray = [UIImage]()
    var nameArray = [String]()
    
    var chosenName = ""
    var chosenImage: UIImage?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameArray.append("Colesseum")
        nameArray.append("Greatwall")
        nameArray.append("Kremlin")
        nameArray.append("Stonehenge")
        nameArray.append("Tajmahal")
        
        imageArray.append(UIImage(named: "colosseum.jpg")!)
        imageArray.append(UIImage(named: "greatwall.jpg")!)
        imageArray.append(UIImage(named: "kremlin.jpg")!)
        imageArray.append(UIImage(named: "stonehenge.jpg")!)
        imageArray.append(UIImage(named: "tajmahal.jpg")!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destination = segue.destination as! SecondViewController
            destination.selectedName = chosenName
            destination.selectedImage = chosenImage
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = nameArray[indexPath.row]
        chosenImage = imageArray[indexPath.row]
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }

}

