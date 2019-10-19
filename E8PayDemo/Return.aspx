<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Return.aspx.cs" Inherits="E8PayDemo.Return" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>易呗云支付-DEMO</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


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

                    <h2>同步通知接口</h2>

                    <p>-------------------------------------------------------</p>

                    <div class="col-sm-12 text-center">
                        <label for="lastname" class="col-sm-6 control-label">付款金额：</label>
                        <div class="col-sm-6">
                            <label for="lastname" class="col-sm-6 control-label"><%:(Money/100) %>元</label>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <label for="lastname" class="col-sm-6 control-label">系统单号：</label>
                        <div class="col-sm-6">
                            <label for="lastname" class="col-sm-6 control-label"><%:UserOrderNo %></label>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <label for="lastname" class="col-sm-6 control-label">上级单号：</label>
                        <div class="col-sm-6">
                            <label for="lastname" class="col-sm-6 control-label"><%:SysOrderNo %></label>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <label for="lastname" class="col-sm-6 control-label">付款状态：</label>
                        <div class="col-sm-6">
                            <label for="lastname" class="col-sm-6 control-label"><%:Status %></label>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <label for="lastname" class="col-sm-6 control-label">验签状态：</label>
                        <div class="col-sm-6">
                            <label for="lastname" class="col-sm-6 control-label"><%:IsSign %></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

