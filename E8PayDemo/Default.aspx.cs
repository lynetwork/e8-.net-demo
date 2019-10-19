using E8PayDemo.Util;
using System;
using System.Configuration;
using System.Web.UI;

namespace E8PayDemo
{
    public partial class _Default : Page
    {
        private static string strGateUrl = ConfigurationManager.AppSettings["ReferUrl"];//官方地址
        protected string PrivateKey => ConfigurationManager.AppSettings["PrivateKey"];
        protected string OrderNo => Number.GetAPIBillNo();
        protected bool IsIOS => Request.UserAgent.Contains("iPhone");
        protected bool IsAndroid => Request.UserAgent.Contains("Android");
        protected bool IsQQ => Request.UserAgent.Contains("QQ/");
        protected bool IsWeXin => Request.UserAgent.Contains("MicroMessenger");
        protected bool IsAlipay => Request.UserAgent.Contains("AlipayDefined") || Request.UserAgent.Contains("AliApp") || Request.UserAgent.Contains("AlipayClient");

        protected string ReturnUrl => $"http://{Request.Url.Host}:{Request.Url.Port}/Return.aspx";

        protected string NotifyUrl => $"http://{Request.Url.Host}:{Request.Url.Port}/Notify.aspx";

        protected string UserID => ConfigurationManager.AppSettings["UserInfoID"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GatewayData gateway = new GatewayData();
                gateway.FromNameValueCollection(Request.Form);
                gateway.Add("ly_sign", EncryptUtil.RSA(gateway.ToUrl(), PrivateKey));
                Response.Redirect($"{strGateUrl}?{gateway.ToUrl(true)}");
            }
        }
    }
}