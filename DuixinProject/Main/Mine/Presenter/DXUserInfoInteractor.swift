//  DXUserInfoInteractor.swift
//  DuixinProject
//  Created by Taurus on 2020/3/10.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXUserInfoInteractor: DXBaseInteractor {
    var vc: DXUserInfoVC!
    var picker: UIImagePickerController = UIImagePickerController.init()
    
    required init(){
        super.init()
        
        picker.delegate = self
        picker.allowsEditing = false
    }

}

extension DXUserInfoInteractor: DXCameraViewProtocal{
    func didCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        vc.present(picker, animated: true) { [weak vc] in
            guard let strongvc = vc else {return}
            strongvc.cameraView.removeFromSuperview()
        }
    }
    
    func didPhote() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            picker.sourceType = .photoLibrary
        }
        vc.present(picker, animated: true) { [weak vc] in
            guard let strongvc = vc else {return}
            strongvc.cameraView.removeFromSuperview()
        }
    }
    
    func didCancle() {
        vc.cameraView.removeFromSuperview()
    }
}

extension DXUserInfoInteractor: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
}
