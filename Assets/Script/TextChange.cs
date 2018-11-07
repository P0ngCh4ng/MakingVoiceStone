using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text.RegularExpressions;
using UnityEngine.UI;
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
        nowString = WSVoiceRecognition.GetGiveS();

        if (currentString != nowString)
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
            Vector3 random = new Vector3(Random.Range(-10f, 10f), Random.Range(-10f, 10f), 0);

            //テキストオブジェクトの生成
            textObject = FlyingText.GetObjects(nowString, mat, mat, 1.0f, 0.25f, 1, random, Quaternion.identity);

            //物理演算の設定(RigidBody)
            var rigidbodies = textObject.GetComponentsInChildren<Rigidbody>();
            foreach (var rb in rigidbodies)
            {
                Vector3 vel = new Vector3(0, 0, 10f);
                rb.velocity = vel;
                rb.useGravity = false;
            }

            //削除時間の設定
            Destroy(textObject, 4.0f);

            //多重処理防止
            currentString = nowString;
        }
    }
}
