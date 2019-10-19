using E8PayDemo.Util;
using System;
using System.Configuration;

namespace E8PayDemo
{
    public partial class Notify : System.Web.UI.Page
    {
        protected string PublicKey => ConfigurationManager.AppSettings["PublicKey"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GatewayData gateway = new GatewayData();
                gateway.FromNameValueCollection(Request.Form);
                var Sign = gateway.GetStringValue("ly_sign");
                gateway.Remove("ly_sign");
                if (EncryptUtil.RSAVerifyData(gateway.ToUrl(), Sign, PublicKey))
                {
                    Response.Write("Success");
                    Response.End();
                }
                else
                {
                    Response.Write("Fail");
                    Response.End();
                }
            }
        }
    }
}