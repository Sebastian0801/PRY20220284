using Microsoft.AspNetCore.Mvc;
using BL;
using DA;
using System.Security.Claims;
using BE;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;

namespace Wallet_Administrador.Controllers
{
    public class AccountController : Controller
    {
        private readonly BLUsuarios _BLUsuarios = new BLUsuarios();

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string correo, string contraseña)
        {
            //Validar nulos
            if(correo == "" && contraseña == "")
            {
                TempData["mensaje"] = "Error1";
                return View();
            }

            contraseña = Crypt.Encrypt(contraseña);

            var rpta = _BLUsuarios.ValidarUsuario(correo, contraseña);
            if (rpta == null)
            {
                TempData["mensaje"] = "Error2";
                return View();
            }

            _ = ActivarPerfil(rpta);

            return RedirectToAction("Dashboard", "Panel");
        }

        public async Task<bool> ActivarPerfil(BEUsuarios beusuario)
        {
            var claims = new List<Claim>{};
            string valorRol = rol(beusuario.tipo);
            claims.Add(new Claim(ClaimTypes.Role, valorRol));

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            Thread.CurrentPrincipal = claimsPrincipal;

            HttpContext.Session.SetString("Usuario", beusuario.nombres+" "+beusuario.apellidos);
            HttpContext.Session.SetInt32("idUsuario", beusuario.id);
            HttpContext.Session.SetInt32("tipoUsuario", beusuario.tipo);

            return true;
        }

        public string rol(int idRol)
        {
            switch (idRol)
            {
                case 2:
                    return "Super Administrador";
                case 3:
                    return "Administrador";
                default:
                    return "Usuario";
            }
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction("Login");
        }
    }
}
