//
//  InIMGViewController.swift
//  filterFace
//
//  Created by Krishna Kushwaha on 12/12/20.
//

import UIKit
import Vision

class InIMGViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let photoTap = UITapGestureRecognizer(target: self, action: #selector(promptPhoto))
               self.view.addGestureRecognizer(photoTap)
    }
    override func viewDidAppear(_ animated: Bool) {
              super.viewDidAppear(animated)
              
              if imageView.image == nil {
                  promptPhoto()
              }
          }
    
    
    @objc
    func promptPhoto() {
        
        let prompt = UIAlertController(title: "Choose a Photo",
                                       message: "Please choose a photo.",
                                       preferredStyle: .actionSheet)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        func presentCamera(_ _: UIAlertAction) {
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        
        let cameraAction = UIAlertAction(title: "Camera",
                                         style: .default,
                                         handler: presentCamera)
        
        func presentLibrary(_ _: UIAlertAction) {
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library",
                                          style: .default,
                                          handler: presentLibrary)
        
        func presentAlbums(_ _: UIAlertAction) {
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true)
        }
        
        let albumsAction = UIAlertAction(title: "Saved Albums",
                                         style: .default,
                                         handler: presentAlbums)
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        prompt.addAction(cameraAction)
        prompt.addAction(libraryAction)
        prompt.addAction(albumsAction)
        prompt.addAction(cancelAction)
        
        self.present(prompt, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
          
          func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
              // Dismiss picker, returning to original root viewController.
              dismiss(animated: true, completion: nil)
          }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
           {
        
            // Extract chosen image.
            if let ProcessImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                       
            // Display image on screen.
            show(ProcessImg)
                
            // Convert from UIImageOrientation to CGImagePropertyOrientation.
            let cgOrientation = CGImagePropertyOrientation(rawValue: UInt32(ProcessImg.imageOrientation.rawValue))
                 
            // Fire off request based on URL of chosen photo.
            guard let cgImage = ProcessImg.cgImage else { return }
                

                    
            }
            self.dismiss(animated: true, completion: nil)
            
        }
    


    func show(_ image: UIImage) {
        imageView.image = image

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
