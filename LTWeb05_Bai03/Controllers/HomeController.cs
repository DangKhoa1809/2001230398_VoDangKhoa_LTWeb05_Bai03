using LTWeb05_Bai03.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTWeb05_Bai03.Controllers
{
    public class HomeController : Controller
    {
        DuLieu csdl = new DuLieu();

       public ActionResult DanhSachLoai()
       {
            List<Loai> ds = csdl.dsLoai;
            return View(ds);
       }

        public ActionResult DanhSachSanPham()
        {
            List<SanPham> ds = csdl.dsSP;
            return View(ds);
        }
    }
}