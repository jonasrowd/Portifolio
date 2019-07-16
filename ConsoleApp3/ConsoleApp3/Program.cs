using System;
using System.Net.Http;

namespace requestProdutos
{
    class produtos
    {
        static void Main(string[] args)
        {
            GetRequest("http://200.97.94.163:8082/api/LstProduto?maximumRows=5000&numberPage=5&dataHoraAtualizacao=2010-06-20T02%3A09%3A27.830Z");
            _ = Console.ReadKey();
        }
        async static void GetRequest(string url)
        {
            using (HttpClient lstprodutos = new HttpClient())
            {
                using (HttpResponseMessage resposta = await lstprodutos.GetAsync(url))
                {
                    using (HttpContent content = resposta.Content)
                    {
                        string mycontent = await content.ReadAsStringAsync();
                        Console.WriteLine(mycontent);
                    }
                }
            }
        }

    }
}
