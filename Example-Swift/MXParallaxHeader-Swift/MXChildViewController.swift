// MXChildViewController.swift
//
// Copyright (c) 2015 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MXParallaxHeader

class MXChildViewController: UIImagePickerController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var header: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.delegate = self
        
        // Parallax Header
        self.header = UIImageView()
        self.header.image = UIImage(named:"success-baby")
        self.header.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.parallaxHeader!.view = header
        self.parallaxHeader!.height = 150
        self.parallaxHeader!.mode = MXParallaxHeaderMode.Fill
        self.parallaxHeader!.minimumHeight = 20
    }
    
    @IBAction func reduceHeader(sender: AnyObject) {
        self.parallaxHeader!.height -= 10
    }
    
    @IBAction func extendHeader(sender: AnyObject) {
        self.parallaxHeader!.height += 10
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.header.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
}
