using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class CreateBox : MonoBehaviour
{
	
	void Start() {

		GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/prefabs/Cube.prefab");

		// プレハブからインスタンスを生成
		GameObject instanceObject = Instantiate(prefab, new Vector3(0, 0, 20.0f), Quaternion.identity);
		instanceObject.transform.localScale = new Vector3(10.0f, 10.0f, 0);

		GameObject WallA = Instantiate(prefab, new Vector3(5.0f, 0, 19.0f), Quaternion.identity);
		WallA.transform.localScale = new Vector3(10.0f, 0, 0);
		GameObject WallB = Instantiate(prefab, new Vector3(-5.0f, 0, 19.0f), Quaternion.identity);
		WallB.transform.localScale = new Vector3(10.0f, 0, 0);
	
		GameObject WallC = Instantiate(prefab, new Vector3(0, 5.0f, 19.0f), Quaternion.identity);
		WallC.transform.localScale = new Vector3(0, 10.0f, 0);

		GameObject WallD = Instantiate(prefab, new Vector3(0, -5.0f, 19.0f), Quaternion.identity);
		WallD.transform.localScale = new Vector3(0, 10.0f, 0);
 }

}

