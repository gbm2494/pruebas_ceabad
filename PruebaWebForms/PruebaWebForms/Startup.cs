using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PruebaWebForms.Startup))]
namespace PruebaWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
