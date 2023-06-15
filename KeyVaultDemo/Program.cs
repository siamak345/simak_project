using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Azure.KeyVault;
using Microsoft.Azure.Services.AppAuthentication;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace KeyVaultDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }


    //    public static IHostBuilder CreateHostBuilder(string[] args) =>
    //        Host.CreateDefaultBuilder(args)
    //            .ConfigureAppConfiguration((context, config) =>
    //            {
    //                var keyVaultEndpoint = GetKeyVaultEndpoint();
    //                if (!string.IsNullOrEmpty(keyVaultEndpoint))
    //                {
    //                    var azureServiceTokenProvider = new AzureServiceTokenProvider();
    //                    var keyVaultClient = new KeyVaultClient(
    //                        new KeyVaultClient.AuthenticationCallback(
    //                            azureServiceTokenProvider.KeyVaultTokenCallback));
    //                    config.AddAzureKeyVault(keyVaultEndpoint, keyVaultClient, new DefaultKeyVaultSecretManager());
    //                }
    //            })
    //            .ConfigureWebHostDefaults(webBuilder =>
    //            {
    //                webBuilder.UseStartup<Startup>();
    //            });

    //    private static string GetKeyVaultEndpoint() => "https://<<your-key-vault>>.vault.azure.net";
    //}
    public static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args).
            ConfigureWebHostDefaults(x => x.UseStartup<Startup>());
        }

    }
}
