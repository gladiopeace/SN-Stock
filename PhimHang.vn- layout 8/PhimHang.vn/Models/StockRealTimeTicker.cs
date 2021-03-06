﻿using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PhimHang.Hubs;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Data.Entity;
using System.Diagnostics;

namespace PhimHang.Models
{
    public class StockRealTimeTicker
    {
        // Singleton instance
        private readonly static Lazy<StockRealTimeTicker> _instance = new Lazy<StockRealTimeTicker>(() => new StockRealTimeTicker());//=> new StockRealTimeTicker(GlobalHost.ConnectionManager.GetHubContext<RealTimePriceHub>().Clients));
        private readonly static List<StockRealTime> _stocks = new List<StockRealTime>();
        //private string _stockSymbol = "";

        private readonly object _updateStockPricesLock = new object();

        //stock can go up or down by a percentage of this factor on each change        

        private readonly TimeSpan _updateInterval = TimeSpan.FromMilliseconds(60000);
        //private readonly Random _updateOrNotRandom = new Random();

        private readonly Timer _timer;
        private volatile bool _updatingStockPrices = false;
        private StockRealTimeTicker()
        {
            GetStockPriceFromApi();
            _timer = new Timer(UpdateStockPrices, null, _updateInterval, _updateInterval);

        }

        public static StockRealTimeTicker Instance
        {
            get
            {
                return _instance.Value;
            }
        }

        public async Task<StockRealTime> GetStocksByTicker(string stock)
        {
            var CompanyResult = Task.FromResult(_stocks.FirstOrDefault(s => s.CompanyID.ToUpper() == stock.ToUpper()));
            return await CompanyResult;
        }

        public Task<IEnumerable<StockRealTime>> GetIndexList()
        {
            var listPriority = new List<string> { "VNINDEX", "VN30", "HNXINDEX", "HNX30" };
            var listPriorityResult = (from s in _stocks
                                      where s.Type == "I" && listPriority.Contains(s.CompanyID) // 
                                      select s);

            var listResult = (from s in _stocks
                              where s.Type == "I" && !listPriority.Contains(s.CompanyID) // 
                              select s);

            return Task.FromResult(listPriorityResult.Union(listResult));
        }

        public Task<List<StockRealTime>> GetAllStocksList(List<string> stock)
        {
            // Create new stopwatch
            //Stopwatch stopwatch = new Stopwatch();
            //stopwatch.Start();
            //stopwatch.Stop();
            //var dsafd = stopwatch.Elapsed;
            var CompanyResult = (from s in _stocks
                                 orderby s.CompanyID ascending
                                 where stock.Contains(s.CompanyID)
                                 select s);

            //var CompanyResult = Task.FromResult(_stocks.Where(s => stock.Any(sl => sl == s.CompanyID)).ToList());

            return Task.FromResult(CompanyResult.ToList()); ;
        }
        public Task<List<StockRealTime>> RandomStocksList(List<string> stock)
        {
            var stockListResult = (from s in _stocks
                                   orderby Guid.NewGuid()
                                   where !stock.Contains(s.CompanyID)
                                   select s).Take(10);
            return Task.FromResult(stockListResult.ToList());
        }
        public Task<List<StockRealTime>> RandomStocksList()
        {
            var stockListResult = (from s in _stocks
                                   orderby Guid.NewGuid()
                                   select s).Take(10);
            return Task.FromResult(stockListResult.ToList());
        }

        public IEnumerable<StockRealTime> TrenStocksList(List<string> listHotStox)
        {
            var listPriority = new List<string> { "VNINDEX", "VN30", "HNXINDEX", "HNX30" };
            // Get price of Index
            var listPriorityResult = (from s in _stocks
                                      where s.Type == "I" && listPriority.Contains(s.CompanyID) // 
                                      select s);
            //Get price of hot stox list
            var ListHotStoxResult = (from s in _stocks
                                     where listHotStox.Contains(s.CompanyID)
                                     select s);
            return ListHotStoxResult.Union(listPriorityResult);
        }

        public static bool CheckExistStock(string stock)
        {
            return Task.FromResult(_stocks.Count(st => st.CompanyID == stock) == 1).Result;
        }


        public async void GetStockPriceFromApi()
        {
            Uri uri = new Uri(AppHelper.GetPriceAPIUrl);
            using (var client = new HttpClient())
            {
                client.BaseAddress = uri;
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var parameter = new { PI_tickerList = "KEYSECRET" };

                try
                {
                    var response = client.PostAsJsonAsync("/api/StockRealTime", "").Result;
                    if (response.IsSuccessStatusCode)
                    {
                        var list = await response.Content.ReadAsAsync<List<StockRealTime>>();
                        if (list.Count > 0)
                        {
                            _stocks.Clear();
                            list.ForEach(stock => _stocks.Add(stock));
                        }

                    }
                    else
                    {
                        // contine backup URL
                        //var s = client.GetStringAsync("http://stockboard.sbsc.com.vn/HO.ashx?FileName=0");
                        //var arrayS = s.Result.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
                    }
                }
                catch (Exception)
                {

                }

            }
        }

        private void UpdateStockPrices(object state)
        {
            lock (_updateStockPricesLock)
            {
                if (!_updatingStockPrices)
                {
                    _updatingStockPrices = true;
                    GetStockPriceFromApi();
                    _updatingStockPrices = false;
                }
            }
        }

    }
}