using Domain.Common;

namespace Domain.Entities
{
    public class User : AuditableBaseEntity
    {
        private int _edad;
        public int UserId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string? SecondLastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string numberPhone { get; set; }
        public string Document { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int DocumentTypeId { get; set; }
        public int? AddressId { get; set; }
        public int RolId { get; set; }
        public int Edad
        {
            get
            {
                if (this._edad <= 0)
                {
                    this._edad = new DateTime(DateTime.Now.Subtract(DateOfBirth).Ticks).Year - 1;
                }
                return this._edad;
            }

        }
    }
}
