using FluentValidation.Results;

namespace Application.Execteptions
{
    public class ValidationExeption : Exception
    {
        public ValidationExeption() :base(MessageErros.ValidationMessage)
        { 
            Errors = new List<string>();
        }
        public List<string> Errors { get;}

        public ValidationExeption(IEnumerable<ValidationFailure> failures) : this()
        {
            foreach (var failure in failures)
            {
                Errors.Add(failure.ErrorMessage);
            }
        }
    }
}
