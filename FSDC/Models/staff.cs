//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FSDC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public staff()
        {
            this.staff_projects = new HashSet<staff_projects>();
        }
    
        public int staff_id { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public int position_id { get; set; }
        public Nullable<int> project_id { get; set; }
    
        public virtual position position { get; set; }
        public virtual project project { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<staff_projects> staff_projects { get; set; }
    }
}
