Shader "Unlit/Mone" {
	Properties{
		_MainTex("Base (RGB) Trans (A)", 2D) = "white" {}
	}

		SubShader{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		LOD 100

		Cull back

		Ztest Always
		Blend SrcAlpha OneMinusSrcAlpha

		Pass{
		Lighting Off
		SetTexture[_MainTex]{ combine texture }
	}
	}
}