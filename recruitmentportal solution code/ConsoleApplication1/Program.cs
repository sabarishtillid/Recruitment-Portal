using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            //Create a pdf document.
            PdfDocument doc = new PdfDocument();
            String url = "http://www.london2012.com/news/articles/paralympic-torch-relay-route-revealed-1258473.html";
            doc.LoadFromHTML(url, false, true, true);
            //Save pdf file.
            doc.SaveToFile("sample.pdf");
            doc.Close();
            //Launching the Pdf file.
            System.Diagnostics.Process.Start("sample.pdf");
        }
    }
}
