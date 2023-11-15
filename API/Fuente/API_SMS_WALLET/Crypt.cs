﻿using System.Security.Cryptography;
using System.Text;

namespace API_SMS_WALLET
{
    public class Crypt
    {
        //public const string strPassword = "LetMeIn99$";

        // set permutations
        public const String strPermutation = "ouiveyxaqtd";
        public const Int32 bytePermutation1 = 0x19;
        public const Int32 bytePermutation2 = 0x59;
        public const Int32 bytePermutation3 = 0x17;
        public const Int32 bytePermutation4 = 0x41;

        // encoding
        public static string Encrypt(string strData)
        {

            return Convert.ToBase64String(Encrypt(Encoding.UTF8.GetBytes(strData)));
            // reference https://msdn.microsoft.com/en-us/library/ds4kkd55(v=vs.110).aspx

        }


        // decoding
        public static string Decrypt(string strData)
        {
            return Encoding.UTF8.GetString(Decrypt(Convert.FromBase64String(strData)));
            // reference https://msdn.microsoft.com/en-us/library/system.convert.frombase64string(v=vs.110).aspx

        }

        // encrypt
        public static byte[] Encrypt(byte[] strData)
        {
            PasswordDeriveBytes passbytes =
            new PasswordDeriveBytes(Crypt.strPermutation,
            new byte[] { Crypt.bytePermutation1,
                         Crypt.bytePermutation2,
                         Crypt.bytePermutation3,
                         Crypt.bytePermutation4
            });

            MemoryStream memstream = new MemoryStream();
            Aes aes = new AesManaged();
            aes.Key = passbytes.GetBytes(aes.KeySize / 8);
            aes.IV = passbytes.GetBytes(aes.BlockSize / 8);

            CryptoStream cryptostream = new CryptoStream(memstream,
            aes.CreateEncryptor(), CryptoStreamMode.Write);
            cryptostream.Write(strData, 0, strData.Length);
            cryptostream.Close();
            return memstream.ToArray();
        }

        // decrypt
        public static byte[] Decrypt(byte[] strData)
        {
            PasswordDeriveBytes passbytes =
            new PasswordDeriveBytes(Crypt.strPermutation,
            new byte[] { Crypt.bytePermutation1,
                         Crypt.bytePermutation2,
                         Crypt.bytePermutation3,
                         Crypt.bytePermutation4
            });

            MemoryStream memstream = new MemoryStream();
            Aes aes = new AesManaged();
            aes.Key = passbytes.GetBytes(aes.KeySize / 8);
            aes.IV = passbytes.GetBytes(aes.BlockSize / 8);

            CryptoStream cryptostream = new CryptoStream(memstream,
            aes.CreateDecryptor(), CryptoStreamMode.Write);
            cryptostream.Write(strData, 0, strData.Length);
            cryptostream.Close();
            return memstream.ToArray();
        }
    }
}
