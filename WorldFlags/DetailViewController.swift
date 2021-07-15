//
//  DetailViewController.swift
//  WorldFlags
//
//  Created by Oluwabusayo Olorunnipa on 7/1/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    var countryName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = countryName
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func buttonTapped(){
        guard let image = imageView.image?.pngData()
        else {
            print("No image found")
            return
        }
        
        let ac = UIActivityViewController(activityItems: ["Check out the flag for \(countryName!)", image], applicationActivities:[])
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    
    }
    


}
