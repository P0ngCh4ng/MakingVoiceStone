using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{

	// Start is called before the first frame update
	void Start()
    {


		// ワールド座標を基準に、座標を取得


	}

    // Update is called once per frame
    void Update()
    {
		Transform myTransform = this.transform;
		Vector3 worldPos = myTransform.position;
		if (worldPos.z <= 14.0f || worldPos.z >= 15.5f) { 
			if (worldPos.y <= -5.0f)
			{
				worldPos.y = 1.0f;
			}

			worldPos.z = 14.0f;

			myTransform.position = worldPos;
		}
	}
}
