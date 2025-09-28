using LTWeb05_Bai03.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTWeb05_Bai03.Controllers
{
    public class SanPhamController : Controller
    {
        DuLieu dl = new DuLieu();

        public ActionResult SanPham_Loai(int? maloai)
        {
            var ds = dl.dsSP;

            if (maloai.HasValue)
            {
                ds = ds.Where(sp => sp.MaLoai == maloai.Value).ToList();
            }

            ViewBag.Loai = dl.dsLoai;
            return View(ds);
        }

        public ActionResult TimKiemSanPham(string keyword)
        {
            DuLieu dl = new DuLieu();
            var dsSP = dl.dsSP;

            if (!string.IsNullOrEmpty(keyword))
            {
                dsSP = dsSP.Where(s => s.TenSP.ToLower().Contains(keyword.ToLower())).ToList();
            }

            return View(dsSP); 
        }

        public ActionResult TimKiemTheoLoai(int? maloai)
        {
            DuLieu dl = new DuLieu();

            ViewBag.Loai = dl.dsLoai;

            List<SanPham> kq = new List<SanPham>();

            if (maloai != null)
            {
                kq = dl.dsSP.Where(sp => sp.MaLoai == maloai).ToList();
            }

            return View(kq);
        }

    }
}