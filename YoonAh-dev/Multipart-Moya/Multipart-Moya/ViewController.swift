//
//  ViewController.swift
//  Multipart-Moya
//
//  Created by SHIN YOON AH on 2021/09/01.
//

import UIKit
import Moya

class ViewController: UIViewController {
    private let authProvider = MoyaProvider<AddActionService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private var model: AddActionModel?
    
    private var image: UIImage?
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func touchupPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func touchupCreate(_ sender: Any) {
        fetchCreateAction()
    }
    
    @IBAction func touchupDelete(_ sender: Any) {
        deleteAction()
    }
    
    @IBAction func touchupEdit(_ sender: Any) {
        editAction()
    }
}

extension ViewController {
    func fetchCreateAction() {
        authProvider.request(.create(image, "moya test", "2021", "09", "05", 1)) { response in
            switch response {
            case .success(let result):
                do {
                    self.model = try result.map(AddActionModel.self)
                    print("success")
                    dump(self.model)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func deleteAction() {
        let param = DeleteActionRequest.init(1, 8)
        authProvider.request(.delete(param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.model = try result.map(AddActionModel.self)
                    print("success")
                    dump(self.model)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func editAction() {
        authProvider.request(.edit(image, "moya test editing mode", "2021", "09", "05", 1, 9)) { response in
            switch response {
            case .success(let result):
                do {
                    self.model = try result.map(AddActionModel.self)
                    print("success")
                    dump(self.model)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
