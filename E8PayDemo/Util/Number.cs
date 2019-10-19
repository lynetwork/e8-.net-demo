using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E8PayDemo.Util
{
    /// <summary>
    /// 压缩ID(ID加密)
    /// </summary>
    public class Number
    {
        static string Characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

        static Random random = new Random(5000);

        /// <summary>
        /// 压缩ID标识
        /// </summary>
        /// <param name="number"></param>
        /// <returns></returns>
        public static string Short(long number)
        {
            string val = "";
            try
            {
                List<string> result = new List<string>();
                long t = number;
                while (t > 0)
                {
                    var mod = t % Characters.Length;
                    t = Math.Abs(t / Characters.Length);
                    var character = Characters[Convert.ToInt32(mod)].ToString();
                    result.Insert(0, character);
                }
                val = string.Join("", result.ToArray());
            }
            catch
            {
            }
            return val;
        }

        /// <summary>
        /// 还原ID标识
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static long UnShort(string str)
        {
            long result = 0;
            try
            {
                int j = 0;
                char[] arr = str.ToCharArray();
                Array.Reverse(arr);
                foreach (var ch in new string(arr))
                {
                    if (Characters.Contains(ch.ToString()))
                    {
                        result += Characters.IndexOf(ch) * ((long)Math.Pow(Characters.Length, j));
                        j++;
                    }
                }
            }
            catch
            {
            }
            return result;
        }


        private static object thisLock = new object();

        /// <summary>
        /// 生成平台单编号  年月日+时分秒+毫秒
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public static string GetAPIBillNo(string UserInfoID = "")
        {
            lock (thisLock)
            {
                //年月日时分秒
                DateTime dt = DateTime.Now;
                string v_ymd = dt.ToString("yyMMdd"); // yyyyMMdd
                string timeStr = dt.ToString("HHmmss"); // HHmmss
                string fffStr = CreateNumber.RandomString(1, 5);
                string billno_up = v_ymd + UserInfoID.Trim() + timeStr + fffStr;
                return billno_up;
            }
        }

        public static int GetMoney()
        {
            return random.Next(1, 5000);
        }

        /// <summary>
        /// 结算订单号
        /// </summary>
        /// <returns></returns>
        public static string GetPAYBillNo()
        {
            lock (thisLock)
            {
                //年月日时分秒
                DateTime dt = DateTime.Now;
                string v_ymd = dt.ToString("yyMMdd"); // yyyyMMdd
                string timeStr = dt.ToString("HHmmss"); // HHmmss
                string fffStr = CreateNumber.RandomString(1, 5);
                string billno_up = "8" + v_ymd + timeStr + fffStr;
                return billno_up;
            }
        }
        /// <summary>
        /// 财付通订单号
        /// </summary>
        /// <param name="customerID"></param>
        /// <returns></returns>
        public static string GetTenPayBillno(string customerID)
        {
            TimeSpan ts = DateTime.Now - TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            string orderId = customerID + DateTime.Now.ToString("yyyyMMdd") + Convert.ToUInt32(ts.TotalSeconds);
            return orderId;
        }
    }
}