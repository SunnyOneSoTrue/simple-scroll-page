//
//  AddNewPostViewController.swift
//  simple scroll page
//
//  Created by USER on 11.04.22.
//

import UIKit


protocol ScrollPageViewControllerDelegate {
    func didAddPost(_ post: Post)
}

class AddNewPostViewController: UIViewController {
    
    var ScrollPageViewControllerDelegate: ScrollPageViewControllerDelegate?

    var user: User = User(name: "", username: "", image: UIImage())
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        postButton.isHidden = true
        ImageView.isHidden = true
        
        
    }
    
    @IBAction func onAddNewImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func onPost(_ sender: Any) {
        
        ScrollPageViewControllerDelegate?.didAddPost(Post(user: user, text: textView.text ?? "", image: ImageView.image ?? nil))
        
        self.dismiss(animated: true)
        
    }
    
}

extension AddNewPostViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            ImageView.image = image
        }
        
        picker.dismiss(animated: true) { [self] in
            postButton.isHidden = false
            ImageView.isHidden = false
            addImageButton.isEnabled = false
            addImageButton.isHidden = true
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
    
}
