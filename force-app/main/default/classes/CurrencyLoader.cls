global class CurrencyLoader implements Schedulable {
    global void execute(SchedulableContext ctx) {
        this.update();
    }
    
    @future
    public void update() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.ratesapi.io/api/latest');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Cache.OrgPartition orgPart = Cache.Org.getPartition('local.CurrencyCache');
            orgPart.put('currencyRate', response.getBody());
        }    
    }
}
