using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Mobile8185.Startup))]
namespace Mobile8185
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
