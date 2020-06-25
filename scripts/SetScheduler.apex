CurrencyLoader loader = new CurrencyLoader();
String sch = '0 0 * * * ?'; 
String jobID = system.schedule('Update Currencies', sch, loader);

//для запуска каждые 10 минут интернеты предлагают сделать 6 таких задач, но это скажется на лимитах
// CurrencyLoader loader = new CurrencyLoader();
// String sch = '0 10 * * * ?'; 
// String jobID = system.schedule('Update Currencies', sch, loader);
// 
// CurrencyLoader loader = new CurrencyLoader();
// String sch = '0 20 * * * ?'; 
// String jobID = system.schedule('Update Currencies', sch, loader);
// 
// и так далее, мне кажется, что должен быть способ получше, но пока не нашёл
