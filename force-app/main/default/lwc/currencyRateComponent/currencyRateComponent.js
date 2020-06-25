import { LightningElement, wire } from 'lwc';

import getRates from '@salesforce/apex/CurrencyController.getRates';

const columns = [
    { label: 'Symbol', fieldName: 'symbol' },
    { label: 'Value', fieldName: 'value' }
];

export default class BasicDatatable extends LightningElement {
    data = [];
    columns = columns;
    base;
    date;

    @wire(getRates)
    loadRates(result) {
        if (result.data) {
            const currencyData = JSON.parse(result.data);
            this.base = currencyData.base;
            this.date = currencyData.date;
            let tempData = [];

            Object.keys(currencyData.rates).forEach(function(symbol) {
                tempData.push({
                    symbol: symbol,
                    value: currencyData.rates[symbol].toString()
                })
            })

            this.data = tempData;
        }
    }
}