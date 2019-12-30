//
//  ViewController.swift
//  ARDicee
//
//  Created by Keishin CHOU on 2019/12/30.
//  Copyright © 2019 Keishin CHOU. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
//        sceneView.scene = scene
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = UIColor.red
        cube.materials = [cubeMaterial]
        
        let sphere = SCNSphere(radius: 0.2)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/8k_jupiter.jpg")
        sphere.materials = [sphereMaterial]
        
        
        let cubeNode = SCNNode()
        cubeNode.position = SCNVector3(x: 0.1, y: 0.5, z: -1)
        cubeNode.geometry = cube
        
        let sphereNode = SCNNode()
        sphereNode.position = SCNVector3(x: -1, y: 0, z: -1)
        sphereNode.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
        sceneView.scene.rootNode.addChildNode(sphereNode)
        sceneView.autoenablesDefaultLighting = true
//        sceneView.automaticallyUpdatesLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
