using UnityEngine;
using WebSocketSharp;
using System.Collections;

public class WSVoiceRecognition : MonoBehaviour {
    private WebSocket ws_;
    private string giveS;
    public string GetGiveS()
    {
        return giveS;
    }
    void Awake()
    {
        ws_ =  new WebSocket("ws://127.0.0.1:12002");
        ws_.OnMessage += (sender, e) => {
            Debug.Log(e.Data); // 認識結果,e.Dataを渡したい
           giveS = e.Data;
        };
        ws_.Connect();

    }

    void OnApplicationQuit()
    {
        ws_.Close();
    }
}
