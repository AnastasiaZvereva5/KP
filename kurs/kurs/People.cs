//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace kurs
{
    using System;
    using System.Collections.Generic;
    
    public partial class People
    {
        public int id { get; set; }
        public string book_name { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string patronymic { get; set; }
        public string genre { get; set; }
        public Nullable<int> Pages { get; set; }
        public Nullable<int> Cost { get; set; }
        public Nullable<System.DateTime> date_issue { get; set; }
        public Nullable<System.DateTime> date_admission { get; set; }
        public Nullable<bool> book_availability { get; set; }
    }
}
