using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDC.Models;

namespace FSDC.Controllers
{
    public class staffsController : Controller
    {
        private FSDCEntities db = new FSDCEntities();

        public ActionResult AssignProject(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            staff staff = db.staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            Session["staff_id"] = id;
            ViewBag.position_id = new SelectList(db.positions, "position_id", "prosition_name");
            ViewBag.project_id = new SelectList(db.projects, "project_id", "project_name");

            return View(staff);
        }

        public ActionResult Assign(staff obj, int[] projeclist)
        {
            
            if (obj == null)
            {
                return HttpNotFound();
            }
            else
            {
                //update database
                int Sid = Convert.ToInt32( Session["staff_id"]);
                int cnt = 0;
                staff_projects projects = new staff_projects();

                staff staff = db.staffs.Find(Sid);

                foreach (var p in projeclist)
                {
                    projects.project_id = p;
                    projects.staff_id = Sid;

                  db.staff_projects.Add(projects);
                  db.SaveChanges();

                    cnt = cnt + 1;
                }

                TempData["success"] = cnt+" new project(s) added to " + staff.fname + " " + staff.lname + " profile.";
                return RedirectToAction("AssignProject", new { id=Sid});

            }
        }


        // GET: staffs
        public ActionResult Index()
        {
            var staffs = db.staffs.Include(s => s.position).Include(s => s.project);
            return View(staffs.ToList());
        }

        // GET: staffs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            staff staff = db.staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            return View("_DetailPartial",staff);
        }

        // GET: staffs/Create
        public ActionResult Create()
        {
            ViewBag.position_id = new SelectList(db.positions, "position_id", "prosition_name");
            ViewBag.project_id = new SelectList(db.projects.OrderBy(p => p.project_name), "project_id", "project_name");
            return View("_CreatePartial");
        }

        // POST: staffs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "staff_id,fname,lname,position_id,project_id")] staff staff)
        {
            if (ModelState.IsValid)
            {
                db.staffs.Add(staff);
                db.SaveChanges();

                TempData["success"] = "Staff " + staff.fname + " " + staff.lname + " was created successfully.";
                return RedirectToAction("Index");
            }

            ViewBag.position_id = new SelectList(db.positions, "position_id", "prosition_name", staff.position_id);
            ViewBag.project_id = new SelectList(db.projects.OrderBy(p=>p.project_name), "project_id", "project_name", staff.project_id);
            
            return View(staff);
        }

        // GET: staffs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            staff staff = db.staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            ViewBag.position_id = new SelectList(db.positions, "position_id", "prosition_name", staff.position_id);
            ViewBag.project_id = new SelectList(db.projects.OrderBy(p => p.project_name), "project_id", "project_name", staff.project_id);
            return PartialView("_EditPartial", staff);
        }

        // POST: staffs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "staff_id,fname,lname,position_id,project_id")] staff staff)
        {
            if (ModelState.IsValid)
            {
                db.Entry(staff).State = EntityState.Modified;
                db.SaveChanges();

                TempData["success"] = "Staff " + staff.fname + " " + staff.lname + " was updated successfully.";
                return RedirectToAction("Index");
            }
            ViewBag.position_id = new SelectList(db.positions, "position_id", "prosition_name", staff.position_id);
            ViewBag.project_id = new SelectList(db.projects, "project_id", "project_name", staff.project_id);
            return View(staff);
        }

        // GET: staffs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            staff staff = db.staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            return View("_DeletePartial",staff);
        }

        // POST: staffs/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            staff staff = db.staffs.Find(id);
            db.staffs.Remove(staff);
            db.SaveChanges();

            TempData["success"] = "Staff " + staff.fname + " " + staff.lname + " has been removed.";
            return RedirectToAction("Index");
        }

        //Delete project from staff
       
        public ActionResult DeleteProject(int id)
        {
            int sId = Convert.ToInt32(Session["staff_id"]);
            staff_projects project = db.staff_projects.Where(s=>s.staff_id == sId && s.project_id == id ).SingleOrDefault();

            if(project == null)
            {
                TempData["error"] = "An error has occurred while trying to remove the project " + project.project.project_name ;
            }
            else
            {
                TempData["success"] = "1 Project " + project.project.project_name + " has been removed.";

                db.staff_projects.Remove(project);
                db.SaveChanges();
            }



            return RedirectToAction("AssignProject",new {id=sId });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
