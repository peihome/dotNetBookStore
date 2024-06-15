using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace SuryaPrakashNagarajan_BookStore
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            
            routes.MapPageRoute("Login", "", "~/Login.aspx");
            routes.MapPageRoute("Products", "Products", "~/view/Products.aspx");
            routes.MapPageRoute("Cart", "Cart", "~/view/Cart.aspx");
            routes.MapPageRoute("Checkout", "Checkout", "~/view/Checkout.aspx");
            routes.MapPageRoute("Success", "Success", "~/view/Success.aspx");
            routes.MapPageRoute("Logout", "Logout", "~/view/Logout.aspx");
        }
    }
}
