using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;

namespace PingUtil.Lib
{
    public static class Pinger
    {
        public static string PingHost(string host)
        {
            var address = Dns.GetHostEntry(host).AddressList.First();

            try
            {
                var pingReply = new Ping().Send(address, 1000, new byte[32], new PingOptions(128, true));

                if (pingReply != null)
                {
                    switch (pingReply.Status)
                    {
                        case IPStatus.Success:
                            return string.Format("Reply from {0}: bytes={1} time={2}ms TTL={3}", pingReply.Address, pingReply.Buffer.Length, pingReply.RoundtripTime, pingReply.Options.Ttl);

                        case IPStatus.TimedOut:
                            return "Connection has timed out...";

                        default:
                            return string.Format("Ping failed: {0}", pingReply.Status.ToString());
                    }
                }
                else
                    return "Connection failed";
            }
            catch (PingException ex)
            {
                return string.Format("Connection Error: {0}", ex.Message);
            }
            catch (SocketException ex)
            {
                return string.Format("Connection Error: {0}", ex.Message);
            }

        }

    }
}