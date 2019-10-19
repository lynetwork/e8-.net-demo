<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E8PayDemo._Default" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>易呗云支付-DEMO</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->



    <style>
        input {
            padding：2px 8px 0pt 3px;
            /*height:18px;*/
            border：1px solid #999;
            background-color: #f5eeee;
        }

        body {
            /*text-align：center;*/
            font-family：Georgia;
            FILTER：Alpha( style=1,opacity=25,finishOpacity=100, startX=50,finishX= 100,startY=50,finishY=100);
            background-color： #fff;
        }
    </style>
</head>
<body style="background-color: #FFFFFF">


    <div class="container" style="padding: 30px;">

        <div class="row">

            <div class="form-group">
                <div class="col-sm-12 text-center">
                    <h1>易呗云支付DEMO .NET版本</h1>
                    <p>-------------------------------------------------------</p>

                    <h2>调用付款接口,构造以下表格</h2>

                </div>
            </div>

            <form class="form-horizontal" role="form" runat="server" method="POST">
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">商户号：</label>
                    <div class="col-sm-10">
                        <input type="text" name="ly_user_id" id="parter" class="form-control" value="<%:UserID %>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">商户私钥：</label>
                    <div class="col-sm-10">
                        <input type="text" id="key" class="form-control" aria-multiline="true" value="<%:PrivateKey %>" readonly="readonly" />
                        <label for="lastname" class="col-sm-2 control-label" style="color: red">请在配置文件中修改</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">订单号：</label>
                    <div class="col-sm-10">
                        <input size="30" type="text" name="ly_order_no" id="inp_orderno" value="<%:OrderNo %>" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">订单标题：</label>
                    <div class="col-sm-10">
                        <input size="30" type="text" name="ly_body" id="inp_body" value="订单测试" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">金&nbsp;&nbsp;额：</label>
                    <div class="col-sm-10">
                        <input size="30" type="text" name="ly_money" id="inp_price" value="<%:E8PayDemo.Util.CreateNumber.RandomString(1, 4) %>" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">支付方式：</label>
                    <div class="col-sm-10">
                        <select name="ly_trade_type" class="form-control">
                            <%
#if false
                                Response.Write("<option value='pay_alipay_h5code'>支付宝H5</option>");
                                Response.Write("<option value='pay_wxpay_h5code'>微信H5</option>");
                                Response.Write("<option value='pay_qpay_h5code' selected='selected'>QQ钱包H5</option>");
                                Response.Write("<option value='pay_bank_h5code'>网银WAP</option>");
                                Response.Write("<option value='pay_qpay_jsapicode'>QQ钱包公众号</option>");
                                Response.Write("<option value='pay_wxpay_jsapicode'>微信公众号</option>");
                                Response.Write("<option value='pay_alipay_h5code'>支付宝服务窗</option>");
                                Response.Write("<option value='pay_alipay_gatewaycode'>支付宝网关</option>");
                                Response.Write("<option value='pay_bank_code'>网银网关</option>");
                                Response.Write("<option value='pay_tenpay_code'>财付通网关</option>");
                                Response.Write("<option value='pay_alipay_code'>支付宝扫码</option>");
                                Response.Write("<option value='pay_wxpay_code'>微信扫码</option>");
                                Response.Write("<option value='pay_qpay_code'>QQ钱包扫码</option>");
#else
                                if ((IsAndroid || IsIOS) && !IsQQ && !IsWeXin && !IsAlipay)//手机访问
                                {
                                    Response.Write("<option value='pay_alipay_h5code'>支付宝H5</option>");
                                    Response.Write("<option value='pay_wxpay_h5code'>微信H5</option>");
                                    Response.Write("<option value='pay_qpay_h5code' selected='selected'>QQ钱包H5</option>");
                                    Response.Write("<option value='pay_bank_h5code'>网银WAP</option>");
                                }
                                else if (IsQQ)//QQ内访问
                                {
                                    Response.Write("<option value='pay_qpay_jsapicode'>QQ钱包公众号</option>");
                                }
                                else if (IsWeXin)//微信内访问
                                {
                                    Response.Write("<option value='pay_wxpay_jsapicode'>微信公众号</option>");
                                }
                                else if (IsAlipay)//支付宝访问
                                {
                                    Response.Write("<option value='pay_alipay_h5code'>支付宝服务窗</option>");
                                }
                                else
                                {
                                    Response.Write("<option value='pay_alipay_gatewaycode'>支付宝网关</option>");
                                    Response.Write("<option value='pay_bank_code'>网银网关</option>");
                                    Response.Write("<option value='pay_tenpay_code'>财付通网关</option>");
                                    Response.Write("<option value='pay_alipay_code'>支付宝扫码</option>");
                                    Response.Write("<option value='pay_wxpay_code'>微信扫码</option>");
                                    Response.Write("<option value='pay_qpay_code'>QQ钱包扫码</option>");
                                }
#endif
                            %>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">同步返回地址：</label>
                    <div class="col-sm-10">
                        <input size="50" type="text" name="ly_return_url" id="inp_RecefiveUrl" class="form-control" value="<%:ReturnUrl%>" />
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">异步返回地址： </label>
                    <div class="col-sm-10">
                        <input size="50" type="text" name="ly_notify_url" id="inp_NotifyUrl" value="<%:NotifyUrl %>" class="form-control" />
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">商户订单备注：</label>
                    <div class="col-sm-10">
                        <input size="50" type="text" name="ly_notes" id="remark" class="form-control" />
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">订单支付加密方式：</label>
                    <div class="col-sm-10">
                        <select name="ly_sign_type" class="form-control">
                            <option value="RSA2" selected="selected">RSA2</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">是否直反二维码：</label>
                    <div class="col-sm-10">
                        <select name="ly_scan_code" class="form-control">
                            <option value="true">是</option>
                            <option value="false" selected="selected">否</option>
                        </select>
                    </div>
                </div>



                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">是否显示成功页面：</label>
                    <div class="col-sm-10">
                        <select name="ly_skip_not_page" class="form-control">
                            <option value="true">是</option>
                            <option value="false" selected="selected">否</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-lg btn-danger">点我提交付款</button>
                    </div>
                </div>

            </form>

        </div>


    </div>


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</body>
</html>
