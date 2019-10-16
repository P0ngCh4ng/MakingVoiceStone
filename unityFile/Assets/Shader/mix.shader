// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33601,y:32566,varname:node_3138,prsc:2|emission-1434-OUT;n:type:ShaderForge.SFN_Tex2d,id:3003,x:32734,y:32681,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_3003,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b4646ae63b0bcca40b1bdde3b87e01bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3456,x:32734,y:32882,ptovrint:False,ptlb:SubTex,ptin:_SubTex,varname:node_3456,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:aa762ee7680f35f4fb9a9210fa94ce61,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:9731,x:32985,y:32772,ptovrint:False,ptlb:Mix,ptin:_Mix,varname:node_9731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Lerp,id:1434,x:33364,y:32687,varname:node_1434,prsc:2|A-3003-RGB,B-4928-OUT,T-9731-OUT;n:type:ShaderForge.SFN_Tex2d,id:3888,x:32734,y:33071,ptovrint:False,ptlb:MaskTex,ptin:_MaskTex,varname:node_3888,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5125,x:32916,y:32882,varname:node_5125,prsc:2|A-3456-RGB,B-3888-RGB;n:type:ShaderForge.SFN_OneMinus,id:120,x:32916,y:33071,varname:node_120,prsc:2|IN-3888-RGB;n:type:ShaderForge.SFN_Add,id:4928,x:33364,y:32881,varname:node_4928,prsc:2|A-5125-OUT,B-3599-OUT;n:type:ShaderForge.SFN_Slider,id:9011,x:32723,y:33271,ptovrint:False,ptlb:,ptin:_,varname:node_9011,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:3599,x:33181,y:32965,varname:node_3599,prsc:2|A-3003-RGB,B-120-OUT,C-9011-OUT;proporder:3003-3456-9731-3888-9011;pass:END;sub:END;*/

Shader "Shader Forge/mix" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _SubTex ("SubTex", 2D) = "white" {}
        _Mix ("Mix", Range(0, 1)) = 1
        _MaskTex ("MaskTex", 2D) = "white" {}
        _ ("", Range(0, 1)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _SubTex; uniform float4 _SubTex_ST;
            uniform float _Mix;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            uniform float _;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _SubTex_var = tex2D(_SubTex,TRANSFORM_TEX(i.uv0, _SubTex));
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(i.uv0, _MaskTex));
                float3 emissive = lerp(_MainTex_var.rgb,((_SubTex_var.rgb*_MaskTex_var.rgb)+(_MainTex_var.rgb*(1.0 - _MaskTex_var.rgb)*_)),_Mix);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
