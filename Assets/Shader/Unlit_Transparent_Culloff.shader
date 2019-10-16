Shader "Unlit/Transparent_Culloff" {
	Properties{
		_MainTex("Base (RGB) Trans (A)", 2D) = "white" {}
	}

		SubShader{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		LOD 100

		Cull off

		Zwrite Off
		Blend SrcAlpha OneMinusSrcAlpha

		Pass{
		Lighting Off
		SetTexture[_MainTex]{ combine texture }
	}
	}
}