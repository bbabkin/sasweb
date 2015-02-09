$(function () {

    $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?', function (data) {
        // Create the chart
        $('#saschart').highcharts('StockChart', {


            rangeSelector : {
                selected : 1
            },

            title : {
                text : 'St. Andrew Goldfields Stock Performance'
            },

            series : [{
                name : 'T.SAS',
                data : data,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    });

});