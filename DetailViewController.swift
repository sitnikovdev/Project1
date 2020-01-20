//
//  DetailViewController.swift
//  Project1
//
//  Created by Oleg Sitnikov on 17.01.2020.
//  Copyright © 2020 Oleg Sitnikov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var index = 0
    var pictureCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = "Picture \(index + 1) of \(pictureCount)"
        title = label
        
        navigationItem.largeTitleDisplayMode = .never
        
        // 1. check if any image selected
        if let imageToLoad = selectedImage {
        // 2. load selected image
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
}
