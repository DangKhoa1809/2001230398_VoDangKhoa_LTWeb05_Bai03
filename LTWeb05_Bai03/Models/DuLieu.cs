using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LTWeb05_Bai03.Models
{
	public class DuLieu
	{
		static string strcon = "Data Source=DESKTOP-35G9FET\\SQLEXPRESS;Database=QL_DTDD1;User ID=sa;Password=khoa18092005";
		SqlConnection con = new SqlConnection(strcon);

		public List<Loai> dsLoai = new List<Loai>();
		public void ThietLap_DSLoai()
		{
			SqlDataAdapter da = new SqlDataAdapter("SELECT*FROM LOAI", con);
			DataTable dt = new DataTable();
			da.Fill(dt);

			foreach (DataRow dr in dt.Rows)
			{
				var loai = new Loai();
				loai.MaLoai = int.Parse(dr["MaLoai"].ToString());
				loai.TenLoai = dr["TenLoai"].ToString();

				dsLoai.Add(loai);
			}
		}

		public List<SanPham> dsSP = new List<SanPham>();
		public void ThietLap_DSSP()
		{
			SqlDataAdapter da = new SqlDataAdapter("SELECT*FROM SANPHAM", con);
			DataTable dt = new DataTable();
			da.Fill(dt);

			foreach(DataRow dr in dt.Rows)
			{
				var sp = new SanPham();
				sp.MaSP = int.Parse(dr["MaSP"].ToString());
				sp.TenSP = dr["TenSP"].ToString();
				sp.DuongDan = dr["DuongDan"].ToString();
				sp.Gia = decimal.Parse(dr["Gia"].ToString());
				sp.MoTa = dr["MoTa"].ToString();
                sp.MaLoai = int.Parse(dr["MaLoai"].ToString());

				dsSP.Add(sp);
            }
		}

		public List<KhachHang> dsKH = new List<KhachHang>();
		public void ThietLap_DSKH()
		{
			SqlDataAdapter da = new SqlDataAdapter("SELECT*FROM KHACHHANG", con);
			DataTable dt = new DataTable();
			da.Fill(dt);

			foreach(DataRow dr in dt.Rows)
			{
				var kh = new KhachHang();
				kh.MaKH = int.Parse(dr["MAKH"].ToString());
				kh.HoTen = dr["HOTEN"].ToString();
				kh.DienThoai = dr["DIENTHOAI"].ToString();
				kh.GioiTinh = dr["GIOITINH"].ToString();
				kh.SoThich = dr["SOTHICH"].ToString();
				kh.Email = dr["EMAIL"].ToString();
				kh.MatKhau = dr["MATKHAU"].ToString();

				dsKH.Add(kh);
			}
		}

		public List<GioHang> dsGH = new List<GioHang>();
		public void ThietLap_DSGH()
		{
			SqlDataAdapter da = new SqlDataAdapter("SELECT*FROM GIOHANG", con);
			DataTable dt = new DataTable();
			da.Fill(dt);

            foreach(DataRow dr in dt.Rows)
            {
				var gh = new GioHang();
				gh.MaGH = int.Parse(dr["MAGH"].ToString());
				gh.MaKH = int.Parse(dr["MAKH"].ToString());
				gh.MaSP = int.Parse(dr["MASP"].ToString());
				gh.SoLuong = int.Parse(dr["SOLUONG"].ToString());
				gh.Ngay = DateTime.Parse(dr["NGAY"].ToString());

				dsGH.Add(gh);
            }
        }

		public DuLieu()
		{
			ThietLap_DSLoai();
			ThietLap_DSSP();
			ThietLap_DSKH();
			ThietLap_DSGH();
		}
    }
}