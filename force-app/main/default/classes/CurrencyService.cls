public class CurrencyService {

    public String getRates() {
        String value = this.getCached();
        if (value == null) {
            value = this.getFromRatesApi();
            this.putCache(value);
        }

        return value;
    }

    private String getCached() {
        Cache.OrgPartition orgPart = Cache.Org.getPartition('local.CurrencyCache');
        String cachedRates = (String)orgPart.get('currencyRate');

        return cachedRates;
    }

    public String getFromRatesApi() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.ratesapi.io/api/latest');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            return response.getBody();
        }

        return null;
    }

    public void putCache(String value) {
        Cache.OrgPartition orgPart = Cache.Org.getPartition('local.CurrencyCache');
        orgPart.put('currencyRate', value);
    }
}