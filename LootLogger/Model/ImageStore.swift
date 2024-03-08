//
//  ImageStore.swift
//  LootLogger
//
//  Created by YB on 3/7/24.
//

import UIKit

class ImageStore {
    let cache = NSCache<NSString,UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) -> Void {
        let url = imageURL(forKey: key)
        if let data = image.jpegData(compressionQuality: 0.5){
            try? data.write(to: url)
        }
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        if let image = cache.object(forKey: key as NSString) {
            return image
        }
        let imageURL = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.absoluteString) else {
            return nil
        }
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    
    func deleteImage(forKey key: String) -> Void {
        let imageURL = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: imageURL)
        } catch {
            print("Error removing image from disk: \(error)")
        }
        cache.removeObject(forKey: key as NSString)
    }
    
    func imageURL(forKey key: String) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = documentsDirectory.first!.appending(path: key)
        return url
    }
}
