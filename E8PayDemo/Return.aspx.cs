using E8PayDemo.Util;
using System;
using System.Configuration;

namespace E8PayDemo
{
    public partial class Return : System.Web.UI.Page
    {
        protected string PublicKey => ConfigurationManager.AppSettings["PublicKey"];
        protected decimal Money { get; set; }
        protected string UserOrderNo { get; set; }
        protected string SysOrderNo { get; set; }
        protected string Status { get; set; }
        protected string IsSign { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GatewayData gateway = new GatewayData();
                gateway.FromNameValueCollection(Request.QueryString);
                var Sign = gateway.GetStringValue("ly_sign");
                gateway.Remove("ly_sign");
                Money = gateway.GetIntValue("ly_money");
                UserOrderNo = gateway.GetStringValue("ly_user_order_no");
                SysOrderNo = gateway.GetStringValue("ly_sys_order_no");
                Status = gateway.GetStringValue("result_status") == "S" ? "付款成功" : "付款失败";
                if (EncryptUtil.RSAVerifyData(gateway.ToUrl(), Sign, PublicKey))
                {
                    IsSign = "验签成功";
                }
                else
                {
                    var signdata = gateway.ToUrl().Replace("/", "\\/");
                    IsSign = EncryptUtil.RSAVerifyData(signdata, Sign, PublicKey) ? "验签成功" : "验签失败";
                }
            }
        }
    }
}