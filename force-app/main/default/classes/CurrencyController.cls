public class CurrencyController {

    @AuraEnabled(cacheable=true)
    public static String getRates() {
        return new CurrencyService().getRates();
    }
}