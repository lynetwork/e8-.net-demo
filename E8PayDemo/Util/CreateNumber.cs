using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E8PayDemo.Util
{

    public class CreateNumber
    {
        // static string Characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

        static Random r = new Random(DateTime.Now.Millisecond);
        static string Characters = "";

        /// <summary>
        /// 
        /// </summary>
        /// <param name="type">类别</param>
        /// <param name="length">长度</param>
        /// <returns></returns>
        public static string RandomString(int type, int length)
        {

            string number = "0123456789";
            string minEn = "abcdefghijklmnopqrstuvwxyz";
            string maxEn = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

            switch (type)
            {
                case 1: //纯数字
                    Characters = number;
                    break;
                case 2://小写英文
                    Characters = minEn;
                    break;
                case 3://大写英文
                    Characters = maxEn;
                    break;
                case 4://数字+小写英文
                    Characters = number + minEn;
                    break;
                case 5://数字+大写英文
                    Characters = number + maxEn;
                    break;
                case 6://数字+大小混合英文
                    Characters = number + minEn + maxEn;
                    break;
                default: //数字+大小混合英文
                    Characters = number + minEn + maxEn;
                    break;
            }

            string s = "";
            //随机数生成器
            for (int i = 0; i < length; i++)
            {
                Random rnd = new Random(GetRandomSeed());
                int index = rnd.Next(0, Characters.Length);
                s += Characters[index];
                if (i == 0 && s == "0")
                {
                    s = s.Replace("0", ReplaceNumber());
                }
            }
            return s;
        }


        /// <summary>
        /// 卡号或密码第一位如果是0，则自动其他非0的数字
        /// </summary>
        /// <returns></returns>
        static string ReplaceNumber()
        {
            string s = "";
            Random rnd = new Random(GetRandomSeed());
            int index = rnd.Next(0, Characters.Length);
            s += Characters[index];
            return s;
        }


        static int GetRandomSeed()
        {
            byte[] bytes = new byte[4];
            System.Security.Cryptography.RNGCryptoServiceProvider rng = new System.Security.Cryptography.RNGCryptoServiceProvider();
            rng.GetBytes(bytes);
            return BitConverter.ToInt32(bytes, 0);
        }
    }
}