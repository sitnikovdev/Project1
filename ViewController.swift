//
//  ViewController.swift
//  Project1
//
//  Created by Oleg Sitnikov on 16.01.2020.
//  Copyright © 2020 Oleg Sitnikov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let paht = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: paht)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        pictures = pictures.sorted(by:<)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set it's selectedImage property to user selected image
            vc.selectedImage = pictures[indexPath.row]
            vc.index = indexPath.row
            vc.pictureCount = pictures.count
            // 3: show detail view
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

