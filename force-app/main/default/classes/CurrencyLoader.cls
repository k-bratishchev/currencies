global class CurrencyLoader implements Schedulable {
    global void execute(SchedulableContext ctx) {
        CurrencyService curService = new CurrencyService();
        String value = curService.getFromRatesApi();
        curService.putCache(value);
    }
}