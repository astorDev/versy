using System.Reflection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;

namespace Versy;

public class VersionProvider(IConfiguration configuration)
{
    public string Get()
    {
        return 
            configuration["Version"] ??
            Assembly.GetExecutingAssembly().GetName().Version?.ToString() ?? 
            "Unknown";
    }
}

public static class Registrator
{
    public static IServiceCollection AddVersionProvider(this IServiceCollection services)
    {
        services.AddSingleton<VersionProvider>();
        return services;
    }
}