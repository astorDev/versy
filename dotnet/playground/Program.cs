using Versy.V0;

var builder = WebApplication.CreateBuilder(args);

// builder.Configuration.AddInMemoryCollection(new Dictionary<string, string?>() {
//     ["Version"] = "26"
// });

builder.Logging.AddSimpleConsole(c => c.SingleLine = true);

builder.Services.AddVersionProvider();

var app = builder.Build();

app.MapGet("/", (VersionProvider version) => new {
    Version = version.Get()
});

app.Run();