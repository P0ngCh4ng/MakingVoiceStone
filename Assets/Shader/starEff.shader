// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33317,y:32663,varname:node_3138,prsc:2|emission-2772-OUT;n:type:ShaderForge.SFN_Tex2d,id:412,x:32401,y:32856,ptovrint:False,ptlb:node_412,ptin:_node_412,varname:node_412,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0e349c7451aa504a972786f7c168706,ntxv:0,isnm:False|UVIN-8530-UVOUT;n:type:ShaderForge.SFN_RgbToHsv,id:53,x:32617,y:32856,varname:node_53,prsc:2|IN-412-RGB;n:type:ShaderForge.SFN_HsvToRgb,id:2772,x:33133,y:32702,varname:node_2772,prsc:2|H-3807-OUT,S-53-SOUT,V-53-VOUT;n:type:ShaderForge.SFN_Time,id:2163,x:32233,y:32371,varname:node_2163,prsc:2;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:7936,x:32675,y:32507,varname:node_7936,prsc:2|IN-6339-OUT,IMIN-9228-OUT,IMAX-9960-OUT,OMIN-7587-OUT,OMAX-5212-OUT;n:type:ShaderForge.SFN_Add,id:3807,x:32862,y:32577,varname:node_3807,prsc:2|A-7936-OUT,B-53-HOUT;n:type:ShaderForge.SFN_Vector1,id:9228,x:32405,y:32502,varname:node_9228,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:9960,x:32405,y:32558,varname:node_9960,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:7587,x:32405,y:32618,varname:node_7587,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5212,x:32405,y:32686,varname:node_5212,prsc:2,v1:-0.1;n:type:ShaderForge.SFN_Sin,id:4716,x:32405,y:32371,varname:node_4716,prsc:2|IN-2163-TDB;n:type:ShaderForge.SFN_Abs,id:6339,x:32576,y:32371,varname:node_6339,prsc:2|IN-4716-OUT;n:type:ShaderForge.SFN_TexCoord,id:3681,x:31960,y:32856,varname:node_3681,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:8530,x:32197,y:32856,varname:node_8530,prsc:2,spu:1,spv:1|UVIN-3681-UVOUT;proporder:412;pass:END;sub:END;*/

Shader "Shader Forge/starEff" {
    Properties {
        _node_412 ("node_412", 2D) = "white" {}
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
            uniform sampler2D _node_412; uniform float4 _node_412_ST;
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
                float4 node_2163 = _Time;
                float node_9228 = 0.0;
                float node_7587 = 0.0;
                float4 node_8257 = _Time;
                float2 node_8530 = (i.uv0+node_8257.g*float2(1,1));
                float4 _node_412_var = tex2D(_node_412,TRANSFORM_TEX(node_8530, _node_412));
                float4 node_53_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_53_p = lerp(float4(float4(_node_412_var.rgb,0.0).zy, node_53_k.wz), float4(float4(_node_412_var.rgb,0.0).yz, node_53_k.xy), step(float4(_node_412_var.rgb,0.0).z, float4(_node_412_var.rgb,0.0).y));
                float4 node_53_q = lerp(float4(node_53_p.xyw, float4(_node_412_var.rgb,0.0).x), float4(float4(_node_412_var.rgb,0.0).x, node_53_p.yzx), step(node_53_p.x, float4(_node_412_var.rgb,0.0).x));
                float node_53_d = node_53_q.x - min(node_53_q.w, node_53_q.y);
                float node_53_e = 1.0e-10;
                float3 node_53 = float3(abs(node_53_q.z + (node_53_q.w - node_53_q.y) / (6.0 * node_53_d + node_53_e)), node_53_d / (node_53_q.x + node_53_e), node_53_q.x);;
                float3 emissive = (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(((node_7587 + ( (abs(sin(node_2163.b)) - node_9228) * ((-0.1) - node_7587) ) / (1.0 - node_9228))+node_53.r)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),node_53.g)*node_53.b);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
