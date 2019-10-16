using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text.RegularExpressions;
using UnityEngine.UI;
using System;
//using FlyingText3D;
public class TextChange : MonoBehaviour
{
    public WSVoiceRecognition WSVoiceRecognition;

    public Material DefaultMat;
    public Material RedMat;
    public Material BlueMat;
    public Material GreenMat;
    public Material PinkMat;
    public Material YellowMat;
    public Material OrangeMat;
    public Material GrayMat;
    public Material PurpleMat;
	private static bool flag;
    private static int a;
    private string currentString;
    private string nowString;
    private UnityEngine.GameObject textObject;
    private UnityEngine.Transform textPos;
    void Start()
    {
        // var hoge = new FlyingText();
        RenderSettings.fog = true;
        //    RenderSettings.fogColor = Camera.main.backgroundColor;
        RenderSettings.fogMode = FogMode.Linear;
        RenderSettings.fogEndDistance = 20.0f;


    }

    // Update is called once per frame
    void Update()
    {
		flag = false;
        a += 1;
        nowString = WSVoiceRecognition.GetGiveS();
		nowString = "a";
		if (a >= 100)
        {
            a = 0;
            nowString = "aaaa";
			flag = true;
        }
        if (currentString != nowString||flag == true)
        {
            //取得したテキストからマテリアルを決定
            Material mat = DefaultMat;
            if (Regex.IsMatch(nowString, @"赤"))
                mat = RedMat;
            if (Regex.IsMatch(nowString, @"青"))
                mat = BlueMat;
            if (Regex.IsMatch(nowString, @"黄"))
                mat = YellowMat;
            if (Regex.IsMatch(nowString, @"緑"))
                mat = GreenMat;
            if (Regex.IsMatch(nowString, @"ピンク"))
                mat = PinkMat;
            if (Regex.IsMatch(nowString, @"オレンジ"))
                mat = OrangeMat;
            if (Regex.IsMatch(nowString, @"灰"))
                mat = GrayMat;
			if (Regex.IsMatch(nowString, @"紫"))
				mat = PurpleMat;
            //テキストの生成位置
            Vector3 random = new Vector3(0,0, 14.0f);

            //テキストオブジェクトの生成
            textObject = FlyingText.GetObjects(nowString, mat, mat, 1.0f, 0.25f, 1, random, Quaternion.identity);

            //物理演算の設定(RigidBody)
            var rigidbodies = textObject.GetComponentsInChildren<Rigidbody>();
			//PhysicMaterial Physic = textObject.GetComponents<Collider>;
			var rand = new System.Random();
			//Physic.bounciness = 0.5f;
			foreach (var rb in rigidbodies)
			{
				rb.AddForce((float)(rand.Next(50) - 25), (float)(rand.Next(50) - 25), 0, ForceMode.Impulse);
				rb.detectCollisions = true;
				rb.useGravity = true;
				rb.constraints = RigidbodyConstraints.FreezePositionZ;
			}
         /*   if (trigger == true)
                Destroy(textObject, 0.0f); */

            //削除時間の設定
            Destroy(textObject, 10.0f);

            //多重処理防止
            currentString = nowString;
        }
    }
}
