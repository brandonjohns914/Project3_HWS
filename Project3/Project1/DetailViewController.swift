//
//  DetailViewController.swift
//  Project1
//
//  Created by Brandon Johns on 4/19/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selected_Image: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selected_Image
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let image_to_load = selected_Image
        {
            imageView.image = UIImage(named: image_to_load)
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    @objc func shareTapped()
    {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("no image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
